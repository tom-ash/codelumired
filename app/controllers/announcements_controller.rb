class AnnouncementsController < ApplicationController
  include AnnouncementsCreate
  include AnnouncementsIndex
  include AnnouncementsShow
  include AnnouncementsUpdate
  include AnnouncementsDestroy
  include Responses
  include UsersEdit
  include UsersCiphers
end