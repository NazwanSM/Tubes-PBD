import pandas as pd

# Membaca file CSV
series_df = pd.read_csv('series.csv')
characters_df = pd.read_csv('character.csv')

# Membuat relasi series_characters
def create_series_characters_relation():
    series_characters = []
    series_count = len(series_df)
    characters_count = len(characters_df)
    
    for i in range(characters_count):
        # Menggunakan modulo untuk mengulang index series
        series_index = i % series_count
        
        series_main_title = series_df.loc[series_index, 'main_title']
        character_name = characters_df.loc[i, 'name']
        
        series_characters.append({
            'series_main_title': series_main_title,
            'character_name': character_name
        })
    
    # Mengonversi ke DataFrame untuk kemudahan manipulasi
    series_characters_df = pd.DataFrame(series_characters)
    
    return series_characters_df

# Membuat relasi
series_characters_relation = create_series_characters_relation()


# Menyimpan ke CSV jika diperlukan
series_characters_relation.to_csv('series_characters.csv', index=False)