from sqlalchemy import create_engine
import pandas as pd

# Kết nối đến SQL Server bằng SQLAlchemy
connection_string = (
    "mssql+pyodbc://sa:1234@localhost:1433/CINEMA?driver=ODBC+Driver+17+for+SQL+Server"
)
engine = create_engine(connection_string)

# Truy vấn SQL để lấy TenPhim và MoTa
query_phim = """
SELECT TenPhim, MoTa
FROM PHIM
"""
df = pd.read_sql(query_phim, engine)

# Truy vấn SQL để lấy TheLoai cho tất cả các TenPhim
query_theloai = """
SELECT p.TenPhim, tl.TenTL AS TheLoai
FROM PHIM p
JOIN THE_LOAI_PHIM tlp ON tlp.MaPhim = p.MaPhim
JOIN THE_LOAI tl ON tl.MaTL = tlp.MaTL
"""
df_theloai = pd.read_sql(query_theloai, engine)

# Kết hợp cột TheLoai vào DataFrame chính
df = pd.merge(df, df_theloai[['TenPhim', 'TheLoai']], on='TenPhim', how='left')

# Gộp các thể loại trùng cho mỗi phim
df_grouped = df.groupby(['TenPhim', 'MoTa'], as_index=False).agg({
    'TheLoai': lambda x: ', '.join(x.unique())  # Kết hợp các thể loại lại với nhau
})

# Hiển thị dữ liệu
print("Dữ liệu đã gộp:")
print(df_grouped)
# Đóng kết nối
engine.dispose()
