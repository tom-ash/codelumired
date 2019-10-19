# DERIVED CIPHERS
class CreateDerivedCiphers < ActiveRecord::Migration[6.0]
  def change
    create_table :derived_ciphers do |t|
      t.string :iv, null: false
      t.string :salt, null: false

      t.timestamps
    end
  end
end

# PROSPECTIVE USERS
class CreateProspectiveUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :prospective_users do |t|
      t.string :encrypted_token, null: false
      t.jsonb :verification, null: false
      t.jsonb :user, null: false

      t.timestamps
    end
    add_index :users, :encrypted_token, unique: true
  end
end

# PROSPECTIVE USER CIPHERS
class CreateProspectiveUserCiphers < ActiveRecord::Migration[6.0]
  def change
    create_table :prospective_user_ciphers do |t|
      t.string :verification_code_iv, null: false
      t.jsonb :user_cipher, null: false

      t.timestamps
    end
  end
end

# USERS
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :status, null: false, limit: 2
      t.string :encrypted_token, null: false
      t.date :token_date, null: false
      t.jsonb :verification, null: false
      t.integer :points, null: false
      t.string :encrypted_email, null: false
      t.string :hashed_password, null: false
      t.jsonb :consents, null: false
      t.jsonb :phone, null: false
      t.string :encrypted_business_name, null: false
      t.jsonb :showcase, null: false
      t.string :encrypted_tax_identification, null: false
      t.string :encrypted_legal_name, null: false
      t.text :encrypted_address, null: false
      t.jsonb :past_log, null: false

      t.timestamps
    end
    add_index :users, :status
    add_index :users, :encrypted_token, unique: true
    add_index :users, :encrypted_email, unique: true
  end
end

# USER CIPHERS
class CreateUserCiphers < ActiveRecord::Migration[6.0]
  def change
    create_table :user_ciphers do |t|
      t.string :verification_code_iv, null: false
      t.integer :email_derived_cipher_id, null: false
      t.string :password_salt, null: false
      t.string :phone_body_iv, null: false
      t.string :business_name_iv, null: false
      t.string :tax_identification_iv, null: false
      t.string :legal_name_iv, null: false
      t.string :address_iv, null: false
      t.jsonb :past_log, null: false

      t.timestamps
    end
  end
end

# DELETED USERS
class CreateDeletedUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :deleted_users do |t|
      t.jsonb :original_user, null: false

      t.timestamps
    end
  end
end

# DELETED USER CIPHERS
class CreateDeletedUserCiphers < ActiveRecord::Migration[6.0]
  def change
    create_table :deleted_user_ciphers do |t|
      t.jsonb :original_user_cipher, null: false

      t.timestamps
    end
  end
end

# ANNOUNCEMENTS
class CreateAnnouncements < ActiveRecord::Migration[6.0]
  def change
    create_table :announcements do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :status, null: false, limit: 2
      t.integer :distinct, null: false, limit: 2
      t.integer :points, null: false
      t.integer :views, null: false
      t.jsonb :reports, null: false
      t.boolean :visible, null: false
      t.date :active_until, null: false
      t.integer :category, null: false, limit: 2
      t.integer :district, null: false, limit: 2
      t.integer :area, null: false
      t.integer :rent_currency, null: false, limit: 2
      t.integer :net_rent_amount, null: false
      t.integer :net_rent_amount_per_sqm, null: false
      t.integer :gross_rent_amount, null: false
      t.integer :gross_rent_amount_per_sqm, null: false
      t.boolean :additional_fees, null: false
      t.integer :rooms, null: false, limit: 2
      t.integer :floor, null: false, limit: 2
      t.integer :total_floors, null: false, limit: 2
      t.date :availability_date, null: false
      t.jsonb :pictures, null: false
      t.jsonb :features, null: false
      t.jsonb :furnishings, null: false
      t.text :polish_description, null: false
      t.text :english_description, null: false
      t.integer :longitude, null: false
      t.integer :latitude, null: false
      t.jsonb :past_log, null: false

      t.timestamps
    end
    add_index :announcements, :status
    add_index :announcements, :distinct
    add_index :announcements, :points
    add_index :announcements, :visible
    add_index :announcements, :active_until
    add_index :announcements, :category
    add_index :announcements, :district
    add_index :announcements, :area
    add_index :announcements, :rent_currency
    add_index :announcements, :net_rent_amount
    add_index :announcements, :net_rent_amount_per_sqm
    add_index :announcements, :gross_rent_amount
    add_index :announcements, :gross_rent_amount_per_sqm
    add_index :announcements, :additional_fees
    add_index :announcements, :rooms
    add_index :announcements, :floor
    add_index :announcements, :total_floors
    add_index :announcements, :availability_date
    add_index :announcements, :longitude
    add_index :announcements, :latitude
  end
end

# DELETED ANNOUNCEMENTS
class CreateDeletedAnnouncements < ActiveRecord::Migration[6.0]
  def change
    create_table :deleted_announcements do |t|
      t.jsonb :original_announcement, null: false

      t.timestamps
    end
  end
end
