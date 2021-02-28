module Warsawlease
  class ProspectiveUser < ApplicationRecord
    establish_connection :warsawlease
    self.table_name = 'prospective_users'
  end
end
