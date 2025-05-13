import json
import random
import re
from datetime import datetime

import pandas as pd

from database_helper import handle_ticket_booking, LayMaSuatChieu
import movie_recommendation
import booking_ticket

def load_intents(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        return json.load(file)

intents = load_intents('intents.json')

def get_random_response(tag, **kwargs):
    for intent in intents['intents']:
        if intent['tag'] == tag:
            response = random.choice(intent['responses'])
            return response.format(**kwargs)
    return "Tứ Trụ Cinema will always be ready to assist you, feel free to explain again ❤"

def match_intent(user_input):
    print(user_input)
    # Biểu thức chính quy để nhận dạng các định dạng giờ và ngày với giây
    showtime_pattern = r"(\d{2}:\d{2}:\d{2})\s*(ngày\s*(\d{2}[-/]\d{2}[-/]\d{4}|\d{2}/\d{2}/\d{4}|\d{2}-\d{2}-\d{4}|\d{4}-\d{2}-\d{2}))?"

    for intent in intents['intents']:
        for pattern in intent['patterns']:
            if "{showtime}" in pattern:
                match = re.search(showtime_pattern, user_input)
                if match:
                    extracted_time = match.group(1)  # Lấy giờ có giây
                    extracted_date = match.group(2) if match.group(2) else None  # Lấy ngày nếu có
                    print(f"Extracted Time: {extracted_time}, Extracted Date: {extracted_date}")  # In để kiểm tra

                    # Chuẩn hóa ngày nếu có
                    if extracted_date:
                        # Loại bỏ "ngày" và chuẩn hóa dấu gạch ngang thành gạch chéo
                        extracted_date = re.sub(r'ngày\s*', '', extracted_date)  # Xóa từ "ngày"
                    return intent['tag'], extracted_time, extracted_date
            elif intent['tag'] == "movie_suggestions":
                if re.search(pattern, user_input, re.IGNORECASE):
                    return intent['tag'], None, None

    return "fallback", None, None

def suggest_movies_on_start(user_input, user_id, current_context):
    intent_tag, showtime, date_show = match_intent(user_input)

    if intent_tag == "movie_suggestions":
        recommendations = movie_recommendation.get_random_recommendations(user_id)
        grouped_movies = movie_recommendation.group_movies_by_datetime_and_branch(recommendations)

        if grouped_movies:
            response = get_random_response("movie_suggestions")
            for branch, movies_in_branch in grouped_movies.items():
                response += f"""<div>
                    Branch <b><span style="color: red;">{branch}</span></b>
                </div>"""

                for datetime_key, movie_details in movies_in_branch.items():
                    movie_name = movie_details['movie_name']
                    movie_time = movie_details['movie_time']
                    movie_date = movie_details['movie_date']

                    movie_info = f"🎞 Movie: <b>{movie_name} </b><br>"
                    movie_info += f"Time: <b>{movie_time}</b> ngày <b>{movie_date}</b> <br>"

                    response += movie_info

            response += "Which showtime would you like to select? <br>"

            current_context[0] = "select_showtime"
            current_context.append(grouped_movies)

            return response

        else:
            return "Currently, there are no matching movies. Don't worry, please choose another movie that's more suitable <3"

    elif intent_tag == "select_showtime":
        if len(current_context) > 1:
            showtime_to_movie = current_context[1]
            print(f"Showtime: {showtime}, Date: {date_show}")

            try:
                if date_show and showtime:  # Nếu có cả ngày và giờ
                    # Chuyển đổi showtime và date_show từ chuỗi về datetime
                    selected_time = datetime.strptime(showtime, "%H:%M:%S").time()
                    selected_date = datetime.strptime(date_show.replace("ngày", "").strip(), "%Y-%m-%d").date()

                    # In ra thời gian và ngày đã chuyển đổi
                    print(f"Converted Showtime: {selected_time}, Converted Date: {selected_date}")

                    # Duyệt qua các chi nhánh trong showtime_to_movie để tìm kiếm khóa (selected_date, selected_time)
                    for branch, movies_in_branch in showtime_to_movie.items():
                        print(f"Checking branch: {branch}")
                        if (selected_date, selected_time) in movies_in_branch:
                            selected_movie_name = movies_in_branch[(selected_date, selected_time)]['movie_name']
                            masc = LayMaSuatChieu(current_context, selected_movie_name, date_show, showtime)
                            return (
                                    handle_ticket_booking(user_id, selected_movie_name, selected_time)  +
                                    get_random_response("select_showtime", showtime=f"{selected_time} ngày {selected_date}")
                                    + f" <a href='http://localhost:9999/DoAnWebCinema/customer/payment/{masc}.htm'>Book your seat here 🥰</a>"
                            )

                    return f"Cannot find a showtime exactly matching {showtime}. Please choose again ❤"
                elif showtime and not date_show:
                    return "I don't have enough information to confirm the showtime for you, please provide more details ❤"
                elif date_show and not showtime:
                    return "I don't have enough information to confirm the showtime for you, please provide more details ❤"

            except ValueError:
                return "I'm sorry, I couldn't understand your request. Please clarify it for me ❤"

        return f"I'm sorry, but the showtime {showtime} is not valid. Please choose again ❤"

    else:
        return get_random_response("fallback")



def similar_movie(name, intent_list):
    if not intent_list:
        return "I'm truly sorry that I couldn't fully understand your request 😥"

    intent_tag = intent_list[0]['intent']
    for intent in intents['intents']:
        if intent['tag'] == intent_tag:
            response = random.choice(intent['responses'])
            if isinstance(name, pd.Series):
                name = name.iloc[0]  # Get the first element if it's a Series
            if name:
                response = response.replace("<TenPhimDeXuat>", name)
            return response

    return "I'm truly sorry that I couldn't fully understand your request 😥"

