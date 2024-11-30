import pandas as pd
import random
from datetime import datetime, timedelta

def generate_weak_entity_discussions(user_df, num_discussions_per_title=3):
    # Daftar judul diskusi anime dan manga yang spesifik
    discussion_titles = [
        "Analisis Genre Shounen Terkini",
        "Perkembangan Manga Slice of Life",
        "Evolusi Genre Mecha dalam Anime",
        "Trend Isekai di Industri Anime",
        "Karakteristik Anime Psychological",
        "Karya Terbaru Studio Ghibli",
        "Perbandingan Anime MAPPA vs Ufotable",
        "Kejayaan Studio Trigger",
        "Anime Original vs Adaptasi Manga",
        "Peranan Animator Legendaris Jepang",
        "Filosofi dalam Karya Makoto Shinkai",
        "Representasi Sosial dalam Manga Kontemporer",
        "Perkembangan Karakter dalam Anime Modern",
        "Teknik Storytelling di Anime Populer",
        "Pengaruh Budaya Pop Jepang dalam Anime",
        "Sejarah Perkembangan Manga Shojo",
        "Fenomena Crossover Anime",
        "Dampak Streaming terhadap Industri Anime",
        "Anime sebagai Media Ekspresi Sosial",
        "Komparasi Manga Original dan Adaptasinya"
    ]
    
    discussion_descriptions = [
        "Diskusi mendalam tentang tren dan perkembangan terbaru dalam dunia anime.",
        "Analisis komprehensif tentang karakteristik dan inovasi dalam genre anime.",
        "Eksplorasi mendalam tentang teknik storytelling dalam manga kontemporer.",
        "Pembahasan kritis tentang representasi sosial dalam karya anime terkini.",
        "Tinjauan komprehensif tentang pengaruh budaya pop terhadap industri anime.",
        "Refleksi tentang peran anime dalam mengkomunikasikan isu-isu sosial.",
        "Diskusi interaktif seputar evolusi genre dan tema dalam manga.",
        "Analisis mendalam tentang teknik animasi dan storytelling terbaru.",
        "Pembahasan tentang pengaruh teknologi dalam produksi anime modern.",
        "Eksplorasi kontribusi studio anime terkemuka dalam industri global."
    ]
    
    # Dictionary untuk melacak urutan diskusi terakhir untuk setiap judul
    last_discussion_order = {title: 0 for title in discussion_titles}
    
    # List untuk menyimpan data diskusi
    discussions_list = []
    
    # Loop melalui setiap pengguna
    for _, user in user_df.iterrows():
        username = user['username']
        
        # Pilih sejumlah judul diskusi secara acak untuk user ini
        selected_titles = random.sample(discussion_titles, 
                                        k=random.randint(1, min(5, len(discussion_titles))))
        
        # Generate diskusi untuk setiap judul
        for discussion_title in selected_titles:
            # Tentukan jumlah diskusi untuk judul ini
            num_discussions = random.randint(1, num_discussions_per_title)
            
            # Buat daftar urutan diskusi untuk judul ini
            for _ in range(num_discussions):
                # Naikkan urutan diskusi untuk judul ini
                last_discussion_order[discussion_title] += 1
                
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
                    'discussion_title': discussion_title,
                    'discussion_order_number': last_discussion_order[discussion_title],
                    'descriptions': description,
                    'date_posted': date_posted.date()
                })
    
    # Buat DataFrame dari list diskusi
    discussions_df = pd.DataFrame(discussions_list)
    
    return discussions_df

# Baca file CSV user
user_df = pd.read_csv('user.csv')

# Generate relasi discussions sebagai weak entity
weak_entity_discussions = generate_weak_entity_discussions(user_df)

# Simpan ke CSV
weak_entity_discussions.to_csv('weak_entity_anime_discussions.csv', index=False)