class ProspectiveUsersController < ApplicationController
  include ProspectiveUsersCreate
  include ProspectiveUsersCiphers
  include UsersCiphers
  include Responses
  include Mailers
end