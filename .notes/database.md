# PROSPECTIVE USERS
rails generate model ProspectiveUser \
encrypted_token:string:index \
verification:jsonb \
verification_code_iv:string \
user:jsonb

# USERS
rails generate model User \
status:integer:index \
encrypted_token:string:index \
token_date:date \
verification:jsonb \
verification_code_iv:string \
points:integer \
email:string:index \
hashed_password:string \
password_salt:string \
consents:jsonb \
phone:jsonb \
business_name:string \
showcase:jsonb \
legal_name:string \
tax_number:string \
address:text \
change_log:jsonb

# DELETED USERS
rails generate model DeletedUser \
original_user:jsonb

# ANNOUNCEMENTS
rails generate model Announcement \
user:references \
status:integer:index \
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
change_log:jsonb

# DELETED ANNOUNCEMENTS
rails generate model DeletedAnnouncement \
original_announcement:jsonb
