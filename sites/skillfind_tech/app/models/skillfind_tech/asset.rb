module SkillfindTech
  class Asset < ApplicationRecord
    establish_connection :skillfind_tech
    self.table_name = 'assets'
  end
end
