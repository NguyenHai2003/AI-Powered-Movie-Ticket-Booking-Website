from sklearn.feature_extraction.text import CountVectorizer, TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from gensim.models import Word2Vec
import numpy as np
from . import CBF_DatabaseConnector

# Đọc dữ liệu từ cơ sở dữ liệu
df = CBF_DatabaseConnector.df

# Dữ liệu dừng tiếng Việt
vietnamese_stopwords = [
    'và', 'của', 'là', 'đã', 'theo', 'có', 'như', 'trong', 'một', 'được',
    'với', 'cho', 'vì', 'này', 'cái', 'nên', 'mới', 'từ', 'các', 'nhiều',
    'lúc', 'mà', 'cũng', 'sẽ', 'được', 'tại', 'hay', 'nếu', 'khi', 'mới',
    'vẫn', 'sau', 'mỗi', 'bởi', 'nào', 'có', 'cũng', 'vì', 'không', 'chỉ',
    'và', 'khi', 'để', 'trong'
]

# Phân tích mô tả phim và huấn luyện mô hình Word2Vec
corpus = [desc.split() for desc in df['MoTa']]
word2vec = Word2Vec(sentences=corpus, vector_size=100, window=5, min_count=1)

# Chuyển đổi mô tả phim thành ma trận TF-IDF
tfidf = TfidfVectorizer(stop_words=vietnamese_stopwords)
tfidf_matrix = tfidf.fit_transform(df['MoTa'])  # Mô tả phim

# Tính độ tương đồng TF-IDF
cosine_sim_tfidf = cosine_similarity(tfidf_matrix, tfidf_matrix)

# Tính ma trận từ thể loại phim
count_vectorizer = CountVectorizer(stop_words=vietnamese_stopwords)
bow_matrix = count_vectorizer.fit_transform(df['TheLoai'])  # Thể loại phim
cosine_sim_bow = cosine_similarity(bow_matrix, bow_matrix)


def recommend_movies_combined(movie_title, cosine_sim_tfidf=cosine_sim_tfidf, cosine_sim_bow=cosine_sim_bow,
                              model=word2vec, tfidf_weight=0.4, word2vec_weight=0.3, bow_weight=0.3):
    idx = df[df['TenPhim'] == movie_title].index[0]

    # Lấy độ tương đồng từ TF-IDF
    sim_scores_tfidf = list(enumerate(cosine_sim_tfidf[idx]))
    sim_scores_tfidf = sorted(sim_scores_tfidf, key=lambda x: x[1], reverse=True)

    # Lấy độ tương đồng từ Word2Vec
    movie_desc = df['MoTa'][idx].split()
    movie_vec = np.mean([model.wv[word] for word in movie_desc if word in model.wv],
                        axis=0)  # Sử dụng mean của các từ có trong mô hình

    sim_scores_word2vec = []
    for i, row in df.iterrows():
        if i != idx:
            other_desc = row['MoTa'].split()
            other_vec = np.mean([model.wv[word] for word in other_desc if word in model.wv],
                                axis=0)  # Tính mean cho mô tả khác
            if other_vec is not None and movie_vec is not None:
                sim_score = cosine_similarity([movie_vec], [other_vec])
                sim_scores_word2vec.append((i, sim_score[0][0]))
            else:
                sim_scores_word2vec.append((i, 0))

    sim_scores_word2vec = sorted(sim_scores_word2vec, key=lambda x: x[1], reverse=True)

    # Lấy độ tương đồng từ Thể loại phim
    sim_scores_bow = list(enumerate(cosine_sim_bow[idx]))
    sim_scores_bow = sorted(sim_scores_bow, key=lambda x: x[1], reverse=True)

    # Kết hợp độ tương đồng từ cả ba phương pháp với trọng số
    combined_scores = {}
    for i in range(len(df)):
        if i == idx:  # Bỏ qua phim đầu vào
            continue

        tfidf_score = dict(sim_scores_tfidf).get(i, 0)
        word2vec_score = dict(sim_scores_word2vec).get(i, 0)
        bow_score = dict(sim_scores_bow).get(i, 0)

        # Trung bình các độ tương đồng có trọng số
        combined_scores[i] = (tfidf_score * tfidf_weight + word2vec_score * word2vec_weight + bow_score * bow_weight)

    # Sắp xếp theo độ tương đồng
    combined_sorted = sorted(combined_scores.items(), key=lambda x: x[1], reverse=True)

    # Lọc ra các phim có độ tương đồng cao nhất và loại bỏ phim trùng với phim đầu vào
    movie_indices = [i[0] for i in combined_sorted if df['TenPhim'].iloc[i[0]] != movie_title]

    # Nếu không đủ 5 phim, tiếp tục lấy thêm từ các phim có độ tương đồng thấp hơn
    recommended_movies = df['TenPhim'].iloc[movie_indices[:5]]

    return recommended_movies


# Phim muốn gợi ý
movie_title = 'Fearless Playboys'  # Tên phim bạn muốn gợi ý tương tự
recommended_movies = recommend_movies_combined(movie_title)
print("Phim gợi ý: ", recommended_movies)


