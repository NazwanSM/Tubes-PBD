import pandas as pd
import random
from datetime import datetime

# Baca data dari CSV
staff_df = pd.read_csv('staff.csv')
anime_df = pd.read_csv('anime.csv')
manga_df = pd.read_csv('manga.csv')

# Daftar roles untuk published_manga
manga_roles = ['Art', 'Story']

# Fungsi untuk generate data published_manga
def generate_published_manga(staff_df, manga_df):
    published_manga_data = []
    
    # Buat set untuk melacak kombinasi yang sudah ada
    unique_combinations = set()
    
    # Pilih secara acak 75 entri
    selected_staff = staff_df.sample(n=min(75, len(staff_df)))
    selected_manga = manga_df.sample(n=min(75, len(manga_df)))
    
    for _, staff in selected_staff.iterrows():
        for _, manga in selected_manga.iterrows():
            # Cek kombinasi unik
            combination = (staff['name'], manga['main_title'])
            if combination not in unique_combinations:
                # Tentukan probabilitas untuk setiap staff terlibat dalam manga
                if random.random() < 0.3:  # 30% peluang keterlibatan
                    # Pilih roles secara acak
                    role = random.choice(manga_roles)
                    
                    # Ambil tahun publikasi dari manga
                    year_published = int(str(manga['date_first_chapter_published'])[:4])
                    
                    published_manga_data.append({
                        'people_name': staff['name'],
                        'manga_main_title': manga['main_title'],
                        'roles': role,
                        'year_published': year_published
                    })
                    
                    # Tambahkan kombinasi ke set
                    unique_combinations.add(combination)
    
    return pd.DataFrame(published_manga_data)

# Fungsi untuk generate data anime_staffs
def generate_anime_staffs(staff_df, anime_df):
    anime_staffs_data = []
    
    # Buat set untuk melacak kombinasi yang sudah ada
    unique_combinations = set()
    
    # Pilih secara acak 75 entri
    selected_staff = staff_df.sample(n=min(75, len(staff_df)))
    selected_anime = anime_df.sample(n=min(75, len(anime_df)))
    
    for _, staff in selected_staff.iterrows():
        for _, anime in selected_anime.iterrows():
            # Cek kombinasi unik
            combination = (staff['name'], anime['main_title'])
            if combination not in unique_combinations:
                # Tentukan probabilitas untuk setiap staff terlibat dalam anime
                if random.random() < 0.3:  # 30% peluang keterlibatan
                    anime_staffs_data.append({
                        'people_name': staff['name'],
                        'anime_main_title': anime['main_title']
                    })
                    
                    # Tambahkan kombinasi ke set
                    unique_combinations.add(combination)
    
    return pd.DataFrame(anime_staffs_data)

# Validasi foreign key
def validate_foreign_keys(df, staff_df, reference_df, staff_column, title_column):
    invalid_staff = df[~df[staff_column].isin(staff_df['name'])]
    invalid_title = df[~df[title_column].isin(reference_df['main_title'])]
    
    if len(invalid_staff) > 0:
        print(f"\nPeringatan: Terdapat {staff_column} yang tidak valid:")
        print(invalid_staff)
    
    if len(invalid_title) > 0:
        print(f"\nPeringatan: Terdapat {title_column} yang tidak valid:")
        print(invalid_title)
    
    if len(invalid_staff) == 0 and len(invalid_title) == 0:
        print("\nSemua foreign key valid.")
    
    # Cek duplikasi
    duplicates = df.duplicated(subset=[staff_column, title_column], keep=False)
    if duplicates.any():
        print("\nPeringatan: Terdapat duplikasi kombinasi staff dan title:")
        print(df[duplicates])
    else:
        print("\nTidak ada duplikasi kombinasi staff dan title.")

# Generate data
published_manga_df = generate_published_manga(staff_df, manga_df)
anime_staffs_df = generate_anime_staffs(staff_df, anime_df)

published_manga_df.to_csv('published_manga.csv', index=False)
anime_staffs_df.to_csv('anime_staffs.csv', index=False)