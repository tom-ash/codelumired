# frozen_string_literal: true

module Api
  module Page
    class Create < Grape::API
      before { authorize_for_page! }

      post do
        page = ::Commands::Page::Create.new(
          user_id: current_user.id,
          constantized_site_name: constantized_site_name
        ).call

        page.edit_link
      end
    end
  end
end
