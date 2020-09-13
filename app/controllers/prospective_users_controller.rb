class ProspectiveUsersController < ApplicationController
  include ProspectiveUsersCreate
  include ProspectiveUsersCiphers
  include UsersCiphers
  include Responses
end