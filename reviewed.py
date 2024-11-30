import pandas as pd
import random

# Baca data dari CSV
user_df = pd.read_csv('user.csv')
series_df = pd.read_csv('series.csv')
reviews_df = pd.read_csv('reviews.csv')

# Fungsi untuk generate data reviewed
def generate_reviewed(user_df, series_df, reviews_df):
    reviewed_data = []
    existing_review_ids = set()

    # Pilih secara acak 75 entri
    selected_users = user_df.sample(n=min(75, len(user_df)))
    selected_series = series_df.sample(n=min(75, len(series_df)))

    # Set untuk melacak kombinasi unik user-series
    unique_user_series_combinations = set()

    # Hitung jumlah data yang harus dibuat
    target_data_count = min(150, len(reviews_df))

    while len(reviewed_data) < target_data_count:
        # Pilih user dan series secara acak
        user = selected_users.sample(n=1).iloc[0]
        series = selected_series.sample(n=1).iloc[0]

        # Cek kombinasi unik user-series
        combination = (user['username'], series['main_title'])
        if combination not in unique_user_series_combinations:
            # Pilih review secara acak yang belum digunakan
            matching_reviews = reviews_df[~reviews_df['review_id'].isin(existing_review_ids)].sample(n=1)

            for _, review in matching_reviews.iterrows():
                # Tentukan probabilitas review
                if random.random() < 0.4:  # 40% peluang review
                    reviewed_data.append({
                        'user_username': user['username'],
                        'series_main_title': series['main_title'],
                        'review_id': review['review_id']
                    })

                    # Tambahkan review_id ke set
                    existing_review_ids.add(review['review_id'])

                    # Tambahkan kombinasi ke set
                    unique_user_series_combinations.add(combination)

    return pd.DataFrame(reviewed_data)

# Generate data reviewed
reviewed_df = generate_reviewed(user_df, series_df, reviews_df)

# Simpan ke CSV
reviewed_df.to_csv('reviewed.csv', index=False)
