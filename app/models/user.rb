class User < ApplicationRecord
  validates :encrypted_email, uniqueness: true
  validates :encrypted_token, presence: true, uniqueness: true
  has_many :announcements
  before_update :log_changes
end
