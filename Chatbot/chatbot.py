import re
import random
import json
import pickle
import numpy as np
import nltk
from nltk.stem import WordNetLemmatizer
from tensorflow.keras.models import load_model
from database_helper import get_ten_phim
from predict.ContentBasedFiltering import recommend_movies_combined

import booking_ticket
import movie_suggestions
# Khởi tạo các đối tượng và tải dữ liệu
lemmatizer = WordNetLemmatizer()
with open('intents.json', encoding='utf-8') as intents_file:
    intents_data = json.load(intents_file)
entities_data = {
    "TenPhim": get_ten_phim()  # Lấy tên phim từ cơ sở dữ liệu và gán vào entities_data
}

compiled_entity_patterns = {
    entity: [re.compile(r'\b' + re.escape(keyword.lower()) + r'\b') for keyword in keywords]
    for entity, keywords in entities_data.items()
}

def tokenize_sentence(sentence):
    words = nltk.word_tokenize(sentence)
    return [lemmatizer.lemmatize(word.lower()) for word in words]

def create_bag_of_words(sentence):
    word_list = pickle.load(open('model/words.pkl', 'rb'))
    sentence_words = tokenize_sentence(sentence)
    return np.array([1 if word in sentence_words else 0 for word in word_list])

def classify_intent(sentence):

    intent_classes = pickle.load(open('model/classes.pkl', 'rb'))
    chatbot_model = load_model('model/chatbot_model.keras', compile=False)


    bow = create_bag_of_words(sentence)
    predictions = chatbot_model.predict(np.array([bow]))[0]
    ERROR_THRESHOLD = 0.25
    filtered_predictions = [(i, p) for i, p in enumerate(predictions) if p > ERROR_THRESHOLD]
    filtered_predictions.sort(key=lambda x: x[1], reverse=True)
    return [{"intent": intent_classes[p[0]], "probability": str(p[1])} for p in filtered_predictions]


current_context = ["no_context"]
movie_name = ["None"]


# Hàm lấy phản hồi từ intent và cập nhật ngữ cảnh nếu có
def generate_no_context_response(intent_list, entities):
    if not intent_list:
        return "Sorry, I didn't fully understand your request 😥"

    intent_tag = intent_list[0]['intent']
    for intent in intents_data['intents']:
        if intent['tag'] == intent_tag:
            response = random.choice(intent['responses'])
            if intent['context_set'] != "no_context":
                return "Sorry, I didn't fully understand your request 😥"
            return response

    return "Sorry, I didn't fully understand your request 😥"

# Lấy ngữ cảnh từ danh sách intent
def determine_context(intent_list):
    intent_tag = intent_list[0]['intent']
    for intent in intents_data['intents']:
        if intent['tag'] == intent_tag:
            return intent.get('context_set', "no_context")

from rapidfuzz import process
import database_helper
def get_best_match(input_message):
    movie_list = database_helper.get_ten_phim()
    best_match = process.extractOne(input_message, movie_list)

    # Trả về tên phim phù hợp nhất và độ chính xác (score)
    if best_match:
        movie_name = best_match[0]
        return movie_name
    else:
        return None

# Chạy chatbot
def chatbot_handle_message(user_message, user_id):
    intent_tag, extracted_showtime, extracted_date = movie_suggestions.match_intent(user_message)
    predicted_intents = classify_intent(user_message)
    recognized_entities = booking_ticket.extract_entities(user_message, compiled_entity_patterns)
    response_message = "Sorry, I didn't fully understand your request. 😥"
    if (predicted_intents[0]['intent'] == "dat_ve_co_thuc_the"):
        print("dat ve")
        response_message = booking_ticket.process_booking_request(user_message, predicted_intents, recognized_entities,
                                                                  movie_name, current_context)

    elif predicted_intents[0]['intent'] == "de_xuat_phim_tuong_tu":
        print("de_xuat_phim_tuong_tu")
        old_name = get_best_match(user_message)
        new_name = recommend_movies_combined(old_name)
        response_message = movie_suggestions.similar_movie(new_name, predicted_intents)

    elif current_context[0] == "movie_suggestions" or intent_tag == "movie_suggestions":
        print("de_xuat")
        response_message = movie_suggestions.suggest_movies_on_start(user_message, user_id, current_context)
        current_context[0] = "select_showtime"

    elif current_context[0] == "select_showtime" and intent_tag == "select_showtime":
        print("chon_suat_chieu")
        response_message = movie_suggestions.suggest_movies_on_start(user_message, user_id, current_context)

    elif current_context[0] == "booking_ticket":
        print("booking_ticket")
        response_message = booking_ticket.booking_ticket_response(
            user_message, predicted_intents, recognized_entities, movie_name, current_context
        )
    elif current_context[0] == "fallback":
        print("fallback")
        response_message = movie_suggestions.get_random_response("fallback")

    else:
        print("no_context")
        response_message = generate_no_context_response(predicted_intents, recognized_entities)
    return response_message



