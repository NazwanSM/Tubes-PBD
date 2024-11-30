from faker import Faker
import pandas as pd
import random
import string

# Inisialisasi Faker dengan locale Indonesia
fake = Faker()

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

nationalities = [('American',0.2), ('Japanese',0.5), ('Korean',0.1), ('British',0.1), ('French',0.05), ('German',0.05)]

def generate_people_data(jumlah_data):
    data = []
    existing_names = set()

    for _ in range(jumlah_data):
        name = random.choice(people)
        while name in existing_names:
            name = random.choice(people)
        existing_names.add(name)

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


dummy_people = generate_people_data(200)
people_df = pd.DataFrame(dummy_people)
people_df.to_csv('people.csv', index=False)