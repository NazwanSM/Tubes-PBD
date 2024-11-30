from faker import Faker
import pandas as pd
import random
import string

# Inisialisasi Faker dengan locale Indonesia
fake = Faker()

anime_companies =["Toei Animation", "Studio Ghibli", "Sunrise", "Bones", "Madhouse","Kyoto Animation", "Ufotable", "MAPPA", "Trigger", "CloverWorks","A-1 Pictures", "P.A. Works", "Shaft", "J.C. Staff", "Production I.G","Lerche", "Silver Link", "Studio Pierrot", "Brain's Base", "White Fox","Aniplex", "Kadokawa", "Bandai Visual", "King Records", "Pony Canyon","NBCUniversal Entertainment Japan", "Avex Pictures", "Sony Music","Toho Animation", "Shochiku", "Shueisha", "Kodansha", "Media Factory","Good Smile Company", "Bushiroad", "Square Enix", "Yomiuri Telecasting","TV Tokyo", "NHK", "Netflix", "Crunchyroll", "Funimation", "Sentai Filmworks", "Discotek Media","Viz Media", "Anime Limited", "Madman Entertainment", "AnimEigo", "Right Stuf", "GKIDS", "Manga Entertainment", "4Kids Entertainment", "Media Blasters", "ADV Films", "Nozomi Entertainment", "NIS America", "Amazon Prime Video", "HIDIVE", "VRV", "Hulu", "Disney+"]


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
            'member_favorites': random.randint(100, 3000)
        } for i in range(jumlah_licensor)
    ]

    # Producer (20 data selanjutnya)
    producer_companies = [
        {
            'company_name': anime_companies[i+jumlah_licensor],
            'company_type': 'producers',
            'date_established': fake.date_between(start_date='-50y', end_date='today'),
            'member_favorites': random.randint(100, 3000)
        } for i in range(jumlah_producer)
    ]

    # Studio (20 data terakhir)
    studio_companies = [
        {
            'company_name': anime_companies[i+jumlah_licensor+jumlah_producer],
            'company_type': 'studios',
            'date_established': fake.date_between(start_date='-50y', end_date='today'),
            'member_favorites': random.randint(100, 3000)
        } for i in range(jumlah_studio)
    ]

    # Gabungkan semua data
    data.extend(licensor_companies)
    data.extend(producer_companies)
    data.extend(studio_companies)

    return data

dummy_companies = generate_companies_data(20, 20, 20)
companies_df = pd.DataFrame(dummy_companies)
companies_df.to_csv('companies.csv', index=False)