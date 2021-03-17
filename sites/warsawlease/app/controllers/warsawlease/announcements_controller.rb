module Warsawlease
  class AnnouncementsController < Warsawlease::ApplicationController
    include Sites
    include AnnouncementsAttributes
    include AnnouncementsIndex
    include AnnouncementsShow
    include AnnouncementsUpdate
    include AnnouncementsDestroy
    include Responses
  end
end
