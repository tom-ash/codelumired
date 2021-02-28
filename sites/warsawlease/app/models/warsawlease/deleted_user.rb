module Warsawlease
  class DeletedUser < ApplicationRecord
    establish_connection :warsawlease
    self.table_name = 'deleted_users'
  end
end