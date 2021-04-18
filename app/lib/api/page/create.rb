# frozen_string_literal: true

module Api
  module Page
    class Create < Grape::API
      before { authorize_for_page! }

      params { requires :name, type: String }
      post do
        ::Commands::Page::Create.new(name: params[:name], user_id: current_user.id, page_langs: page_langs, site_name: site_name).call
        camelize(site::Page.where(name: params[:name]).pluck(:lang, :url).to_h)
      end
    end
  end
end
