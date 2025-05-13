import json
import random
import re

import unicodedata
from rapidfuzz import process
from unidecode import unidecode
import chromadb_training
import database_helper
import movie_suggestions

with open('intents.json', encoding='utf-8') as intents_file:
    intents_data = json.load(intents_file)

def extract_entities(sentence, compiled_entity_patterns):
    found_entities = {}
    for entity, patterns in compiled_entity_patterns.items():
        for pattern in patterns:
            if pattern.search(sentence):
                found_entities[entity] = pattern.pattern.strip(r'\b').strip(r'\\')
                break
    return found_entities

'''def process_booking_request(message, intent_predictions, recognized_entities, movie_name, current_context):
    if not recognized_entities:
        movie_name[0] = chromadb_training.search_stored_data(message,chromadb_training.phim_path)
        if movie_name[0] == None:
            intent_predictions = [{"intent": "dat_ve_khong_thuc_the", "probability": "1.0"}]
        else:
            intent_predictions = [{"intent": "khong_tim_thay_phim", "probability": "1.0"}]
    return booking_ticket_response(message,intent_predictions, recognized_entities, movie_name, current_context)'''


def normalize_string(s):
    return unicodedata.normalize('NFKC', s.strip().lower())

def process_booking_request(message, intent_predictions, recognized_entities, movie_name, current_context):
    if not recognized_entities:
        # Danh sách các tên phim có sẵn
        movie_list = database_helper.get_ten_phim()
        message_normalized = normalize_string(message)
        movie_list_normalized = [normalize_string(movie) for movie in movie_list]
        # Tìm kiếm tên phim gần giống nhất với câu người dùng nhập
        best_match = process.extractOne(message_normalized, movie_list_normalized)
        print(best_match)
        if best_match: # Gán tên phim tương tự vào movie_name
            if best_match[1] >= 90:
                movie_name[0] = best_match[0]
                intent_predictions = [{"intent": "dat_ve_co_thuc_the", "probability": "1.0"}]
            elif 90.0 > best_match[1] > 50.0:
                movie_name[0] = best_match[0]
                intent_predictions = [{"intent": "khong_tim_thay_phim", "probability": "1.0"}]
            else:
                intent_predictions = [{"intent": "dat_ve_khong_thuc_the", "probability": "1.0"}]
    return booking_ticket_response(message, intent_predictions, recognized_entities, movie_name, current_context)
'''
def booking_ticket_response(message, intent_list, entities, movie_name, current_context):
    if not intent_list:
        return "Xin lỗi, tôi chưa hiểu yêu cầu của bạn 3 ."

    intent_tag = intent_list[0]['intent']
    for intent in intents_data['intents']:
        if intent['tag'] == intent_tag:
            response = random.choice(intent['responses'])
            current_context[0] = "booking_ticket"

            if entities:
                for entity, value in entities.items():
                    value = value.replace("\\", "")  # Loại bỏ dấu gạch chéo ngược
                    print(entity, value)
                    response = response.replace(f"<{entity}>", value)
                    movie_name[0] = value
            elif movie_name[0] != None:
                response = response.replace("<TenPhim>", movie_name[0])
            if "<GioChieu>" in response:
                gio_ngay_chieu = database_helper.get_gio_ngay_chieu(movie_name[0])
                if gio_ngay_chieu:
                    index = 0
                    lich_chieu_temp = "<p>"  # Dùng <p> để ngắt dòng trong HTML
                    for gio_chieu in gio_ngay_chieu:
                        index += 1
                        lich_chieu_temp += f" - Lịch chiếu {index}: {gio_chieu} <br>"  # Thêm <br> để xuống dòng
                    lich_chieu_temp += "</p>"
                    response = response.replace("<GioChieu>", lich_chieu_temp)

                    lich_chieu_list = []
                    for index, gio_chieu in enumerate(gio_ngay_chieu, start=1):
                        lich_chieu_list.append({"LichChieu": index, "ThoiGian": gio_chieu})

                    # Tạo chuỗi lịch chiếu dưới dạng HTML để hiển thị trong phản hồi
                    lich_chieu_temp = "<p>" + "<br>".join(
                        [f"Lịch chiếu {item['LichChieu']}: {item['ThoiGian']}" for item in lich_chieu_list]
                    ) + "</p>"

                    response = response.replace("<GioChieu>", lich_chieu_temp)

                    # Ghi dữ liệu `lich_chieu_list` vào `temp.json`
                    try:
                        with open('temp.json', 'w', encoding='utf-8') as f:
                            json.dump({"lich_chieu": lich_chieu_list, "movie_name": movie_name[0]}, f,
                                      ensure_ascii=False, indent=4)
                    except Exception as e:
                        print(f"Lỗi khi ghi dữ liệu vào temp.json: {e}")
                else:
                    return "Xin lỗi quý khách, hiện tại rạp chưa có lịch chiếu cho phim "
            movie_name, ngay_chieu, gio_chieu = search_schedule(message)
            if movie_name != None and ngay_chieu != None and gio_chieu != None:
                print(movie_name, ngay_chieu, gio_chieu)
                masc = database_helper.LayMaSuatChieu(current_context, movie_name, ngay_chieu, gio_chieu)
                return f"<p>Tôi xin gửi link đặt ghế: <a href='http://localhost:9999/DoAnWebCinema/customer/payment/{masc}.htm'>Đặt ghế tại đây</a></p>"
            return response

    return "Xin lỗi, tôi chưa hiểu yêu cầu của bạn 4 ."
'''


def booking_ticket_response(message, intent_list, entities, movie_name, current_context):
    if not intent_list:
        return "Sorry, I didn't fully understand your request"

    intent_tag = intent_list[0]['intent']
    for intent in intents_data['intents']:
        if intent['tag'] == intent_tag:
            response = random.choice(intent['responses'])
            current_context[0] = "booking_ticket"

            # Xử lý nếu người dùng đã cung cấp tên phim
            if entities:
                for entity, value in entities.items():
                    value = value.replace("\\", "")
                    response = response.replace(f"<{entity}>", value)
                    movie_name[0] = value

            # Xử lý trường hợp đã có tên phim từ ngữ cảnh trước
            elif movie_name[0] != None:
                response = response.replace("<TenPhim>", movie_name[0].title())

            # Xử lý lịch chiếu (nếu cần hiển thị lịch chiếu)
            if "<GioChieu>" in response:
                gio_ngay_chieu_theo_chi_nhanh = database_helper.get_gio_ngay_chieu_theo_chi_nhanh(movie_name[0].title())
                if gio_ngay_chieu_theo_chi_nhanh:
                    # Tạo phản hồi lịch chiếu theo định dạng bạn yêu cầu
                    lich_chieu_temp = ""
                    index = 1  # Số thứ tự lịch chiếu
                    for chi_nhanh, gio_ngay_chieu_list in gio_ngay_chieu_theo_chi_nhanh.items():
                        lich_chieu_temp += f"""
                        <div>
                            Branch <b><span style="color: red;">{chi_nhanh}</span></b><br>
                        </div>
                        """
                        for gio_ngay in gio_ngay_chieu_list:
                            lich_chieu_temp += f" 🎟 Showtime Schedule {index}: {gio_ngay} <br>"
                            index += 1  # Tăng số thứ tự

                    # Thêm thông tin lịch chiếu vào phản hồi
                    response = response.replace("<GioChieu>", lich_chieu_temp)

                    # Ghi dữ liệu lịch chiếu vào tệp `temp.json`
                    try:
                        lich_chieu_list = [
                            {"ChiNhanh": chi_nhanh, "LichChieu": gio_ngay_chieu_list}
                            for chi_nhanh, gio_ngay_chieu_list in gio_ngay_chieu_theo_chi_nhanh.items()
                        ]
                        with open('temp.json', 'w', encoding='utf-8') as f:
                            json.dump(
                                {"lich_chieu": lich_chieu_list, "movie_name": movie_name[0]},
                                f,
                                ensure_ascii=False,
                                indent=4
                            )
                    except Exception as e:
                        print(f"Error writing data to temp.json: {e}")
                else:
                    return f"Sorry, the theater currently does not have a showtime available for the movie {movie_name[0]}."

            movie_name, ngay_chieu, gio_chieu = search_schedule(message)
            if movie_name and ngay_chieu and gio_chieu:
                masc = database_helper.LayMaSuatChieu(current_context, movie_name, ngay_chieu, gio_chieu)
                return movie_suggestions.get_random_response("select_showtime", showtime=f"{gio_chieu} ngày {ngay_chieu}") + f" <a href='http://localhost:9999/DoAnWebCinema/customer/payment/{masc}.htm'>Book your seat here,</a> Wish you a wonderful experience ❤"

            return response

    return "Sorry, I didn't fully understand your request 😥"

def process_verify_schedule(message, intent_predictions, recognized_entities, current_context):
    if not search_schedule(message):
        intent_predictions = [{"intent": "xac_nhan_dung_lich_chieu", "probability": "1.0"}]
        return verify_schedule_response(intent_predictions, recognized_entities,None ,current_context)
    else:
        return verify_schedule_response(intent_predictions, recognized_entities, None,current_context)
def verify_schedule_response(intent_list, entities, movie_name, current_context):
    if not intent_list:
        return "Sorry, I didn't fully understand your request😥"

    intent_tag = intent_list[0]['intent']
    for intent in intents_data['intents']:
        if intent['tag'] == intent_tag:
            response = random.choice(intent['responses'])
            if intent['context_set'] != "no_context":
                current_context[0]  = intent['context_set']
            else:
                current_context[0]  = None
            return response
    return "Sorry, I didn't fully understand your request 😥"



'''def search_schedule(query):
    try:
        with open('temp.json', 'r', encoding='utf-8') as f:
            data = json.load(f)
        movie_name = data.get('movie_name', 'Không có tên phim')
        match = re.search(r'\d+', query)
        if "lich chieu" in unidecode(query.lower()) and match:
            so_thu_tu = int(match.group())
            lich_chieu = next((item for item in data['lich_chieu'] if item['LichChieu'] == so_thu_tu), None)
            if lich_chieu:
                # Tách thời gian ra để lấy ngày và giờ
                thoi_gian = lich_chieu['ThoiGian']
                gio_chieu = re.search(r'\d{1,2}:\d{2}', thoi_gian).group()
                ngay_chieu = re.search(r'\d{2}/\d{2}/\d{4}', thoi_gian).group()
                return movie_name, ngay_chieu, gio_chieu
            else:
                return None, None, None

        # Tìm theo ngày giờ hoặc một phần của ngày giờ
        for lich_chieu in data['lich_chieu']:
            thoi_gian = lich_chieu['ThoiGian']
            if query in thoi_gian:
                gio_chieu = re.search(r'\d{1,2}:\d{2}', thoi_gian).group()
                ngay_chieu = re.search(r'\d{2}/\d{2}/\d{4}', thoi_gian).group()
                return movie_name, ngay_chieu, gio_chieu

        return None, None, None

    except FileNotFoundError:
        print("File temp.json không tồn tại.")
        return None, None, None
    except json.JSONDecodeError:
        print("Lỗi khi đọc dữ liệu từ temp.json.")
        return None, None, None'''

def search_schedule(query):
    """
    Tìm thông tin lịch chiếu dựa trên truy vấn của người dùng.
    Truy vấn có thể chứa số thứ tự lịch chiếu hoặc một phần thời gian (giờ hoặc ngày).
    """
    try:
        # Đọc dữ liệu từ tệp temp.json
        with open('temp.json', 'r', encoding='utf-8') as f:
            data = json.load(f)

        movie_name = data.get('movie_name', 'Không có tên phim')

        # Kiểm tra nếu truy vấn chứa "lich chieu" và số thứ tự lịch chiếu
        match = re.search(r'\d+', query)
        if "lich chieu" in unidecode(query.lower()) and match:
            so_thu_tu = int(match.group())

            # Duyệt qua từng chi nhánh để tìm lịch chiếu có số thứ tự phù hợp
            for chi_nhanh in data['lich_chieu']:
                for index, thoi_gian in enumerate(chi_nhanh['LichChieu'], start=1):
                    if index == so_thu_tu:
                        gio_chieu = re.search(r'\d{1,2}:\d{2}', thoi_gian).group()
                        ngay_chieu = re.search(r'\d{2}/\d{2}/\d{4}', thoi_gian).group()
                        return movie_name, ngay_chieu, gio_chieu

        # Nếu không tìm thấy theo số thứ tự, kiểm tra theo chuỗi ngày giờ hoặc một phần của ngày giờ
        for chi_nhanh in data['lich_chieu']:
            for thoi_gian in chi_nhanh['LichChieu']:
                if query in thoi_gian:
                    gio_chieu = re.search(r'\d{1,2}:\d{2}', thoi_gian).group()
                    ngay_chieu = re.search(r'\d{2}/\d{2}/\d{4}', thoi_gian).group()
                    return movie_name, ngay_chieu, gio_chieu

        # Nếu không khớp với lịch chiếu nào
        return None, None, None

    except FileNotFoundError:
        print("File temp.json không tồn tại.")
        return None, None, None
    except json.JSONDecodeError:
        print("Lỗi khi đọc dữ liệu từ temp.json.")
        return None, None, None

def search_seats(query):
    try:
        with open('entities.json', 'r', encoding='utf-8') as f:
            data = json.load(f)
        seats = data.get('TenGhe', [])
        result = [seat for seat in seats if query.lower() in seat.lower()]

        if result:
            return result
        else:
            return "No seats found matching the keyword you entered.."

    except FileNotFoundError:
        return "File entities.json không tồn tại."
    except json.JSONDecodeError:
        return "Lỗi khi đọc dữ liệu từ file entities.json."


