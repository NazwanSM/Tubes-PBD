import pandas as pd
import random
from datetime import datetime, timedelta

user_df = pd.read_csv('user.csv')

def generate_discussions(user_df, num_discussions_per_user=3):
    # Siapkan list untuk menyimpan data diskusi
    discussions_list = []
    
    # Daftar deskripsi diskusi contoh
    discussion_descriptions = [
        "Diskusi tentang pengembangan teknologi terbaru",
        "Sharing pengalaman belajar pemrograman",
        "Strategi manajemen proyek IT",
        "Tips sukses dalam karier teknologi informasi",
        "Analisis tren teknologi masa depan",
        "Diskusi tentang kecerdasan buatan",
        "Pengalaman magang di perusahaan teknologi",
        "Berbagi pengetahuan tentang desain antarmuka",
        "Membahas etika dalam pengembangan teknologi",
        "Diskusi tentang keamanan informasi",
        "Pengembangan software open source",
        "Tantangan dalam dunia pengembangan web",
        "Strategi belajar pemrograman yang efektif",
        "Diskusi tentang blockchain dan cryptocurrency",
        "Pengalaman mengikuti kompetisi coding"
    ]
    
    # Loop melalui setiap pengguna
    for _, user in user_df.iterrows():
        username = user['username']
        
        # Tentukan jumlah diskusi untuk pengguna ini
        num_discussions = random.randint(1, num_discussions_per_user)
        
        # Generate diskusi untuk pengguna
        for discussion_order in range(1, num_discussions + 1):
            # Pilih deskripsi diskusi secara acak
            description = random.choice(discussion_descriptions)
            
            # Generate tanggal posting (antara tanggal bergabung dan sekarang)
            date_joined = pd.to_datetime(user['date_joined'])
            max_days = (datetime.now() - date_joined).days
            random_days = random.randint(0, max_days)
            date_posted = date_joined + timedelta(days=random_days)
            
            # Tambahkan data diskusi ke list
            discussions_list.append({
                'username': username,
                'discussion_order_number': discussion_order,
                'descriptions': description,
                'date_posted': date_posted.date()
            })
    
    # Buat DataFrame dari list diskusi
    discussions_df = pd.DataFrame(discussions_list)
    
    return discussions_df

# Baca file CSV user

# Generate relasi discussions
discussions_relations = generate_discussions(user_df)

# Simpan ke CSV
discussions_relations.to_csv('discussions.csv', index=False)