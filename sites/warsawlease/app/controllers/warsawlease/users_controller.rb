require 'twilio-ruby'

module Warsawlease
  class UsersController < Warsawlease::ApplicationController
    include Sites
    include Responses
    include Messages
    include ProspectiveUsersCiphers
    include UsersGeneral
    include UsersCiphers
    include UsersCreate
    include UsersShow
    include UsersAuthorize
    include UsersVerify
    include UsersEdit
    include UsersDestroy

    def initialize
      @response = {}
    end
  end
end
