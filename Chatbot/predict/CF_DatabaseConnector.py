from sqlalchemy import create_engine
import pandas as pd

# Kết nối đến SQL Server bằng SQLAlchemy
connection_string = (
    "mssql+pyodbc://sa:1234@localhost:1433/CINEMA?driver=ODBC+Driver+17+for+SQL+Server"
)
engine = create_engine(connection_string)

# Truy vấn SQL để lấy TenPhim và MoTa
query_phim = """
SELECT d.MaKH, d.MaPhim, d.Diem
FROM DANHGIAPHIM d
"""
df_ratings = pd.read_sql(query_phim, engine)

print(df_ratings)
engine.dispose()
