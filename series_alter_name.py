import pandas as pd
import random

# Daftar judul dalam bahasa Jepang
titles_jp = [
    "ナルト", "ワンピース", "ブリーチ", "進撃の巨人", "鋼の錬金術師", 
    "デスノート", "鬼滅の刃", "僕のヒーローアカデミア", "呪術廻戦", 
    "ハンター×ハンター", "ハイキュー!!", "銀魂", "シュタインズ・ゲート", 
    "Re:ゼロから始める異世界生活", "ソードアート・オンライン", 
    "フェイト/ステイナイト", "東京喰種", "カウボーイビバップ", 
    "新世紀エヴァンゲリオン", "モブサイコ100", "ジョジョの奇妙な冒険", 
    "ヴィンランド・サガ", "無職転生", "スパイファミリー", "チェンソーマン", 
    "フルーツバスケット", "ホリミヤ", "物語シリーズ", "ベルセルク", 
    "オーバーロード", "この素晴らしい世界に祝福を！", 
    "ヴァイオレット・エヴァーガーデン", "約束のネバーランド", 
    "食戟のソーマ", "ノラガミ", "ユーリ!!! on ICE", "暗殺教室", 
    "デュラララ!!", "マギ", "ニセコイ", "寄生獣", "ばらかもん", 
    "やはり俺の青春ラブコメはまちがっている。", "冴えない彼女の育てかた", 
    "文豪ストレイドッグス", "黒子のバスケ", "弱虫ペダル", "Free!", 
    "コードギアス", "フェアリーテイル", "ブラッククローバー", 
    "ドクターストーン", "君の名は。", "聲の形", "サイコパス", 
    "僕だけがいない街", "メイドインアビス", "シャーロット", "クラナド", 
    "けいおん!", "らき☆すた", "日常", 
    "あの日見た花の名前を僕達はまだ知らない。", "四月は君の嘘", 
    "はたらく細胞", "ゴブリンスレイヤー", "盾の勇者の成り上がり", 
    "転生したらスライムだった件", "ダーリン・イン・ザ・フランキス", 
    "食戟のソーマ", "黒執事", "青の祓魔師", "ノーゲーム・ノーライフ", 
    "賭ケグルイ", "斉木楠雄のΨ難", "ヒナまつり", "ゴールデンカムイ", 
    "どろろ", "メガロボクス", "キャロル&チューズデイ", "バナナフィッシュ", 
    "デビルマン・クライベイビー", "ハナクソ神様", "かくしごと", "アルテ", 
    "グレイプニル", "ダーウィンズゲーム", "ソマリと森の神様", "虚構推理", 
    "かぐや様は告らせたい", "五等分の花嫁", "彼女、お借りします", 
    "宇崎ちゃんは遊びたい!", "ありふれた職業で世界最強", 
    "現実主義勇者の王国再建記", "無職転生", "戦闘員、派遣します！", 
    "乙女ゲームの破滅フラグしかない悪役令嬢に転生してしまった…", 
    "慎重勇者", "本好きの下剋上", "灰と幻想のグリムガル", 
    "ダンジョンに出会いを求めるのは間違っているだろうか", "ログ・ホライズン", 
    "ダンベル何キロ持てる?", "ぐらんぶる", "ごちうさ", 
    "古見さんは、コミュ症です", "その着せ替え人形は恋をする", 
    "イジらないで、長瀞さん", "阿波連さんははかれない", 
    "からかい上手の高木さん", 
    "青春ブタ野郎はバニーガール先輩の夢を見ない", 
    "山田くんと7人の魔女", "神のみぞ知るセカイ", "僕は友達が少ない", 
    "ゲーマーズ！", "ようこそ実力至上主義の教室へ", "涼宮ハルヒの憂鬱", 
    "中二病でも恋がしたい！", "とある科学の超電磁砲", 
    "寄生獣 セイの格率", "ブラック・ラグーン", "エンジェルビーツ！", 
    "トライガン", "ソウルイーター", "アカメが斬る！", 
    "ソードアート・オンライン アリシゼーション", 
    "フェアリーテイル ファイナルシリーズ", "ブルーピリオド", 
    "エルゴプラクシー", "86－エイティシックス－", "魔法使いの嫁", 
    "アクダマドライブ", "放浪息子", "ウィッチハンターロビン", 
    "テクノライズ", "サムライチャンプルー", "バッカーノ！", 
    "東のエデン", "殺戮の天使", "ゾンビランドサガ", "リライフ", 
    "プラスティック・メモリーズ", "たまこまーけっと", "アキバ冥途戦争", 
    "サマーウォーズ", "海獣の子供", "バケモノの子"
]


# Daftar judul dalam bahasa Korea
titles_kr =  ["나루토", "원피스", "블리치", "진격의 거인", "강철의 연금술사", "데스 노트", "귀멸의 칼날",
    "나의 히어로 아카데미아", "주술회전", "헌터 x 헌터", "하이큐!!", "긴타마", "슈타인즈 게이트", "Re:제로부터 시작하는 이세계 생활",
    "소드 아트 온라인", "페이트/스테이 나이트", "도쿄 구울", "카우보이 비밥", "신세기 에반게리온", "모브사이코 100",
    "죠죠의 기묘한 모험", "귀멸의 칼날", "빈란드 사가", "무직전생", "스파이 x 패밀리", "체인소 맨",
    "프루츠 바스켓", "호리미야", "모노가타리 시리즈", "베르세르크", "오버로드",
    "이 멋진 세계에 축복을!", "바이올렛 에버가든", "약속의 네버랜드", "식극의 소마", "노라가미",
    "유리!!! 온 아이스", "암살교실", "듀라라라!!", "마기", "니세코이",
    "기생수", "바라카몬", "역시 내 청춘 러브코메디는 잘못됐다", "시원찮은 그녀를 위한 육성방법", "문호 스트레이 독스",
    "쿠로코의 농구", "약속의 페달", "프리!", "코드 기어스", "페어리 테일",
    "블랙 클로버", "닥터 스톤", "암살교실", "너의 이름은", "목소리의 형태",
    "사이코패스", "이세계에서 살아남기", "메이드 인 어비스", "샬롯", "클라나드",
    "케이온!", "럭키 스타", "니치조", "아노하나", "4월은 너의 거짓말",
    "일하는 세포", "고블린 슬레이어", "방패 용사 성공담", "전생했더니 슬라임이었던 건에 대하여", "달링 인 더 프랑키스",
    "푸드 워즈", "흑집사", "푸른 엑소시스트", "소드 아트 온라인 얼터너티브: 건 게일 온라인", "노 게임 노 라이프",
    "카케구루이", "사이키 쿠스오의 재난", "히나마츠리", "황금 카무이", "도로로",
    "메가로복스", "캐롤 & 튜스데이", "바나나 피쉬", "데빌맨 크라이베이비", "일하는 세포: 코드 블랙",
    "신의 탑", "갓 오브 하이스쿨", "노블레스", "위대한 사기꾼", "도로헤도로",
    "비스타스", "영상연구부를 손대지 마!", "화장실에 사는 하나코군", "카쿠시고토", "아르테",
    "글레이프니르", "다윈즈 게임", "소말리와 숲의 신령", "호사모: 불가능한 수사", "카구야 님은 고백받고 싶어",
    "5등분의 신부", "도메스틱 여친", "여친, 빌리겠습니다", "우자키 양은 놀고 싶어!", "아리후레타",
    "현실주의 용사의 왕국 재건기", "무직전생", "전투원 파견합니다!", "악역 영애지만 주인공입니다", "마왕 학원의 부적합자",
    "신중용사", "책벌레의 하극상", "그림갈", "던전에서 만남을 추구하면 안 되는 걸까?", "로그 호라이즌",
    "방패 용사 성공담", "덤벨 몇 킬로까지 들 수 있어?", "그랑블루", "5등분의 신부", "코미 양은 커뮤증입니다",
    "비스크돌", "나가토로", "아하렌 양은 알 수 없다", "장난을 잘 치는 타카기 양", "바니걸 선배의 꿈을 꾸지 않는다",
    "야마다 군과 7인의 마녀", "신만이 아는 세계", "내 이웃 히키코모리", "게이머즈!", "교실의 엘리트들",
    "스즈미야 하루히의 우울", "중2병이라도 사랑이 하고 싶어!", "어떤 과학의 초전자포", "기생수", "블랙 라군",
    "엔젤 비츠!", "트라이건", "소울 이터", "아카메가 벤다!", "소드 아트 온라인: 얼리시제이션",
    "페어리 테일: 파이널 시리즈", "블루 피리어드", "에르고 프록시", "86 (에이티식스)", "마법사의 신부",
    "아쿠다마 드라이브", "호로우 무스코", "위치 헌터 로빈", "텍스놀라이즈", "사무라이 참프루",
    "박카노!", "동쪽의 에덴", "살인의 천사", "좀비랜드 사가", "ReLIFE",
    "플라스틱 메모리즈", "타마코 마켓", "아키바 메이드 전쟁", "서머 워즈", "바다의 아이들", "괴물의 아이"]

def generate_series_alter_names(df):
    # Pastikan panjang list cukup
    df_length = len(df)
    
    # Siapkan daftar judul alternatif yang cukup panjang
    jp_subset = (titles_jp * ((df_length // len(titles_jp)) + 1))[:df_length]
    kr_subset = (titles_kr * ((df_length // len(titles_kr)) + 1))[:df_length]
    
    
    # Buat list untuk menyimpan data alternate names
    alternate_names_list = []
    
    # Loop melalui DataFrame asli
    for idx, row in df.iterrows():
        original_title = row['main_title']
        
        # Tambahkan judul Jepang sebagai alternate name
        alternate_names_list.append({
            'main_title': original_title,
            'alternative_title': jp_subset[idx]
        })
        
        # Tambahkan judul Korea sebagai alternate name
        alternate_names_list.append({
            'main_title': original_title,
            'alternative_title': kr_subset[idx]
        })
    
    # Buat DataFrame dari list alternate names
    series_alter_names_df = pd.DataFrame(alternate_names_list)
    
    return series_alter_names_df

# Baca file CSV original series
df = pd.read_csv('series.csv')

# Generate relasi
series_alter_names_relations = generate_series_alter_names(df)

# Simpan ke CSV
series_alter_names_relations.to_csv('series_alter_names.csv', index=False)
