class AnnouncementsController < ApplicationController
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
