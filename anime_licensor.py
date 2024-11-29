import pandas as pd
import random

# Baca data dari CSV
companies_df = pd.read_csv('companies.csv')
anime_df = pd.read_csv('anime.csv')

# Baca file producers.csv dan licensors.csv
producers_df = pd.read_csv('producers.csv')
licensors_df = pd.read_csv('licensors.csv')

# Fungsi untuk membuat relasi anime_licensors
def generate_anime_licensors(anime_df, licensors_df):
    anime_licensors_data = []
    
    # Ambil daftar nama licensors dari file licensors.csv
    licensors_companies = licensors_df['company_name'].tolist()
    
    # Acak urutan licensors
    random.shuffle(licensors_companies)
    
    # Batasi jumlah anime yang akan diberi licensor
    for i, anime in anime_df.head(75).iterrows():
        # Pilih 1-3 licensors untuk setiap anime
        num_licensors = random.randint(1, 3)
        selected_licensors = random.sample(licensors_companies, num_licensors)
        
        for licensor in selected_licensors:
            anime_licensors_data.append({
                'company_name': licensor,
                'anime_main_title': anime['main_title']
            })
    
    return pd.DataFrame(anime_licensors_data)

# Fungsi untuk membuat relasi anime_producers
def generate_anime_producers(anime_df, producers_df):
    anime_producers_data = []
    
    # Ambil daftar nama producers dari file producers.csv
    producers_companies = producers_df['company_name'].tolist()
    
    # Acak urutan producers
    random.shuffle(producers_companies)
    
    # Batasi jumlah anime yang akan diberi producer
    for i, anime in anime_df.head(75).iterrows():
        # Pilih 1-2 producers untuk setiap anime
        num_producers = random.randint(1, 2)
        selected_producers = random.sample(producers_companies, num_producers)
        
        for producer in selected_producers:
            anime_producers_data.append({
                'company_name': producer,
                'anime_main_title': anime['main_title']
            })
    
    return pd.DataFrame(anime_producers_data)

# Generate data untuk anime_licensors dan anime_producers
anime_licensors_df = generate_anime_licensors(anime_df, licensors_df)
anime_producers_df = generate_anime_producers(anime_df, producers_df)

# Simpan ke file CSV
anime_licensors_df.to_csv('anime_licensors.csv', index=False)
anime_producers_df.to_csv('anime_producers.csv', index=False)