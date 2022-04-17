# frozen_string_literal: true

module Api
  module Page
    class Update < Grape::API
      before { authorize_for_page! }

      params do
        requires :name, type: String
        requires :lang, type: String
        requires :url, type: String
        requires :body, type: Array
        requires :style, type: Array
        requires :meta, type: Hash
        requires :canonical_url, type: String
        requires :title, type: String
        requires :description, type: String
        requires :keywords, type: String
        requires :picture, type: String
        requires :schema_mode, type: String
        requires :auto_schema, type: String
        requires :manual_schema, type: String
        requires :published_on, type: Date
        requires :modified_on, type: Date
      end
      put do
        auto_schema = JSON.parse(params['auto_schema'])
        manual_schema = JSON.parse(params['manual_schema'])

        attrs = params.merge(
          user_id: current_user.id,
          constantized_site_name: constantized_site_name,
          bucket: bucket,
          auto_schema: auto_schema,
          manual_schema: manual_schema
        )
        page = ::Commands::Page::Update.new(attrs).call
        page.url
      end
    end
  end
end
