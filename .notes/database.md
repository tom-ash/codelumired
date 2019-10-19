# DERIVED CIPHERS
rails generate model DerivedCipher \
iv:string \
salt:string

# PROSPECTIVE USERS
rails generate model ProspectiveUser \
encrypted_token:string \
verification:jsonb \
user:jsonb

# PROSPECTIVE USER CIPHERS
rails generate model ProspectiveUserCipher \
verification_code_iv:string \
user_cipher:jsonb

# USERS
rails generate model User \
status:integer:index \
encrypted_token:string:index \
token_date:date \
verification:jsonb \
points:integer \
encrypted_email:string:index \
hashed_password:string \
consents:jsonb \
phone:jsonb \
encrypted_business_name:string \
showcase:jsonb \
encrypted_tax_identification:string \
encrypted_legal_name:string \
encrypted_address:text \
past_log:jsonb

# USER CIPHERS
rails generate model UserCipher \
verification_code_iv:string \
email_derived_cipher_id:integer \
password_salt:string \
phone_body_iv:string \
business_name_iv:string \
tax_identification_iv:string \
legal_name_iv:string \
address_iv:string \
past_log:jsonb

# DELETED USERS
rails generate model DeletedUser \
original_user:jsonb

# DELETED USER CIPHERS
rails generate model DeletedUserCipher \
original_user_cipher:jsonb

# ANNOUNCEMENTS
rails generate model Announcement \
user:references \
status:integer:index \
distinct:integer:index \
points:integer:index \
views:integer \
reports:jsonb \
visible:boolean:index \
active_until:date:index \
category:integer:index \
district:integer:index \
area:integer:index \
rent_currency:integer:index \
net_rent_amount:integer:index \
net_rent_amount_per_sqm:integer:index \
gross_rent_amount:integer:index \
gross_rent_amount_per_sqm:integer:index \
additional_fees:boolean:index \
rooms:integer:index \
floor:integer:index \
total_floors:integer:index \
availability_date:date:index \
pictures:jsonb \
features:jsonb \
furnishings:jsonb \
polish_description:text \
english_description:text \
longitude:integer:index \
latitude:integer:index \
past_log:jsonb

# DELETED ANNOUNCEMENTS
rails generate model DeletedAnnouncement \
original_announcement:jsonb
