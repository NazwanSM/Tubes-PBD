from faker import Faker
import pandas as pd
import random
import string

# Inisialisasi Faker dengan locale Indonesia
fake = Faker()

series_titles = ["Naruto", "One Piece", "Bleach", "Attack on Titan", "Fullmetal Alchemist",
    "Death Note", "Demon Slayer", "My Hero Academia", "Jujutsu Kaisen", "Hunter x Hunter",
    "Haikyuu!!", "Gintama", "Steins;Gate", "Re:Zero", "Sword Art Online", "Fate/Stay Night",
    "Tokyo Ghoul", "Cowboy Bebop", "Neon Genesis Evangelion", "Mob Psycho 100",
    "JoJo's Bizarre Adventure", "Vinland Saga", "Mushoku Tensei", "Spy x Family",
    "Chainsaw Man", "Fruits Basket", "Horimiya", "Monogatari Series", "Berserk",
    "Overlord", "Konosuba", "Violet Evergarden", "Promised Neverland", "Shokugeki no Soma",
    "Noragami", "Yuri!!! on Ice", "Ansatsu Kyoushitsu", "Durarara!!", "Magi",
    "Nisekoi", "Parasyte", "Barakamon", "Oregairu", "Saekano", "Bungo Stray Dogs",
    "Kuroko's Basketball", "Yowamushi Pedal", "Free!", "Code Geass", "Fairy Tail",
    "Black Clover", "Dr. Stone", "Your Name", "A Silent Voice", "Psycho-Pass",
    "Erased", "Made in Abyss", "Charlotte", "Clannad", "K-On!", "Lucky Star",
    "Nichijou", "Anohana", "Your Lie in April", "Cells at Work", "Goblin Slayer",
    "Rising of the Shield Hero", "That Time I Got Reincarnated as a Slime",
    "Darling in the Franxx", "Black Butler", "Blue Exorcist",
    "Sword Art Online Alternative: Gun Gale Online", "No Game No Life", "Kakegurui",
    "The Disastrous Life of Saiki K.", "Hinamatsuri", "Golden Kamuy", "Dororo",
    "Megalobox", "Carole & Tuesday", "Banana Fish", "Devilman Crybaby",
    "Cells at Work: Code Black", "Tower of God", "The God of High School", "Noblesse",
    "Great Pretender", "Dorohedoro", "Beastars", "Keep Your Hands Off Eizouken!",
    "Toilet-Bound Hanako-kun", "Kakushigoto", "Arte", "Gleipnir", "Darwin's Game",
    "Somali and the Forest Spirit", "In/Spectre", "Kaguya-sama: Love is War",
    "Quintessential Quintuplets", "Domestic Girlfriend", "Rent-a-Girlfriend",
    "Uzaki-chan Wants to Hang Out!", "Arifureta", "How a Realist Hero Rebuilt the Kingdom",
    "Jobless Reincarnation", "Combatants Will Be Dispatched!", "My Next Life as a Villainess",
    "The Misfit of Demon King Academy", "Cautious Hero", "Ascendance of a Bookworm",
    "Grimgar of Fantasy and Ash", "Is It Wrong to Try to Pick Up Girls in a Dungeon?",
    "DanMachi", "Log Horizon", "How Heavy Are the Dumbbells You Lift?", "Grand Blue",
    "Komi Can't Communicate", "Sono Bisque Doll wa Koi wo Suru", "Nagatoro",
    "Aharen-san wa Hakarenai", "Teasing Master Takagi-san", "Rascal Does Not Dream of Bunny Girl Senpai",
    "Yamada-kun and the Seven Witches", "The World God Only Knows", "Haganai", "Gamers!",
    "Classroom of the Elite", "The Melancholy of Haruhi Suzumiya", "Love, Chunibyo & Other Delusions",
    "A Certain Scientific Railgun", "Parasyte: The Maxim", "Black Lagoon", "Angel Beats!",
    "Trigun", "Soul Eater", "Akame ga Kill!", "Sword Art Online: Alicization",
    "Fairy Tail: Final Series", "Blue Period", "Ergo Proxy", "86 (Eighty-Six)", "The Ancient Magus' Bride", "Akudama Drive", 
    "Horou Musuko", "Witch Hunter Robin", "Texhnolyze", "Samurai Champloo", "Baccano!",
    "Eden of the East", "Angels of Death", "Zombie Land Saga", "ReLIFE", "Plastic Memories", 
    "Tamako Market", "Akiba Maid War", "Summer Wars", "Children of the Sea", "The Boy and the Beast"]

genres = ['Drama', 'Romance', 'Comedy', 'Horror', 'Action', 'Documentary', 'Fantasy', 'Sci-Fi']
themes = ['Gore', 'School', 'Mecha', 'Slice of Life', 'Psychological', 'Supernatural', 'Historical']
demographics = ['Seinen', 'Shounen', 'Shoujo', 'Josei']

review_categories = ['recommended', 'not recommended', 'mixed feelings']

nationalities = [('American',0.2), ('Japanese',0.5), ('Korean',0.1), ('British',0.1), ('French',0.05), ('German',0.05)]

anime_companies =["Toei Animation", "Studio Ghibli", "Sunrise", "Bones", "Madhouse","Kyoto Animation", "Ufotable", "MAPPA", "Trigger", "CloverWorks","A-1 Pictures", "P.A. Works", "Shaft", "J.C. Staff", "Production I.G","Lerche", "Silver Link", "Studio Pierrot", "Brain's Base", "White Fox","Aniplex", "Kadokawa", "Bandai Visual", "King Records", "Pony Canyon","NBCUniversal Entertainment Japan", "Avex Pictures", "Sony Music","Toho Animation", "Shochiku", "Shueisha", "Kodansha", "Media Factory","Good Smile Company", "Bushiroad", "Square Enix", "Yomiuri Telecasting","TV Tokyo", "NHK", "Netflix", "Crunchyroll", "Funimation", "Sentai Filmworks", "Discotek Media","Viz Media", "Anime Limited", "Madman Entertainment", "AnimEigo", "Right Stuf", "GKIDS", "Manga Entertainment", "4Kids Entertainment", "Media Blasters", "ADV Films", "Nozomi Entertainment", "NIS America", "Amazon Prime Video", "HIDIVE", "VRV", "Hulu", "Disney+"]

people = ["Junko Takeuchi", "Mayumi Tanaka", "Masakazu Morita", "Yuki Kaji", "Romi Park",
    "Mamoru Miyano", "Natsuki Hanae", "Daiki Yamashita", "Junya Enoki", "Megumi Han",
    "Ayumu Murase", "Tomokazu Sugita", "Yusuke Kobayashi", "Yoshitsugu Matsuoka", "Noriaki Sugiyama",
    "Koichi Yamadera", "Megumi Ogata", "Setsuo Ito", "Daisuke Ono", "Shizuka Ishigami",
    "Yumi Uchiyama", "Takuya Eguchi", "Manaka Iwami", "Haruka Tomatsu", "Hiroshi Kamiya",
    "Hiroaki Iwanaga", "Satoshi Hino", "Jun Fukushima", "Yui Ishikawa", "Sumire Morohoshi",
    "Toshiyuki Toyonaga", "Jun Fukuyama", "Miyuki Sawashiro", "Kouki Uchiyama", "Tetsuya Kakihara",
    "Gakuto Kajiwara", "Ryunosuke Kamiki", "Miyu Irino", "Tomokazu Seki", "Shinnosuke Mitsushima",
    "Miyu Tomita", "Koki Uchiyama", "Yuichi Nakamura", "Aki Toyosaki", "Aya Hirano",
    "Minoru Shiraishi", "Ai Kayano", "Takahiro Sakurai", "Yuuichirou Umehara", "Kaito Ishikawa",
    "Shun Horie", "Kensho Ono", "Chikahiro Kobayashi", "Mayumi Shintani", "Rina Hidaka",
    "Yukana", "Nao Touyama", "Saori Hayami", "Kana Hanazawa", "Kana Ichinose",
    "Maaya Uchida", "Sora Amamiya", "Rie Kugimiya", "Megumi Ogata", "Chiaki Kobayashi",
    "Junichi Suwabe", "Hikaru Midorikawa", "Reina Ueda", "Noriyuki Abe", "Shinichi Suzuki", "Masashi Kudo", "George Wada", "Hiroshi Ōsaka", "Masao Maruyama",
    "Hikaru Kondo", "Yoshihiro Oyabu", "Makoto Kimura", "Mitsuhisa Ishikawa", "Takeshi Sasaki", "Shinji Takamatsu",
    "Tatsuya Matsubara", "Sho Tanaka", "Atsushi Kaneko", "Yoshikazu Higashimoto", "Masahiko Minami", 
    "Toshimichi Otsuki", "Yuuji Matsukura", "Toshiyasu Nagata", "Naokado Fujiyama", "Nobuhide Takagi", 
    "Kazuki Ooshima", "Keisuke Seshimo", "Yoshio Ookouchi", "Fumiko Tada", "Akiyuki Shinbo", "Shinichiro Inoue", 
    "Hiroshi Seko", "Kazuki Nishiwaki", "Shigeru Saito", "Yuichi Fukushima", "Naoki Amano", "Kohei Kawase",
    "Mitsuharu Inoue", "Shinji Kaneko", "Gen Fukunaga", "Toshihiko Seki", "Hiroyuki Oiwa", "Kenjirou Okada",
    "Takuya Tsunoki", "Makoto Furukawa", "Shin Itagaki", "Yoshitaka Kawaguchi", "Hiroyuki Shimizu", 
    "Yuji Shibata", "Shunsuke Saito", "Genki Kawamura", "Eunyoung Choi", "Motoki Tanaka", "Akito Takahashi", 
    "Kenji Horikawa", "Masanori Kitayama", "Hideyuki Kurata", "Kensuke Tateishi", "Naomi Ishida", "Takahiro Omori", 
    "Takahiro Nagasaki", "Koji Yamamoto", "Takahiro Suzuki", "Hironori Arai", "Yosuke Matsunaga", 
    "Yosuke Matsunaga", "Hikaru Kondo", "Yutaka Uemura", "Motohiro Sasaki", "Hirokazu Komatsu", "Masaaki Yuasa", 
    "Takahiro Omori", "Masashi Kudo", "Seong-ho Park", "Jeong Ji-hoon", "Ryosuke Nishii", "Hiroshi Seko", 
    "Shinji Horikawa", "Tsutomu Mizushima", "Shinichi Matsuki", "Hajime Ohtsuka", "Atsushi Takahashi", 
    "Shinpei Ezaki", "Kenichi Kawamura", "Takatoshi Suzuki", "Yuichiro Hayashi", "Kenjirou Gomi", 
    "Hiroaki Tsutsumi", "Jun Fukuyama", "Kazuhiro Yoneda", "Shinpei Ezaki", "Yusuke Kaneda", "Atsushi Tanaka", 
    "Hiroki Tsutsumi", "Atsushi Nishigori", "Takaharu Ozaki", "Kenji Nagasaki", "Yoshinobu Tokumoto", 
    "Kazuki Nomura", "Shunichi Natori", "Shinichi Masaki", "Masafumi Kimura", "Yasuhiro Takemoto", 
    "Toshiyuki Morikawa", "Masashi Kishimoto", "Eiichiro Oda", "Tite Kubo", "Hajime Isayama", "Hiromu Arakawa",
    "Tsugumi Ohba & Takeshi Obata", "Koyoharu Gotouge", "Kohei Horikoshi", "Gege Akutami", "Yoshihiro Togashi",
    "Haruichi Furudate", "Hideaki Sorachi", "Chiyomaru Shikura", "Tappei Nagatsuki", "Reki Kawahara",
    "Kinoko Nasu", "Sui Ishida", "Hajime Yatate", "Hideaki Anno", "ONE",
    "Hirohiko Araki", "Makoto Yukimura", "Rifujin na Magonote", "Tatsuya Endo", "Tatsuki Fujimoto",
    "Natsuki Takaya", "HERO", "Nisio Isin", "Kentaro Miura", "Kugane Maruyama",
    "Natsume Akatsuki", "Kana Akatsuki", "Kaiu Shirai & Posuka Demizu", "Yuto Tsukuda & Shun Saeki", "Adachitoka",
    "Mitsurou Kubo", "Yusei Matsui", "Ryohgo Narita", "Shinobu Ohtaka", "Naoshi Komi",
    "Hitoshi Iwaaki", "Satsuki Yoshino", "Wataru Watari", "Fumiaki Maruto", "Kafka Asagiri",
    "Tadatoshi Fujimaki", "Wataru Watanabe", "Koji Oji", "Ichiro Okouchi", "Hiro Mashima",
    "Yūki Tabata", "Riichiro Inagaki & Boichi", "Makoto Shinkai", "Yoshitoki Oima", "Gen Urobuchi",
    "Kei Sanbe", "Akihito Tsukushi", "Jun Maeda", "Kakifly", "Kagami Yoshimizu",
    "Keiichi Arawi", "Mari Okada", "Naoshi Arakawa", "Akane Shimizu", "Kumo Kagyu",
    "Aneko Yusagi", "Fuse", "Code:000", "Kazue Kato", "Keiichi Sigsawa",
    "Yuu Kamiya", "Homura Kawamoto", "Masao Ohtake", "Satoru Noda", "Osamu Tezuka",
    "Chikara Sakuma", "Shinichiro Watanabe", "Akimi Yoshida", "Go Nagai", "Shigemitsu Harada",
    "SIU", "Yongje Park", "Jeho Son & Kwangsu Lee", "Q Hayashida", "Paru Itagaki",
    "Sumito Owara", "AidaIro", "Sun Takeda", "FLIPFLOPs", "Yako Gureishi",
    "Kyo Shirodaira", "Aka Akasaka", "Negi Haruba", "Kei Sasuga", "Reiji Miyajima",
    "Take", "Dojyomaru", "Light Tuchihi", "Miya Kazuki", "Ao Jyumonji",
    "Fujino Omori", "Mamare Touno", "Yabako Sandrovich", "Kenji Inoue & Kimitake Yoshioka",
    "Tomohito Oda", "Shinichi Fukuda", "Nanashi", "Asato Mizu", "Soichiro Yamamoto",
    "Hajime Kamoshida", "Miki Yoshikawa", "Tamiki Wakaki", "Yomi Hirasaka", "Sekina Aoi",
    "Shogo Kinugasa", "Nagaru Tanigawa", "Torako", "Kazuma Kamachi", "Rei Hiroe",
    "Yasuhiro Nightow", "Atsushi Ohkubo", "Takahiro & Tetsuya Tashiro"]
# Fungsi untuk membuat data dummy pengguna
def generate_user_data(jumlah_data):
    data = []
    for _ in range(jumlah_data):
        data.append({
            'username': fake.user_name(),
            'birthday': fake.date_of_birth(minimum_age=18, maximum_age=65),
            'location': fake.address(),
            'biography': fake.text(max_nb_chars=200),
            'date_joined': fake.date_between(start_date='-5y', end_date='today')
        })
    return data

def generate_series_data(jumlah_data):
    data = []
    # Gunakan series_titles yang sudah ada, pastikan tidak ada judul kosong
    valid_titles = [title for title in series_titles if title.strip()]
    
    for i in range(min(jumlah_data, len(valid_titles))):
        main_title = valid_titles[i]
        data.append({
            'main_title': main_title,
            'synopsis': fake.text(max_nb_chars=500),
            'rating_score': round(random.uniform(1.0, 5.0), 1),
            'rating_total_users': random.randint(100, 10000),
            'media_type': random.choice(['Manga', 'Anime']),
            'status': random.choice(['Ongoing', 'Completed']),
            'genres': ', '.join(random.sample(genres, random.randint(1, 3))),
            'themes': ', '.join(random.sample(themes, random.randint(1, 3))),
            'demographics': random.choice(demographics),
            'total_members': random.randint(1000, 100000),
            'total_favorites': random.randint(100, 10000),
            'official_site': fake.url()
        })
    
    # Jika jumlah_data lebih besar dari jumlah judul, tambahkan data acak
    if jumlah_data > len(valid_titles):
        for _ in range(jumlah_data - len(valid_titles)):
            data.append({
                'main_title': fake.catch_phrase(),  # Gunakan catch_phrase sebagai judul acak
                'synopsis': fake.text(max_nb_chars=500),
                'rating_score': round(random.uniform(1.0, 5.0), 1),
                'rating_total_users': random.randint(100, 10000),
                'media_type': random.choice(['Manga', 'Anime']),
                'status': random.choice(['Ongoing', 'Completed']),
                'genres': ', '.join(random.sample(genres, random.randint(1, 3))),
                'themes': ', '.join(random.sample(themes, random.randint(1, 3))),
                'demographics': random.choice(demographics),
                'total_members': random.randint(1000, 100000),
                'total_favorites': random.randint(100, 10000),
                'official_site': fake.url()
            })
    
    return data

def generate_reviews_data(jumlah_data):
    data = []
    for _ in range(jumlah_data):
        review_id = ''.join(random.choices(string.ascii_uppercase + string.digits, k=7))
        review_category = random.choice(review_categories)
        description = fake.text(max_nb_chars=500)
        date_posted = fake.date_this_year(before_today=True, after_today=False)

        data.append({
            'review_id': review_id,
            'review_category': review_category,
            'description': description,
            'date_posted': date_posted
        })
    return data

def generate_people_data(jumlah_data):
    data = []
    for _ in range(jumlah_data):
        name = random.choice(people)
        birthday = fake.date_of_birth(minimum_age=18, maximum_age=80)
        website = fake.url()
        biography = fake.text(max_nb_chars=500) if random.random() < 0.8 else None  # 80% chance of having a biography
        member_favorites = random.randint(100, 10000)
        nationality = random.choices([x[0] for x in nationalities], [x[1] for x in nationalities])[0]
        data.append({
            'name': name,
            'birthday': birthday,
            'website': website,
            'biography': biography,
            'member_favorites': member_favorites,
            'nationality': nationality
        })
    return data

def generate_companies_data(jumlah_licensor, jumlah_producer, jumlah_studio):
    data = []
    
    # Acak urutan perusahaan
    random.shuffle(anime_companies)

    # Licensor (20 data pertama)
    licensor_companies = [
        {
            'company_name': anime_companies[i],
            'company_type': 'licensors',
            'date_established': fake.date_between(start_date='-50y', end_date='today'),
            'member_favorites': random.randint(100, 3000) if random.random() < 0.8 else None
        } for i in range(jumlah_licensor)
    ]

    # Producer (20 data selanjutnya)
    producer_companies = [
        {
            'company_name': anime_companies[i+jumlah_licensor],
            'company_type': 'producers',
            'date_established': fake.date_between(start_date='-50y', end_date='today'),
            'member_favorites': random.randint(100, 3000) if random.random() < 0.8 else None
        } for i in range(jumlah_producer)
    ]

    # Studio (20 data terakhir)
    studio_companies = [
        {
            'company_name': anime_companies[i+jumlah_licensor+jumlah_producer],
            'company_type': 'studios',
            'date_established': fake.date_between(start_date='-50y', end_date='today'),
            'member_favorites': random.randint(100, 3000) if random.random() < 0.8 else None
        } for i in range(jumlah_studio)
    ]

    # Gabungkan semua data
    data.extend(licensor_companies)
    data.extend(producer_companies)
    data.extend(studio_companies)

    return data
# Buat 150 data dummy pengguna
dummy_users = generate_user_data(150)
dummy_series = generate_series_data(158)
dummy_reviews = generate_reviews_data(150)
dummy_people = generate_people_data(200)
dummy_companies = generate_companies_data(20, 20, 20)
# Konversi ke DataFrame
users_df = pd.DataFrame(dummy_users)
series_df = pd.DataFrame(dummy_series)
reviews_df = pd.DataFrame(dummy_reviews)
people_df = pd.DataFrame(dummy_people)
companies_df = pd.DataFrame(dummy_companies)

# Simpan ke file CSV
users_df.to_csv('user.csv', index=False)
series_df.to_csv('series.csv', index=False)
reviews_df.to_csv('reviews.csv', index=False)
people_df.to_csv('people.csv', index=False)
companies_df.to_csv('companies.csv', index=False)