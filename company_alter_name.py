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

anime_companies_kr = [
    "토에이 애니메이션", "스튜디오 지브리", "선라이즈", "본즈", "매드하우스", "교토 애니메이션", "유포터블", "맵파",
    "트리거", "클로버웍스", "A-1 픽처스", "P.A. 웍스", "샤프트", "J.C. 스태프", "프로덕션 I.G",
    "레르케", "실버 링크", "스튜디오 피에로", "브레인즈 베이스", "화이트 폭스", "애니플렉스", "가도카와",
    "반다이 비주얼", "킹 레코드", "포니 캐년", "NBC유니버설 엔터테인먼트 재팬", "에이벡스 픽처스", "소니 뮤직",
    "도호 애니메이션", "쇼치쿠", "슈에이샤", "코단샤", "미디어 팩토리", "굿스마일 컴퍼니", "부시로드",
    "스퀘어 에닉스", "요미우리 텔레캐스팅", "TV 도쿄", "nhk", "넷플릭스", "크런치롤", "퍼니메이션",
    "센타이 필름웍스", "디스코텍 미디어", "비즈 미디어", "애니메 리미티드", "매드맨 엔터테인먼트", "애니메이고",
    "라이트 스터프", "GKids", "망가 엔터테인먼트", "포키즈 엔터테인먼트", "미디어 블래스터스", "ADV 필름스",
    "노조미 엔터테인먼트", "NIS 아메리카", "아마존 프라임 비디오", "hidive", "vrv", "훌루", "디즈니+"]




def generate_company_alter_names(df):
    # Pastikan panjang list cukup
    df_length = len(df)
    
    # Siapkan daftar judul alternatif yang cukup panjang
    jp_subset = (anime_companies_jp * ((df_length // len(anime_companies_jp)) + 1))[:df_length]
    kr_subset = (anime_companies_kr * ((df_length // len(anime_companies_kr)) + 1))[:df_length]
    
    
    # Buat list untuk menyimpan data alternate names
    alternate_names_list = []
    
    # Loop melalui DataFrame asli
    for idx, row in df.iterrows():
        original_title = row['company_name']
        
        # Tambahkan judul Jepang sebagai alternate name
        alternate_names_list.append({
            'company_name': original_title,
            'alternate_name': jp_subset[idx]
        })
        
        # Tambahkan judul Korea sebagai alternate name
        alternate_names_list.append({
            'company_name': original_title,
            'alternate_name': kr_subset[idx]
        })
    
    # Buat DataFrame dari list alternate names
    company_alter_names_df = pd.DataFrame(alternate_names_list)
    
    return company_alter_names_df

# Generate relasi
company_alter_names_relations = generate_company_alter_names(companies_df)

# Simpan ke CSV
company_alter_names_relations.to_csv('company_alter_names.csv', index=False)
