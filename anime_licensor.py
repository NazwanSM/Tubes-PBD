import pandas as pd
import random
# Baca data dari CSV
companies_df = pd.read_csv('companies.csv')
anime_df = pd.read_csv('anime.csv')
producers_df = pd.read_csv('producers.csv')
licensors_df = pd.read_csv('licensors.csv')

def generate_comprehensive_relations(anime_df, licensors_df, producers_df):
    # Ambil daftar nama licensors dan producers
    licensors_companies = licensors_df['company_name'].tolist()
    producers_companies = producers_df['company_name'].tolist()
    
    # Inisialisasi list untuk menyimpan data relasi
    anime_licensors_data = []
    anime_producers_data = []
    
    # Pastikan setiap anime memiliki minimal 1 lisensi dan 1 produser
    for _, anime in anime_df.iterrows():
        # Lisensi: minimal 1, maksimal 3
        num_licensors = random.randint(1, 3)
        selected_licensors = random.sample(licensors_companies, num_licensors)
        
        for licensor in selected_licensors:
            anime_licensors_data.append({
                'company_name': licensor,
                'anime_main_title': anime['main_title']
            })
        
        # Produser: minimal 1, maksimal 2
        num_producers = random.randint(1, 2)
        selected_producers = random.sample(producers_companies, num_producers)
        
        for producer in selected_producers:
            anime_producers_data.append({
                'company_name': producer,
                'anime_main_title': anime['main_title']
            })
    
    # Konversi ke DataFrame
    anime_licensors_df = pd.DataFrame(anime_licensors_data)
    anime_producers_df = pd.DataFrame(anime_producers_data)
    
    # Validasi
    def validate_relations():
        # Pastikan setiap anime memiliki minimal 1 lisensi
        licensors_count = anime_licensors_df.groupby('anime_main_title').size()
        assert (licensors_count >= 1).all(), "Ada anime yang tidak memiliki lisensi"
        
        # Pastikan setiap anime memiliki minimal 1 produser
        producers_count = anime_producers_df.groupby('anime_main_title').size()
        assert (producers_count >= 1).all(), "Ada anime yang tidak memiliki produser"
        
        # Logging statistik
        print("Validasi Relasi Anime:")
        print(f"Total Anime: {len(anime_df)}")
        print(f"Anime dengan Lisensi: {len(licensors_count)}")
        print(f"Anime dengan Produser: {len(producers_count)}")
        print(f"Rata-rata Lisensi per Anime: {licensors_count.mean():.2f}")
        print(f"Rata-rata Produser per Anime: {producers_count.mean():.2f}")
    
    # Jalankan validasi
    validate_relations()
    
    return anime_licensors_df, anime_producers_df


# Generate relasi
anime_licensors_df, anime_producers_df = generate_comprehensive_relations(anime_df, licensors_df, producers_df)

# Simpan ke file CSV
anime_licensors_df.to_csv('anime_licensors.csv', index=False)
anime_producers_df.to_csv('anime_producers.csv', index=False)
