module Warsawlease
  class Page < ApplicationRecord
    establish_connection :warsawlease
    self.table_name = 'pages'

    belongs_to :user, foreign_key: :author_id
  end
end
