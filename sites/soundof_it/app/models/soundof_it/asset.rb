module SoundofIt
  class Asset < ApplicationRecord
    establish_connection :soundof_it
    self.table_name = 'assets'
  end
end
