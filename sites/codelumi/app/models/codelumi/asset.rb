module Codelumi
  class Asset < ApplicationRecord
    establish_connection :codelumi
    self.table_name = 'assets'
  end
end
