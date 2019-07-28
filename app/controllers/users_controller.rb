require 'twilio-ruby'

class UsersController < ApplicationController
  include UsersGeneral
  include UsersCreate
  include UsersShow
  include UsersEdit
  include UsersDestroy
  include UsersCiphers
  include ProspectiveUsersCiphers
  include Mailers
  include Responses
  include Messages

  def initialize
    @response = {}
  end
end 