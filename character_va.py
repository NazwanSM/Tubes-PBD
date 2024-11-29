import pandas as pd
import random

# Membaca file CSV
characters_df = pd.read_csv('character.csv')
voice_actors_df = pd.read_csv('voice_actors.csv')

def generate_character_va_relation():
    # Inisialisasi list untuk menyimpan relasi
    character_va_relations = []
    
    # Daftar voice actor yang sudah digunakan untuk menghindari duplikasi
    used_voice_actors = set()
    
    # Iterasi setiap karakter
    for idx, character_name in enumerate(characters_df['name']):
        # Tentukan role berdasarkan indeks
        character_role = 'Main' if idx < 158 else 'Support'
        
        # Pilih voice actor yang belum pernah digunakan
        available_voice_actors = voice_actors_df[~voice_actors_df['name'].isin(used_voice_actors)]['name'].tolist()
        
        # Jika tidak ada voice actor tersedia, reset daftar voice actor yang sudah digunakan
        if not available_voice_actors:
            used_voice_actors.clear()
            available_voice_actors = voice_actors_df['name'].tolist()
        
        # Pilih satu voice actor secara acak
        selected_voice_actor = random.choice(available_voice_actors)
        
        # Tambahkan ke daftar relasi
        character_va_relations.append({
            'character_name': character_name,
            'people_name': selected_voice_actor,
            'character_role': character_role  # Tambahkan field role
        })
        
        # Tandai voice actor sebagai sudah digunakan
        used_voice_actors.add(selected_voice_actor)
    
    # Konversi ke DataFrame
    character_va_df = pd.DataFrame(character_va_relations)
    
    return character_va_df

# Generate relasi
character_va_relations = generate_character_va_relation()

# Simpan ke CSV
character_va_relations.to_csv('character_va.csv', index=False)
