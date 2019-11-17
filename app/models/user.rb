class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :encrypted_access_token, presence: true, uniqueness: true
  has_many :announcements, dependent: :destroy
  before_update :log_changes
end
