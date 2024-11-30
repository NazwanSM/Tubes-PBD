import pandas as pd

# Baca file CSV
df = pd.read_csv('manga_stats.csv')

# Ganti nilai kosong dengan 'NULL'
df = df.fillna('NULL')

# Simpan file CSV yang baru
df.to_csv('manga_stats_mysql.csv', index=False)
