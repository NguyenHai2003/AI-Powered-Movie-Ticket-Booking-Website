import pyodbc
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from datetime import datetime

server = 'localhost,1433'
database = 'CINEMA'
username = 'sa'
password = '1234'

connection_string = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}'

def get_all_favorite_genres_and_times(user_id):
    # Kết nối đến cơ sở dữ liệu
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()

    # Truy vấn tất cả các thể loại mà người dùng đã xem
    query_genre = """
        SELECT tl.TenTL
        FROM VE v
        JOIN LICH_CHIEU lc ON v.MaSuatChieu = lc.MaSuatChieu
        JOIN THE_LOAI_PHIM tlp ON lc.MaPhim = tlp.MaPhim
        JOIN THE_LOAI tl ON tlp.MaTL = tl.MaTL
        WHERE v.MaKH = ?
    """
    cursor.execute(query_genre, user_id)
    genre_results = cursor.fetchall()
    favorite_genres = [row[0] for row in genre_results] if genre_results else []

    # Truy vấn tất cả các giờ chiếu mà người dùng đã tham gia
    query_time = """
        SELECT lc.GioChieu
        FROM VE v
        JOIN LICH_CHIEU lc ON v.MaSuatChieu = lc.MaSuatChieu
        WHERE v.MaKH = ?
    """
    cursor.execute(query_time, user_id)
    time_results = cursor.fetchall()
    favorite_times = [row[0] for row in time_results] if time_results else []

    # Đóng kết nối
    connection.close()

    return favorite_genres, favorite_times

def get_random_recommendations(user_id):
    favorite_genres, favorite_time = get_all_favorite_genres_and_times(user_id)
    print(f"Favorite Genres: {favorite_genres}, Favorite Time: {favorite_time}")

    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()

    # Get list of watched movies
    query_watched_movies = """
    SELECT DISTINCT p.MaPhim
    FROM VE v
    JOIN LICH_CHIEU lc ON v.MaSuatChieu = lc.MaSuatChieu
    JOIN PHIM p ON lc.MaPhim = p.MaPhim
    WHERE v.MaKH = ?
    """
    cursor.execute(query_watched_movies, user_id)
    watched_movies = [row[0] for row in cursor.fetchall()]

    query_recommendations = """
        SELECT 
            p.MaPhim, 
            p.TenPhim, 
            lc.GioChieu, 
            lc.NgayChieu, 
            p.MoTa, 
            tl.TenTL
        FROM 
            PHIM p
        JOIN 
            LICH_CHIEU lc ON p.MaPhim = lc.MaPhim
        JOIN 
            THE_LOAI_PHIM tlp ON p.MaPhim = tlp.MaPhim
        JOIN 
            THE_LOAI tl ON tlp.MaTL = tl.MaTL
        WHERE 
            CAST(lc.NgayChieu AS DATETIME) + CAST(lc.GioChieu AS DATETIME) > GETDATE();
    """
    cursor.execute(query_recommendations)
    movie_data = cursor.fetchall()

    for m in movie_data:
        print(m)
    # Filter out watched movies
    movie_data = [movie for movie in movie_data if movie[0] not in watched_movies]
    print("-------------------------------------------")
    for m in movie_data:
        print(m)

    # Smart recommendations based on the algorithm
    if movie_data:
        recommendations = recommend_by_content(movie_data, favorite_genres, favorite_time)
    else:
        recommendations = []

    connection.close()
    return recommendations

from collections import Counter

from collections import Counter
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

def recommend_by_content(movie_data, favorite_genres, favorite_time):
    # Bước 1: Tính toán độ tương đồng nội dung (content similarity)
    movie_descriptions = [row[4] for row in movie_data]  # Mô tả (description column)
    vectorizer = TfidfVectorizer()
    tfidf_matrix = vectorizer.fit_transform(movie_descriptions)

    user_favorite = " ".join(favorite_genres)  # Kết hợp thể loại yêu thích thành chuỗi
    user_vector = vectorizer.transform([user_favorite])
    content_similarities = cosine_similarity(user_vector, tfidf_matrix).flatten()

    # Bước 2: Tính toán độ tương đồng thể loại (genre similarity)
    genre_similarities = [
        1 if movie[5] in favorite_genres else 0 for movie in movie_data  # Check thể loại
    ]

    # Bước 3: Tính toán độ phổ biến của giờ chiếu (time popularity)
    show_times = favorite_time
    time_counter = Counter(show_times)
    max_count = max(time_counter.values())  # Để chuẩn hóa về [0, 1]
    time_popularity = {hour: count / max_count for hour, count in time_counter.items()}

    # Bước 4: Tích hợp các yếu tố vào điểm số tổng hợp
    combined_similarities = []
    for i in range(len(movie_data)):
        movie = movie_data[i]
        movie_time = movie[2].hour  # Lấy giờ chiếu của phim
        time_score = time_popularity.get(movie_time, 0)  # Điểm dựa trên độ phổ biến của giờ

        combined_score = (
            0.35 * content_similarities[i]  # Tương đồng nội dung
            + 0.5 * genre_similarities[i]   # Tương đồng thể loại
            + 0.15 * time_score             # Phổ biến giờ chiếu
        )
        combined_similarities.append((movie, combined_score))

    movie_scores_by_id = {}
    for movie, score in combined_similarities:
        movie_id = movie[0]
        if movie_id not in movie_scores_by_id:
            movie_scores_by_id[movie_id] = []
        movie_scores_by_id[movie_id].append((movie, score))

    # Chỉ giữ lại 2 suất chiếu có điểm số cao nhất cho mỗi phim
    filtered_movies = []
    for movie_id, scores in movie_scores_by_id.items():
        top_3_scores = sorted(scores, key=lambda x: x[1], reverse=True)[:3]
        filtered_movies.extend([item[0] for item in top_3_scores])

    return filtered_movies




def group_movies_by_datetime(movie_data):
    grouped_movies = {}

    for movie in movie_data:
        movie_id = movie[0]
        movie_name = movie[1]
        movie_time = movie[2]
        movie_date = movie[3]
        movie_description = movie[4]
        movie_genre = movie[5]

        # Tạo khóa dựa trên ngày và giờ chiếu
        datetime_key = (movie_date, movie_time)

        if datetime_key not in grouped_movies:
            grouped_movies[datetime_key] = {
                'movie_id': movie_id,
                'movie_name': movie_name,
                'movie_description': movie_description,
                'movie_date': movie_date,
                'movie_time': movie_time,
                'genres': set()  # Sử dụng set để loại bỏ trùng lặp
            }
        # Thêm thể loại vào danh sách thể loại
        grouped_movies[datetime_key]['genres'].add(movie_genre)

    # Chuyển set thành chuỗi thể loại
    for key, details in grouped_movies.items():
        details['genres'] = ", ".join(details['genres'])  # Hợp nhất thể loại thành chuỗi

    return grouped_movies


filtered_movies = get_random_recommendations("54")
grouped_movies = group_movies_by_datetime(filtered_movies)
print("-------------------------------------------")
for i, (datetime_key, details) in enumerate(grouped_movies.items()):
    if i >= 10:
        break
    print(f"ID: {details['movie_id']}, Tên: {details['movie_name']}, "
          f"Ngày: {details['movie_date']}, Thời gian: {details['movie_time']}, "
          f"Thể loại: {details['genres']}, Mô tả: {details['movie_description']}")
