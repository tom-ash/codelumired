class User < ApplicationRecord
  validates :encrypted_access_token, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :hashed_password, presence: true
  validates :password_salt, presence: true
  validates :consents, presence: true
  validates :phone, presence: true
  validates :business_name, presence: true
  validates :showcase, presence: true
  has_many :announcements, dependent: :destroy
  before_update :log_changes
end
