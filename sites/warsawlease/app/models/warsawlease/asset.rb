module Warsawlease
  class Asset < ApplicationRecord
    establish_connection :warsawlease
    self.table_name = 'assets'
  end
end
