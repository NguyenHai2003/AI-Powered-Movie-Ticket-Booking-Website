import pyodbc
import json
from datetime import datetime
import pyodbc
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

# Thông tin kết nối
server = 'localhost,1433'
database = 'CINEMA'
username = 'sa'
password = '1234'

connection_string = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}'

def get_ten_chi_nhanh():
    """Lấy danh sách TenChiNhanh từ bảng CHINHANH."""
    try:
        connection = pyodbc.connect(connection_string)
        cursor = connection.cursor()
        cursor.execute("SELECT [TenChiNhanh] FROM [dbo].[CHINHANH]")
        rows = cursor.fetchall()
        ten_chi_nhanh_list = [row[0] for row in rows]
        cursor.close()
        connection.close()
        return ten_chi_nhanh_list
    except pyodbc.Error as ex:
        print("Lỗi khi kết nối đến SQL Server:", ex)
        return []

def get_ten_dao_dien():
    """Lấy danh sách TenDaoDien từ bảng DAODIEN."""
    try:
        connection = pyodbc.connect(connection_string)
        cursor = connection.cursor()
        cursor.execute("SELECT [TenDaoDien] FROM [dbo].[DAODIEN]")
        rows = cursor.fetchall()
        ten_dao_dien_list = [row[0] for row in rows]
        cursor.close()
        connection.close()
        return ten_dao_dien_list
    except pyodbc.Error as ex:
        print("Lỗi khi kết nối đến SQL Server:", ex)
        return []

def get_ten_dien_vien():
    """Lấy danh sách TenDienVien từ bảng DIENVIEN."""
    try:
        connection = pyodbc.connect(connection_string)
        cursor = connection.cursor()
        cursor.execute("SELECT [TenDienVien] FROM [dbo].[DIENVIEN]")
        rows = cursor.fetchall()
        ten_dien_vien_list = [row[0] for row in rows]
        cursor.close()
        connection.close()
        return ten_dien_vien_list
    except pyodbc.Error as ex:
        print("Lỗi khi kết nối đến SQL Server:", ex)
        return []

def get_ten_ghe():
    """Lấy danh sách TenGhe từ bảng GHE."""
    try:
        connection = pyodbc.connect(connection_string)
        cursor = connection.cursor()
        cursor.execute("SELECT [TenGhe] FROM [dbo].[GHE]")
        rows = cursor.fetchall()
        ten_ghe_list = [row[0] for row in rows]
        cursor.close()
        connection.close()
        return ten_ghe_list
    except pyodbc.Error as ex:
        print("Lỗi khi kết nối đến SQL Server:", ex)
        return []


def get_gio_ngay_chieu_theo_chi_nhanh(ten_phim):
    """
    Lấy danh sách giờ chiếu và ngày chiếu từ bảng LICH_CHIEU cho phim được truyền vào,
    chỉ lấy các suất chiếu trong tương lai và nhóm theo chi nhánh.
    """
    try:
        # Kết nối đến cơ sở dữ liệu
        connection = pyodbc.connect(connection_string)
        cursor = connection.cursor()

        # Truy vấn để lấy giờ chiếu, ngày chiếu, và tên chi nhánh
        query = """
        SELECT L.GioChieu, L.NgayChieu, CN.TenChiNhanh
        FROM LICH_CHIEU L
        INNER JOIN PHONG P ON L.MaPhong = P.MaPhong
        INNER JOIN CHINHANH CN ON P.MaChiNhanh = CN.MaChiNhanh
        WHERE L.MaPhim = (SELECT MaPhim FROM PHIM WHERE TenPhim = ?)
        AND DATEADD(SECOND, DATEDIFF(SECOND, 0, L.GioChieu), CAST(L.NgayChieu AS DATETIME)) > GETDATE()
        ORDER BY CN.TenChiNhanh, L.NgayChieu, L.GioChieu
        """
        cursor.execute(query, (ten_phim,))
        rows = cursor.fetchall()

        # Nhóm kết quả theo chi nhánh
        lich_chieu_theo_chi_nhanh = {}
        for row in rows:
            gio_chieu = row[0].strftime('%H:%M')
            ngay_chieu = row[1].strftime('%d/%m/%Y')
            ten_chi_nhanh = row[2]

            if ten_chi_nhanh not in lich_chieu_theo_chi_nhanh:
                lich_chieu_theo_chi_nhanh[ten_chi_nhanh] = []

            lich_chieu_theo_chi_nhanh[ten_chi_nhanh].append(f"{gio_chieu} ngày {ngay_chieu}")

        cursor.close()
        connection.close()

        return lich_chieu_theo_chi_nhanh
    except pyodbc.Error as ex:
        print("Lỗi khi kết nối đến SQL Server:", ex)
        return {}

def get_ten_loai():
    """Lấy danh sách TenLoai từ bảng LOAIGHE."""
    try:
        connection = pyodbc.connect(connection_string)
        cursor = connection.cursor()
        cursor.execute("SELECT [TenLoai] FROM [dbo].[LOAIGHE]")
        rows = cursor.fetchall()
        ten_loai_list = [row[0] for row in rows]
        cursor.close()
        connection.close()
        return ten_loai_list
    except pyodbc.Error as ex:
        print("Lỗi khi kết nối đến SQL Server:", ex)
        return []

def get_ten_phim():
    try:
        connection = pyodbc.connect(connection_string)
        cursor = connection.cursor()
        cursor.execute("SELECT [TenPhim] FROM [dbo].[PHIM]")
        rows = cursor.fetchall()
        ten_phim_list = [row[0] for row in rows]
        cursor.close()
        connection.close()
        return ten_phim_list
    except pyodbc.Error as ex:
        print("Lỗi khi kết nối đến SQL Server:", ex)
        return []

def get_ma_phong():
    """Lấy danh sách MaPhong từ bảng PHONG."""
    try:
        connection = pyodbc.connect(connection_string)
        cursor = connection.cursor()
        cursor.execute("SELECT [MaPhong] FROM [dbo].[PHONG]")
        rows = cursor.fetchall()
        ma_phong_list = [row[0] for row in rows]
        cursor.close()
        connection.close()
        return ma_phong_list
    except pyodbc.Error as ex:
        print("Lỗi khi kết nối đến SQL Server:", ex)
        return []


def get_gio_ngay_chieu(ten_phim):
    """Lấy danh sách GioChieu và NgayChieu từ bảng LICH_CHIEU cho phim được truyền vào, chỉ lấy các suất chiếu trong tương lai."""
    try:
        connection = pyodbc.connect(connection_string)
        cursor = connection.cursor()

        # Truy vấn để lấy GioChieu và NgayChieu cho phim có tên truyền vào, chỉ lấy suất chiếu sau thời điểm hiện tại
        query = """
        SELECT GioChieu, NgayChieu 
        FROM LICH_CHIEU 
        WHERE MaPhim = (SELECT MaPhim FROM PHIM WHERE TenPhim = ?)
        AND DATEADD(SECOND, DATEDIFF(SECOND, 0, GioChieu), CAST(NgayChieu AS DATETIME)) > GETDATE()
        """
        cursor.execute(query, (ten_phim,))
        rows = cursor.fetchall()

        # Định dạng kết quả theo kiểu 'giờ:phút ngày ngày/tháng/năm'
        formatted_list = [
            f"{row[0].strftime('%H:%M')} ngày {row[1].strftime('%d/%m/%Y')}"
            for row in rows
        ]

        cursor.close()
        connection.close()

        return formatted_list
    except pyodbc.Error as ex:
        print("Lỗi khi kết nối đến SQL Server:", ex)
        return []

def import_data_to_entities():
    """Gọi các hàm lấy dữ liệu và ghi vào file entities.json."""
    entities_data = {
        "TenChiNhanh": get_ten_chi_nhanh(),
        "TenDaoDien": get_ten_dao_dien(),
        "TenDienVien": get_ten_dien_vien(),
        "TenGhe": get_ten_ghe(),
        "TenLoai": get_ten_loai(),
        "TenPhim": get_ten_phim(),
        "MaPhong": get_ma_phong()
    }

    # Ghi dữ liệu vào file entities.json
    with open('entities.json', 'w', encoding='utf-8') as json_file:
        json.dump(entities_data, json_file, ensure_ascii=False, indent=4)


def add_seats_to_intents(new_seats):
    try:
        # Đọc dữ liệu từ file intents.json
        with open('intents.json', 'r', encoding='utf-8') as f:
            data = json.load(f)

        # Duyệt qua các intents để tìm và thêm TenGhe vào các patterns hoặc responses
        for intent in data['intents']:
            if '<TenGhe>' in intent['patterns']:
                intent['patterns'].extend(new_seats)

        # Ghi lại dữ liệu vào file intents.json
        with open('intents.json', 'w', encoding='utf-8') as f:
            json.dump(data, f, ensure_ascii=False, indent=4)

        return f"Đã thêm ghế mới vào các intent: {new_seats}"

    except FileNotFoundError:
        return "File intents.json không tồn tại."
    except json.JSONDecodeError:
        return "Lỗi khi đọc dữ liệu từ file intents.json."

def get_favorite_genre_and_time(user_id):
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()

    # Lấy thể loại yêu thích với trọng số
    query_genre = """
        SELECT TOP 3 tl.TenTL
        FROM VE v
        JOIN LICH_CHIEU lc ON v.MaSuatChieu = lc.MaSuatChieu
        JOIN THE_LOAI_PHIM tlp ON lc.MaPhim = tlp.MaPhim
        JOIN THE_LOAI tl ON tlp.MaTL = tl.MaTL
        WHERE v.MaKH = ?
        GROUP BY tl.TenTL
        ORDER BY SUM(POWER(0.9, DATEDIFF(DAY, lc.NgayChieu, GETDATE()))) DESC
    """
    cursor.execute(query_genre, user_id)
    genre_results = cursor.fetchall()
    favorite_genres = [row[0] for row in genre_results] if genre_results else []

    # Lấy khung giờ yêu thích với trọng số
    query_time = """
    SELECT TOP 1 
        CASE 
            WHEN DATEPART(HOUR, lc.GioChieu) BETWEEN 18 AND 23 THEN N'Buổi tối'
            WHEN DATEPART(HOUR, lc.GioChieu) BETWEEN 12 AND 17 THEN N'Buổi chiều'
            ELSE N'Buổi sáng'
        END AS KhungGio
    FROM VE v
    JOIN LICH_CHIEU lc ON v.MaSuatChieu = lc.MaSuatChieu
    WHERE v.MaKH = ?
    GROUP BY 
        CASE 
            WHEN DATEPART(HOUR, lc.GioChieu) BETWEEN 18 AND 23 THEN N'Buổi tối'
            WHEN DATEPART(HOUR, lc.GioChieu) BETWEEN 12 AND 17 THEN N'Buổi chiều'
            ELSE N'Buổi sáng'
        END
    ORDER BY SUM(POWER(0.9, DATEDIFF(DAY, lc.NgayChieu, GETDATE()))) DESC
    """
    cursor.execute(query_time, user_id)
    time_result = cursor.fetchone()
    favorite_time = time_result[0] if time_result else None

    connection.close()
    return favorite_genres, favorite_time

# Hàm để gợi ý phim thông minh theo thể loại và thời gian yêu thích
def get_random_recommendations(user_id):
    favorite_genres, favorite_time = get_favorite_genre_and_time(user_id)
    print(f"Favorite Genres: {favorite_genres}, Favorite Time: {favorite_time}")

    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()

    # Gợi ý phim dựa trên thể loại yêu thích và thời gian
    query_recommendations = f"""
    SELECT TOP 10 p.TenPhim, lc.GioChieu, lc.NgayChieu, p.MoTa
    FROM PHIM p
    JOIN LICH_CHIEU lc ON p.MaPhim = lc.MaPhim
    JOIN THE_LOAI_PHIM tlp ON p.MaPhim = tlp.MaPhim
    JOIN THE_LOAI tl ON tlp.MaTL = tl.MaTL
    WHERE tl.TenTL IN ({','.join(['?' for _ in favorite_genres])})
      AND lc.NgayChieu >= CAST(GETDATE() AS DATE)
      AND (
          (? = N'Buổi tối' AND DATEPART(HOUR, lc.GioChieu) BETWEEN 18 AND 23) OR
          (? = N'Buổi chiều' AND DATEPART(HOUR, lc.GioChieu) BETWEEN 12 AND 17) OR
          (? = N'Buổi sáng' AND DATEPART(HOUR, lc.GioChieu) BETWEEN 6 AND 11)
      )
    ORDER BY NEWID() -- Gợi ý ngẫu nhiên
    """

    # Pass favorite_genres and favorite_time correctly
    cursor.execute(query_recommendations, *favorite_genres, favorite_time, favorite_time, favorite_time)
    movie_data = cursor.fetchall()

    # Gợi ý thông minh dựa trên thuật toán đề xuất
    if movie_data:
        recommendations = recommend_by_content(movie_data, favorite_genres)
    else:
        recommendations = []

    connection.close()
    return recommendations

# Hàm gợi ý phim thông minh dựa trên nội dung
def recommend_by_content(movie_data, favorite_genres):
    # Lấy mô tả phim
    movie_descriptions = [row[3] for row in movie_data]  # Cột MoTa
    vectorizer = TfidfVectorizer()
    tfidf_matrix = vectorizer.fit_transform(movie_descriptions)

    # Tính toán tương đồng nội dung
    user_favorite = " ".join(favorite_genres)  # Gộp thể loại yêu thích thành một chuỗi
    user_vector = vectorizer.transform([user_favorite])
    similarities = cosine_similarity(user_vector, tfidf_matrix).flatten()

    # Lấy 3 phim có điểm tương đồng cao nhất
    top_indices = similarities.argsort()[-3:][::-1]
    recommendations = [movie_data[i] for i in top_indices]
    return recommendations

def handle_ticket_booking(user_id, movie_name, selected_showtime):
    try:
        # Kết nối với cơ sở dữ liệu
        with pyodbc.connect(connection_string) as connection:
            cursor = connection.cursor()

            # Chuyển đổi selected_showtime từ datetime.time thành chuỗi "HH:MM:SS"
            selected_showtime_str = selected_showtime.strftime("%H:%M:%S")
            print(f"Đang kiểm tra suất chiếu: {selected_showtime_str} cho phim: {movie_name}")

            # Truy vấn thông tin phim và suất chiếu từ cơ sở dữ liệu
            query = """
                SELECT p.TenPhim, lc.GioChieu, lc.NgayChieu
                FROM PHIM p
                JOIN LICH_CHIEU lc ON p.MaPhim = lc.MaPhim
                WHERE lc.GioChieu = ? AND p.TenPhim = ? 
                AND lc.NgayChieu >= CAST(GETDATE() AS DATE)
            """
            cursor.execute(query, (selected_showtime_str, movie_name))
            result = cursor.fetchone()

            # In ra kết quả truy vấn để kiểm tra
            print(f"Kết quả truy vấn: {result}")

            if result:
                movie_name, showtime, date_show = result
                print(f"Showtime found: {showtime}")
                return f"Successfully selected showtime for the movie <b>{movie_name}</b> at <b>{showtime}</b> on <b>{date_show}</b>. <br>"
            else:
                return f"The showtime {selected_showtime_str} does not exist for the movie <b>{movie_name}</b>. Please choose again. <br>"

    except Exception as e:
        # In lỗi chi tiết nếu có
        print(f"Lỗi khi xử lý yêu cầu: {str(e)}")
        return f"An error occurred while processing the request: {str(e)}"


def LayMaSuatChieu(current_context, movie_name, ngay_chieu, gio_chieu):
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    try:
        if current_context[0] != "select_showtime" :
            ngay_chieu_sql = datetime.strptime(ngay_chieu, "%d/%m/%Y").strftime("%Y-%m-%d")
        else:
            ngay_chieu_sql = ngay_chieu
        query = """
        SELECT lc.MaSuatChieu FROM LICH_CHIEU lc
        JOIN PHIM p ON lc.MaPhim = p.MaPhim
        WHERE p.TenPhim = ? AND lc.NgayChieu = ? AND lc.GioChieu = ?
        """
        cursor.execute(query, (movie_name, ngay_chieu_sql, gio_chieu))
        result = cursor.fetchone()
        print(f"Kết quả truy vấn: {result}")
        return result[0]
    except Exception as e:
        print(f"Lỗi khi xử lý yêu cầu: {str(e)}")
        return f"An error occurred while processing the request: {str(e)}"
    finally:
        connection.close()
print(get_ten_phim())
import_data_to_entities()