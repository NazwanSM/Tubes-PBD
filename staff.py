import pandas as pd
from faker import Faker
import random

# Inisialisasi Faker
fake = Faker()

# Baca data people
people_df = pd.read_csv('people.csv')

# Daftar roles yang mungkin
possible_roles = [
    'Producer', 
    'Chief Producer', 
    'Original Creator'
]

# Fungsi untuk generate data staff
def generate_staff_data(people_df, num_entries=90):
    staff_data = []
    
    # Pilih secara acak 75 orang dari people
    selected_people = people_df.sample(n=min(num_entries, len(people_df)))
    
    for _, person in selected_people.iterrows():
        # Tentukan jumlah roles untuk setiap orang (1-2)
        num_roles = random.randint(1, 2)
        
        # Pilih roles secara acak
        person_roles = random.sample(possible_roles, num_roles)
        
        for role in person_roles:
            staff_data.append({
                'name': person['name'],
                'roles': role
            })
    
    return pd.DataFrame(staff_data)

# Generate data staff
staff_df = generate_staff_data(people_df)

# Simpan ke CSV
staff_df.to_csv('staff.csv', index=False)