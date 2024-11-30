from faker import Faker
import pandas as pd
import random
from datetime import datetime, timedelta

# Inisialisasi Faker dengan locale global
fake = Faker('ja_JP')

# Daftar tipe anime
anime_types = ['TV', 'Movie', 'ONA', 'OVA']

# Daftar tipe manga
manga_types = ['LN', 'Manga', 'One-shot', 'Web Manga']

# Daftar rating PG
pg_ratings = ['G', 'PG', 'PG-13', 'R', 'N-17']

# Daftar musim tayang
premiered_seasons = ['Spring', 'Summer', 'Autumn', 'Winter']

# Baca data series dari file CSV
series_df = pd.read_csv('series.csv')

# Filter series Anime dan Manga
anime_series = series_df[series_df['media_type'] == 'Anime']
manga_series = series_df[series_df['media_type'] == 'Manga']

# Baca data studios dari file CSV
studios_df = pd.read_csv('studios.csv')
studio_names = studios_df['company_name'].tolist()

# Fungsi untuk membuat data dummy anime
def generate_anime_data(jumlah_data, anime_series, studio_names):
    data = []
    anime_titles = anime_series['main_title'].tolist()
    used_titles = set()
    
    for _ in range(jumlah_data):
        # Pilih judul anime yang belum pernah digunakan
        main_title = random.choice([title for title in anime_titles if title not in used_titles])
        used_titles.add(main_title)
        
        # Cek status dari series asli
        status = anime_series[anime_series['main_title'] == main_title]['status'].values[0]
        
        # Jika status ongoing, batasi tipe anime
        if status == 'Ongoing':
            type = random.choice(['TV', 'ONA', 'OVA'])
            total_episodes = random.randint(1, 100)
            date_first_episode_aired = fake.date_between(start_date='-10y', end_date='today')
            date_last_episode_aired = None
            total_episodes = None
        else:
            type = random.choice(anime_types)
            total_episodes = random.randint(1, 100) if type != 'Movie' else 1
            date_first_episode_aired = fake.date_between(start_date='-10y', end_date='today')
            
            if type != 'Movie':
                date_last_episode_aired = date_first_episode_aired + timedelta(days=random.randint(30, 365))
            else:
                date_last_episode_aired = None
        
        studio_company_name = random.choice(studio_names)
        premiered = random.choice(premiered_seasons)
        source = fake.sentence(nb_words=3, variable_nb_words=True).strip('.')
        duration = random.randint(12, 60) if type != 'Movie' else random.randint(90, 180)
        pg_rating = random.choice(pg_ratings)

        data.append({
            'main_title': main_title,
            'studio_company_name': studio_company_name,
            'type': type,
            'total_episodes': total_episodes,
            'date_first_episode_aired': date_first_episode_aired,
            'date_last_episode_aired': date_last_episode_aired,
            'premiered': premiered,
            'source': source,
            'duration': duration,
            'pg_rating': pg_rating
        })
    
    return data

# Fungsi untuk membuat data dummy manga
def generate_manga_data(jumlah_data, manga_series):
    data = []
    manga_titles = manga_series['main_title'].tolist()
    used_titles = set()
    
    for _ in range(jumlah_data):
        # Pilih judul manga yang belum pernah digunakan
        main_title = random.choice([title for title in manga_titles if title not in used_titles])
        used_titles.add(main_title)
        
        # Cek status dari series asli
        status = manga_series[manga_series['main_title'] == main_title]['status'].values[0]
        
        # Jika status ongoing, batasi tipe manga
        if status == 'Ongoing':
            type = random.choice(['Manga', 'LN', 'Web Manga'])
            total_volumes = random.randint(1, 50)
            total_chapters = random.randint(1, 500)
            date_first_chapter_published = fake.date_between(start_date='-20y', end_date='today')
            date_last_chapter_published = None
            total_chapters = None
            total_volumes = None
        else:
            type = random.choice(manga_types)
            total_volumes = random.randint(1, 50) if type != 'One-shot' else 1
            total_chapters = random.randint(1, 500) if type != 'One-shot' else 1
            date_first_chapter_published = fake.date_between(start_date='-20y', end_date='today')
            
            if type != 'One-shot':
                date_last_chapter_published = date_first_chapter_published + timedelta(days=random.randint(30, 3650))
            else:
                date_last_chapter_published = date_first_chapter_published
        
        serializations = ', '.join(random.sample(['Shonen Jump', 'Shueisha', 'Kodansha', 'Kadokawa', 'Ascii Media Works'], random.randint(1, 3)))

        data.append({
            'main_title': main_title,
            'type': type,
            'total_volumes': total_volumes,
            'total_chapters': total_chapters,
            'date_first_chapter_published': date_first_chapter_published,
            'date_last_chapter_published': date_last_chapter_published,
            'serializations': serializations
        })
    
    return data

# Pastikan jumlah data series cukup untuk 158 entri
assert len(anime_series) + len(manga_series) >= 158, "Tidak cukup judul series untuk 158 entri"

# Tentukan jumlah data untuk anime dan manga
jumlah_anime = min(79, len(anime_series))
jumlah_manga = min(79, len(manga_series))

# Buat data dummy anime
anime_data = generate_anime_data(jumlah_anime, anime_series, studio_names)
anime_df = pd.DataFrame(anime_data)

# Buat data dummy manga
manga_data = generate_manga_data(jumlah_manga, manga_series)
manga_df = pd.DataFrame(manga_data)

# Simpan ke file CSV terpisah
anime_df.to_csv('anime.csv', index=False)
manga_df.to_csv('manga.csv', index=False)

# Cetak informasi
print(f"Jumlah data Anime: {len(anime_df)}")
print(f"Jumlah data Manga: {len(manga_df)}")
