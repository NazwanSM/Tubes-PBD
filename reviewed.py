import pandas as pd
import random

# Baca data dari CSV
user_df = pd.read_csv('user.csv')
series_df = pd.read_csv('series.csv')
reviews_df = pd.read_csv('reviews.csv')

# Fungsi untuk generate data reviewed
def generate_reviewed(user_df, series_df, reviews_df):
    reviewed_data = []
    
    # Pilih secara acak 75 entri
    selected_users = user_df.sample(n=min(75, len(user_df)))
    selected_series = series_df.sample(n=min(75, len(series_df)))
    
    # Set untuk melacak kombinasi unik user-series
    unique_user_series_combinations = set()
    
    for _, user in selected_users.iterrows():
        for _, series in selected_series.iterrows():
            # Cek kombinasi unik user-series
            combination = (user['username'], series['main_title'])
            
            if combination not in unique_user_series_combinations:
                # Pilih review secara acak yang sesuai
                matching_reviews = reviews_df.sample(n=1)
                
                for _, review in matching_reviews.iterrows():
                    # Tentukan probabilitas review
                    if random.random() < 0.4:  # 40% peluang review
                        reviewed_data.append({
                            'user_username': user['username'],
                            'series_main_title': series['main_title'],
                            'review_id': review['review_id']
                        })
                        
                        # Tambahkan kombinasi ke set
                        unique_user_series_combinations.add(combination)
    
    return pd.DataFrame(reviewed_data)

# Generate data reviewed
reviewed_df = generate_reviewed(user_df, series_df, reviews_df)

# Simpan ke CSV
reviewed_df.to_csv('reviewed.csv', index=False)
