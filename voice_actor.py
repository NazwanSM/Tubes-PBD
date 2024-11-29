import pandas as pd
import random
from faker import Faker

# Membaca file CSV
people_df = pd.read_csv('people.csv')

# Inisialisasi Faker
fake = Faker('id_ID')  # Menggunakan locale Indonesia

def generate_voice_actors(num_actors=150):
    # Ambil sample nama dari people.csv
    available_names = people_df['name'].tolist()
    
    # Pilih nama secara acak untuk voice actors
    voice_actors = random.sample(available_names, min(num_actors, len(available_names)))
    
    # Membuat DataFrame untuk voice actors
    voice_actors_df = pd.DataFrame({
        'name': voice_actors
    })
    
    # Pastikan nama unik
    voice_actors_df = voice_actors_df.drop_duplicates(subset=['name'])
    
    return voice_actors_df

# Generate voice actors
voice_actors = generate_voice_actors()


# Simpan ke CSV
voice_actors.to_csv('voice_actors.csv', index=False)