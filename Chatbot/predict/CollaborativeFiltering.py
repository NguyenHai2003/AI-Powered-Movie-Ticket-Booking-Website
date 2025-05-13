import numpy as np
import pandas as pd
from scipy.sparse.linalg import svds
from CF_DatabaseConnector import df_ratings

# Tạo ma trận người dùng - phim
user_item_matrix = df_ratings.pivot(index='MaKH', columns='MaPhim', values='Diem').fillna(0)

# Tính các đặc trưng ẩn
user_item_matrix_np = user_item_matrix.values
U, sigma, Vt = svds(user_item_matrix_np, k=2)
sigma = np.diag(sigma)

# Tái tạo ma trận dự đoán
predictions = np.dot(np.dot(U, sigma), Vt)


# Hàm gợi ý dựa trên danh sách phim chưa đánh giá
def recommend_collab(user_id, user_item_matrix, predictions, unseen_movies, n_recommendations=5):
    user_idx = user_item_matrix.index.get_loc(user_id)
    user_predictions = predictions[user_idx]
    unseen_predictions = {movie: user_predictions[user_item_matrix.columns.get_loc(movie)]
                          for movie in unseen_movies if movie in user_item_matrix.columns}
    sorted_movies = sorted(unseen_predictions.items(), key=lambda x: x[1], reverse=True)

    recommended_movies = [movie for movie, score in sorted_movies[:n_recommendations]]
    return recommended_movies


user_id = 54
unseen_movies = [3, 7, 8, 10, 12]
recommended = recommend_collab(user_id, user_item_matrix, predictions, unseen_movies)

print(f"Phim gợi ý cho người dùng {user_id}: {recommended}")
