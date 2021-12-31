module MapawynajmuPl
  class DeletedUser < ApplicationRecord
    establish_connection :mapawynajmu_pl
    self.table_name = 'deleted_users'
  end
end