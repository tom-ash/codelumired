module Warsawlease
  class Page < ApplicationRecord
    establish_connection :warsawlease
    self.table_name = 'pages'
  end
end
