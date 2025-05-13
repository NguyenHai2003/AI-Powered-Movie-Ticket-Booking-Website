from flask import Flask, request, jsonify, redirect
from chatbot import chatbot_handle_message
from flask_cors import CORS
import time  # Thư viện để đo thời gian

app = Flask(__name__)
CORS(app)


@app.route('/')
def index():
    return redirect('http://localhost:9999/DoAnWebCinema/trangchu.htm')


@app.route('/handle_message', methods=['POST'])
def handle_message():
    data = request.json
    message = data.get('message')
    user_id = data.get('user_id')  # Nhận user_id từ request
    print(f"User ID: {user_id}, User message: {message}")

    # Bắt đầu đo thời gian
    start_time = time.time()

    # Truyền user_id vào chatbot_handle_message
    response = chatbot_handle_message(message, user_id)

    # Kết thúc đo thời gian
    end_time = time.time()

    # Tính tổng thời gian xử lý
    total_time = end_time - start_time
    print(f"Processing time: {total_time:.4f} seconds")

    print(f"User response: {response}")
    return jsonify({'response': response, 'processing_time': total_time})


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
