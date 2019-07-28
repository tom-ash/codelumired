# ANNOUNCEMENT
rails generate model Announcement \
user:references \
active:boolean:index \
points:integer:index \
views:integer \
reports:jsonb \
refreshed_at:date:index \
category:integer:index \
district:integer:index \
rent_currency:integer:index \
rent_amount:integer:index \
additional_fees:boolean:index \
area:integer:index \
availability_date:date:index \
rooms:integer:index \
floor:integer:index \
total_floors:integer:index \
pictures:jsonb \
features:jsonb \
furnishings:jsonb \
polish_description:text \
english_description:text \
longitude:integer:index \
latitude:integer:index \
history:jsonb

# DELETED ANNOUNCEMENT
rails generate model DeletedAnnouncement \
original_announcement_object:jsonb

# DERIVED CIPHERS
rails generate model DerivedCipher \
iv:string \
salt:string

# PROSPECTIVE USERS
rails generate model ProspectiveUser \
encrypted_search_token:string \
verification:jsonb \
user:jsonb

# PROSPECTIVE USER CIPHERS
rails generate model ProspectiveUserCipher \
verification_code_iv:string \
user_cipher:jsonb

# USERS
rails generate model User \
status:string \
encrypted_search_token:string:index \
hashed_access_token:string \
verification:jsonb \
encrypted_email:string:index \
hashed_password:string \
consents:jsonb \
points:integer \
phone:jsonb \
encrypted_business_name:string \
encrypted_tax_identification:string \
showcase:jsonb \
encrypted_invoice_data:text \
history:jsonb

# USER CIPHERS
rails generate model UserCipher \
access_token_salt:string \
verification_code_iv:string \
email_derived_cipher_id:integer \
password_salt:string \
phone_body_iv:string \
first_name_iv:string \
last_name_iv:string \
business_name_iv:string \
tax_identification_iv:string \
invoice_data_iv:string

# DELETED USERS
rails generate model DeletedUser \
original_user:jsonb

# DELETED USER CIPHERS
rails generate model DeletedUserCipher \
original_user_cipher:jsonb



