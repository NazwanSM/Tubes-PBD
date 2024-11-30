import pandas as pd
import random
from faker import Faker

# Inisialisasi Faker
fake = Faker('id_ID')

# Pastikan Main Characters tepat 75
Main_Characters = ["Naruto Uzumaki", "Monkey D. Luffy", "Ichigo Kurosaki", "Eren Yeager", "Edward Elric",
    "Light Yagami", "Tanjiro Kamado", "Izuku Midoriya", "Yuji Itadori", "Gon Freecss",
    "Shoyo Hinata", "Gintoki Sakata", "Rintarou Okabe", "Subaru Natsuki", "Kirito",
    "Shirou Emiya", "Kaneki Ken", "Spike Spiegel", "Shinji Ikari", "Shigeo Kageyama",
    "Jotaro Kujo", "Thorfinn Karlsefni", "Rudeus Greyrat", "Loid Forger",
    "Denji", "Tohru Honda", "Kyouko Hori", "Koyomi Araragi", "Guts",
    "Ainz Ooal Gown", "Kazuma Satou", "Violet Evergarden", "Emma", "Soma Yukihira",
    "Yato", "Yuri Katsuki", "Nagisa Shiota", "Mikado Ryuugamine", "Aladdin",
    "Raku Ichijou", "Shinichi Izumii", "Seishuu Handa", "Hachiman Hikigaya", "Tomoya Aki",
    "Atsushi Nakajima", "Tetsuya Kuroko", "Sakamichi Onoda", "Haruka Nanase", "Lelouch Lamperouge",
    "Natsu Dragneel", "Asta", "Senku Ishigami", "Taki Tachibana", "Shouko Nishimiya",
    "Shinya Kogami", "Satoru Fujinuma", "Riko", "Nao Tomori","Tomoya Okazaki", "Yui Hirasawa",
    "Konata Izumi", "Yuuko Aioi", "Meiko Honma", "Kousei Arima", "U-1146",
    "Goblin Slayer", "Naofumi Iwatani", "Rimuru Tempest", "Hiro", "Ciel Phantomhive",
    "Rin Okumura", "Karen Kohiruimaki", "Sora", "Yumeko Jabami", "Kusuo Saiki",
    "Hina", "Saichi Sugimoto", "Hyakkimaru", "Joe", "Carole Stanley",
    "Ash Lynx", "Akira Fudo", "Red Blood Cell AE3803", "Twenty-Fifth Bam", "Jin Mori",
    "Cadis Etrama Di Raizel", "Makoto Edamura", "Kaiman", "Legoshi", "Midori Asakusa",
    "Hanako-kun", "Kakushi Gotou", "Arte", "Shuuichi Kagaya", "Kaname Sudou",
    "Somali", "Kotoko Iwanaga", "Kaguya Shinomiya", "Fuutarou Uesugi", "Natsuo Fujii",
    "Kazuya Kinoshita", "Hana Uzaki", "Hajime Nagumo", "Kazuya Souma",
    "Rudeus Greyratt", "Combat Agent Six", "Catarina Claes", "Anos Voldigoad", "Seiya Ryuuguuin",
    "Myne", "Haruhiro", "Bell Cranel", "Bell Cranell", "Shiroe",
    "Hibiki Sakura", "Iori Kitahara", "Shouko Komi", "Wakana Gojo", "Hayase Nagatoro",
    "Reina Aharen", "Takagi", "Sakuta Azusagawa", "Ryu Yamada", "Keima Katsuragi",
    "Kodaka Hasegawa", "Keita Amano", "Kiyotaka Ayanokouji", "Haruhi Suzumiya", "Yuta Togashi",
    "Mikoto Misaka", "Shinichi Izumi", "Rock", "Otonashi Yuzuru", "Vash the Stampede",
    "Maka Albarn", "Tatsumi", "Kiritot", "Natsu Dragneell",  "Yatora Yaguchi", # Blue Period
    "Re-l Mayer", # Ergo Proxy
    "Vladilena Milizé", # 86 (Eighty-Six)
    "Chise Hatori", # The Ancient Magus' Bride
    "Swindler (Ichika)", # Akudama Drive
    "Shuichi Nitori", # Horou Musuko
    "Robin Sena", # Witch Hunter Robin
    "Ichise", # Texhnolyze
    "Mugen", # Samurai Champloo
    "Isaac Dian", # Baccano!
    "Akira Takizawa", # Eden of the East
    "Rachel Gardner", # Angels of Death
    "Sakura Minamoto", # Zombie Land Saga
    "Arata Kaizaki", # ReLIFE
    "Tsukasa Mizugaki", # Plastic Memories
    "Tamako Kitashirakawa", # Tamako Market
    "Nagomi Wahira", # Akiba Maid War
    "Kenji Koiso", # Summer Wars
    "Ruka Azumi", # Children of the Sea
    "Ren (Kyūta)", # The Boy and the Beast
    ]

# Pastikan Side Characters tepat 75
Side_Characters = ["Sasuke Uchiha", "Roronoa Zoro", "Rukia Kuchiki", "Mikasa Ackerman", "Alphonse Elric",
    "L", "Nezuko Kamado", "Katsuki Bakugo", "Megumi Fushiguro", "Killua Zoldyck",
    "Tobio Kageyama", "Kagura", "Kurisu Makise", "Emilia", "Asuna Yuuki",
    "Rin Tohsaka", "Touka Kirishima", "Faye Valentine", "Asuka Langley", "Reigen Arataka",
    "Dio Brando", "Askeladd", "Sylphiette", "Yor Forger",
    "Power", "Kyo Sohma", "Ishikawa Toru", "Hitagi Senjougahara", "Casca",
    "Albedo", "Aqua", "Gilbert Bougainvillea", "Ray", "Megumi Tadokoro",
    "Hiyori Iki", "Victor Nikiforov", "Karma Akabane", "Celty Sturluson", "Alibaba Saluja",
    "Chitoge Kirisaki", "Migi", "Naru Kotoishi", "Yuigahama Yui", "Eriri Spencer Sawamura",
    "Dazai Osamu", "Kagami Taiga", "Shunsuke Imaizumi", "Makoto Tachibana", "Suzaku Kururugi",
    "Lucy Heartfilia", "Yuno", "Chrome", "Mitsuha Miyamizu", "Naoka Ueno",
    "Akane Tsunemori", "Airi Katagiri", "Reg","Yuu Otosaka", "Nagisa Furukawa", "Mio Akiyama",
    "Kagami Hiiragi", "Nano Shinonome", "Tetsudo Hisakawa", "Tsubaki Sawabe", "Macrophage",
    "High Elf Archer", "Raphtalia", "Benimaru", "Zero Two", "Sebastian Michaelis",
    "Yukio Okumura", "Fukaziroh", "Shiro", "Mary Saotome", "Aren Kuboyasu",
    "Anzu", "Asirpa", "Tahomaru", "Sachio", "Tuesday Simmons",
    "Eiji Okumura", "Ryo Asuka", "White Blood Cell U-4989", "Rachel", "Han Daewi",
    "Frankenstein", "Abby Jones", "Nikaido", "Haru", "Tsubame Mizusaki",
    "Yashiro Nene", "Hime Gotou", "Veronica", "Claire Aoki", "Shuka Karino",
    "Golem", "Kurou Sakuragawa", "Miyuki Shirogane", "Ichika Nakano", "Rui Tachibana",
    "Ruka Sarashina", "Ami Asai", "Shizuku Yaegashi", "Liscia Elfrieden",
    "Eris Boreas Greyrat", "Alice Kisaragi", "Maria Campbell", "Sasha Necron", "Ristarte",
    "Frieda", "Manato", "Hestia", "Liliruca Arde", "Akatsuki",
    "Akemi Soryuin", "Kohei Imamura", "Najimi Osana", "Marin Kitagawa", "Gamo-chan",
    "Tobaru", "Nishikata", "Kaede Azusagawa", "Miyabi Itou", "Elsie",
    "Yozora Mikazuki", "Aguri", "Suzune Horikita", "Koizumi Itsuki", "Rikka Takanashi",
    "Kuroko Shirai", "Kana Kimishima", "Revy", "Kanade Tachibana", "Meryl Stryfe",
    "Soul Evans", "Esdeath", "Eugeo", "Gray Fullbuster", "Ryuji Ayukawa", # Blue Period
    "Vincent Law", # Ergo Proxy
    "Shinei Nouzen (Undertaker)", # 86 (Eighty-Six)
    "Elias Ainsworth", # The Ancient Magus' Bride
    "Courier", # Akudama Drive
    "Yoshino Takatsuki", # Horou Musuko
    "Amon", # Witch Hunter Robin
    "Ran", # Texhnolyze
    "Jin", # Samurai Champloo
    "Miria Harvent", # Baccano!
    "Saki Morimi", # Eden of the East
    "Zack", # Angels of Death
    "Tae Yamada", # Zombie Land Saga
    "Chizuru Hishiro", # ReLIFE
    "Isla", # Plastic Memories
    "Kanna Makino", # Tamako Market
    "Ranko Mannen", # Akiba Maid War
    "Natsuki Shinohara", # Summer Wars
    "Umi", # Children of the Sea
    "Kumatetsu", # The Boy and the Beast
    ]

def generate_character_descriptions(characters):
    character_data = []
    
    # Daftar template deskripsi yang lebih variatif
    description_templates = [
        "Karakter yang memiliki kekuatan unik dan kepribadian yang kompleks.",
        "Tokoh dengan perjalanan heroik yang menginspirasi dan mengharukan.",
        "Sosok dengan motivasi kuat dan tekad yang tak tergoyahkan.",
        "Karakter dengan latar belakang misterius dan penuh tantangan.",
        "Pahlawan sejati yang selalu berjuang melawan segala rintangan.",
        "Tokoh dengan kekuatan spiritual dan emosional yang luar biasa.",
        "Sosok yang mampu mengubah takdir melalui kekuatan dan keberanian.",
        "Karakter dengan kisah hidup yang penuh drama dan pengorbanan.",
        "Pejuang sejati yang selalu membela kebenaran dan keadilan.",
        "Tokoh dengan kemampuan luar biasa yang mengagumkan.",
        "Sosok yang mampu menginspirasi dan menggerakkan orang lain.",
        "Karakter dengan pertumbuhan dan perkembangan yang mengesankan.",
        "Pahlawan yang selalu berjuang melawan ketidakadilan.",
        "Tokoh dengan kekuatan tersembunyi yang menakjubkan.",
        "Sosok yang mampu mengubah dunia dengan tekadnya."
    ]
    
    for character in characters:
        # Pilih deskripsi secara acak
        description = random.choice(description_templates)
        
        # Generate jumlah favorit dengan distribusi yang masuk akal
        member_favorites = random.choices(
            [
                random.randint(10, 100),    # Karakter minor
                random.randint(100, 500),   # Karakter menengah
                random.randint(500, 2000),  # Karakter populer
                random.randint(2000, 30000) # Karakter sangat populer
            ],
            weights=[0.3, 0.3, 0.2, 0.2]
        )[0]
        
        character_data.append({
            'name': character,
            'description': description,
            'member_favorites': member_favorites
        })
    
    return pd.DataFrame(character_data)

# Generate data karakter
character_df = pd.concat([
    generate_character_descriptions(Main_Characters),
    generate_character_descriptions(Side_Characters)
], ignore_index=True)

# Simpan ke CSV dengan memperhatikan format
character_df.to_csv('character.csv', index=False)