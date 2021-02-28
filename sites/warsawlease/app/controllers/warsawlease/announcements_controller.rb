module Warsawlease
  class AnnouncementsController < Warsawlease::ApplicationController
    include Sites
    include AnnouncementsAttributes
    include AnnouncementsCreate
    include AnnouncementsIndex
    include AnnouncementsShow
    include AnnouncementsUpdate
    include AnnouncementsDestroy
    include AnnouncementsShared
    include Responses
    include UsersAuthorize
    include UsersVerify
    include UsersCiphers
  end
end
