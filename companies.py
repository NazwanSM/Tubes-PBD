from faker import Faker
import pandas as pd
import random
from datetime import datetime, timedelta

# Inisialisasi Faker dengan locale global
fake = Faker()

# Baca data companies dari file CSV
companies_df = pd.read_csv('companies.csv')

# Fungsi untuk membuat data dummy berdasarkan tipe perusahaan
def generate_company_data(companies_df, company_type):
    data = []
    filtered_companies = companies_df[companies_df['company_type'] == company_type].copy()
    
    # Shuffle companies untuk variasi
    filtered_companies = filtered_companies.sample(frac=1).reset_index(drop=True)
    
    for _, row in filtered_companies.iterrows():
        # Gunakan data asli dari perusahaan
        company_name = row['company_name']
        
        # Tentukan tanggal
        date_established = row['date_established'] if pd.notna(row['date_established']) else fake.date_between(start_date='-50y', end_date='today')
        
        # Tentukan member favorites
        member_favorites = row['member_favorites'] if pd.notna(row['member_favorites']) else random.randint(100, 3000)
        
        data.append({
            'company_name': company_name,
            'company_type': company_type,
            'date_established': date_established,
            'member_favorites': member_favorites
        })
    
    return data

# Buat data dummy untuk masing-masing relasi
dummy_producers = generate_company_data(companies_df, 'producers')
dummy_licensors = generate_company_data(companies_df, 'licensors')
dummy_studios = generate_company_data(companies_df, 'studios')

# Simpan ke file CSV
pd.DataFrame(dummy_producers).to_csv('producers.csv', index=False)
pd.DataFrame(dummy_licensors).to_csv('licensors.csv', index=False)
pd.DataFrame(dummy_studios).to_csv('studios.csv', index=False)