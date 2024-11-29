import pandas as pd
import random
from faker import Faker

# Membaca file CSV companies
companies_df = pd.read_csv('companies.csv')

# Daftar nama alternatif dalam bahasa Jepang
anime_companies_jp = [
    "東映アニメーション", "スタジオジブリ", "サンライズ", "ボンズ", "マッドハウス",
    "京都アニメーション", "ユーフォーテーブル", "マッパ", "トリガー", "クローバーワークス",
    "エー・ワン・ピクチャーズ", "ピーエーワークス", "シャフト", "ジェーシースタッフ", 
    "プロダクション・アイジー", "ラルケ", "シルバーリンク", "スタジオぴえろ", 
    "ブレインズ・ベース", "ホワイトフォックス", "アニプレックス", "角川書店", 
    "バンダイビジュアル", "キングレコード", "ポニーキャニオン", 
    "NBCユニバーサル・エンターテイメント・ジャパン", "エイベックス・ピクチャーズ", 
    "ソニー・ミュージック", "東宝アニメーション", "松竹", "集英社", "講談社", 
    "メディアファクトリー", "グッドスマイルカンパニー", "ブシロード", 
    "スクウェア・エニックス", "読売テレビ", "テレビ東京", "NHK", "ネットフリックス", 
    "クランチロール", "ファニメーション", "センタイフィルムワークス", 
    "ディスコテック・メディア", "ビズメディア", "アニメリミテッド", 
    "マッドマン・エンターテインメント", "アニメイゴ", "ライトスタッフ", "ジーキッズ", 
    "マンガエンターテインメント", "フォーキッズ・エンターテインメント", 
    "メディアブラスターズ", "ADVフィルムズ", "ノゾミエンターテインメント", 
    "NISアメリカ", "アマゾンプライムビデオ", "ハイダイブ", "VRV", "フールー", "ディズニープラス"
]

def generate_company_alter_names():
    # Inisialisasi list untuk menyimpan relasi
    company_alter_names_relations = []
    
    # Set untuk melacak nama yang sudah digunakan
    used_alternate_names = set()
    
    # Iterasi setiap perusahaan unik dari companies.csv
    for company_name in companies_df['company_name'].unique():
        # Cari nama alternatif yang belum digunakan
        available_alternate_names = [
            jp_name for jp_name in anime_companies_jp 
            if jp_name not in used_alternate_names
        ]
        
        # Jika tidak ada nama alternatif tersedia, lewati
        if not available_alternate_names:
            break
        
        # Pilih nama alternatif secara acak
        alternate_name = random.choice(available_alternate_names)
        
        # Tambahkan ke daftar relasi
        company_alter_names_relations.append({
            'company_name': company_name,
            'alternate_name': alternate_name
        })
        
        # Tandai nama alternatif sebagai sudah digunakan
        used_alternate_names.add(alternate_name)
    
    # Konversi ke DataFrame
    company_alter_names_df = pd.DataFrame(company_alter_names_relations)
    
    return company_alter_names_df

# Generate relasi
company_alter_names_relations = generate_company_alter_names()

# Simpan ke CSV
company_alter_names_relations.to_csv('company_alter_names.csv', index=False)
