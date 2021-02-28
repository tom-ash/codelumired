module Codelumi
  class Page < ApplicationRecord
    establish_connection :codelumi
    self.table_name = 'pages'
  end
end
