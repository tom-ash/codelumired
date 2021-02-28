module Warsawlease
  class ProspectiveUsersController < Warsawlease::ApplicationController
    include Sites
    include ProspectiveUsersCreate
    include ProspectiveUsersCiphers
    include UsersCiphers
    include Responses
  end
end
