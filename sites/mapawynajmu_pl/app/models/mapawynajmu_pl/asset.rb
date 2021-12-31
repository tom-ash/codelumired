module MapawynajmuPl
  class Asset < ApplicationRecord
    establish_connection :mapawynajmu_pl
    self.table_name = 'assets'
  end
end
