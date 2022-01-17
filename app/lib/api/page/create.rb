# frozen_string_literal: true

module Api
  module Page
    class Create < Grape::API
      before { authorize_for_page! }

      params { requires :name, type: String }
      post do
        ::Commands::Page::Create.new(name: params[:name], user_id: current_user.id, langs: langs, constantized_site_name: constantized_site_name).call
        site::Page.find_by(name: params[:name], lang: lang).edit_link
      end
    end
  end
end
