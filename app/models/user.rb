class User < ApplicationRecord
  has_many :announcements
  before_update :log_changes
end
