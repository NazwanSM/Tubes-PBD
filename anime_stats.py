import pandas as pd
import random
from faker import Faker

# Inisialisasi Faker
fake = Faker('id_ID')

# Baca data dari CSV
user_df = pd.read_csv('user.csv')
manga_df = pd.read_csv('manga.csv')
anime_df = pd.read_csv('anime.csv')

# Daftar status untuk manga dan anime
read_status_options = ['Reading', 'Completed', 'On Hold', 'Dropped', 'Plan to Read']
watch_status_options = ['Watching', 'Completed', 'On Hold', 'Dropped', 'Plan to Watch']

def generate_manga_stats(user_df, manga_df):
    manga_stats_data = []
    
    # Pilih secara acak 75% user
    selected_users = user_df.sample(n=int(len(user_df) * 0.75))
    
    # Set untuk melacak kombinasi unik
    unique_combinations = set()
    
    for _, user in selected_users.iterrows():
        # Pilih beberapa manga secara acak
        selected_manga = manga_df.sample(n=random.randint(1, 10))
        
        for _, manga in selected_manga.iterrows():
            # Cek kombinasi unik
            combination = (user['username'], manga['main_title'])
            
            if combination not in unique_combinations:
                # Tentukan probabilitas pembacaan
                if random.random() < 0.7:  # 70% peluang membaca
                    manga_stats_data.append({
                        'user_username': user['username'],
                        'manga_main_title': manga['main_title'],
                        'read_status': random.choice(read_status_options),
                        'rating': random.randint(1, 10) if random.random() < 0.8 else None
                    })
                    
                    # Tambahkan kombinasi ke set
                    unique_combinations.add(combination)
    
    return pd.DataFrame(manga_stats_data)

def generate_anime_stats(user_df, anime_df):
    anime_stats_data = []
    
    # Pilih secara acak 75% user
    selected_users = user_df.sample(n=int(len(user_df) * 0.75))
    
    # Set untuk melacak kombinasi unik
    unique_combinations = set()
    
    for _, user in selected_users.iterrows():
        # Pilih beberapa anime secara acak
        selected_anime = anime_df.sample(n=random.randint(1, 10))
        
        for _, anime in selected_anime.iterrows():
            # Cek kombinasi unik
            combination = (user['username'], anime['main_title'])
            
            if combination not in unique_combinations:
                # Tentukan probabilitas menonton
                if random.random() < 0.7:  # 70% peluang menonton
                    # Hitung episode yang ditonton
                
                
                    anime_stats_data.append({
                        'user_username': user['username'],
                        'anime_main_title': anime['main_title'],
                        'watch_status': random.choice(watch_status_options),
                        'rating': random.randint(1, 10) if random.random() < 0.8 else None
                    })
                    
                    # Tambahkan kombinasi ke set
                    unique_combinations.add(combination)
    
    return pd.DataFrame(anime_stats_data)

# Generate data
manga_stats_df = generate_manga_stats(user_df, manga_df)
anime_stats_df = generate_anime_stats(user_df, anime_df)

# Simpan ke CSV
manga_stats_df.to_csv('manga_stats.csv', index=False)
anime_stats_df.to_csv('anime_stats.csv', index=False)