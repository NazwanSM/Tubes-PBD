import pandas as pd
import re

# Membaca file CSV
df = pd.read_csv('reviews.csv')

# Fungsi untuk membersihkan teks
def clean_text(text):
    if pd.isna(text):
        return text
    
    # Mengganti newline dengan spasi
    text = str(text).replace('\n', ' ')
    
    # Menghapus multiple spaces
    text = re.sub(r'\s+', ' ', text).strip()
    
    return text

# Membersihkan setiap kolom teks
for column in df.columns:
    if df[column].dtype == 'object':
        df[column] = df[column].apply(clean_text)

# Menyimpan file CSV yang sudah dibersihkan
df.to_csv('reviews_cleaned.csv', index=False)

# Menampilkan beberapa baris pertama untuk konfirmasi
print(df.head())

# Menampilkan informasi tentang dataset
print("\nInformasi Dataset:")
print(df.info())
