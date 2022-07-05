# frozen_string_literal: true

module Commands
  module Page
    class TransformBody
      include SiteName

      def initialize(attrs)
        @page = attrs[:page]
        @constantized_site_name = attrs[:constantized_site_name]
        @bucket = attrs[:bucket]
      end

      def call
        transform_body
        backup_page
      end

      private

      attr_reader :page, :constantized_site_name, :bucket

      def transform_body
        body = page.body
        new_body = []
        main = []

        body.each_with_index do |e, i|
          if (e.class == Hash && (['tb', 'e', 'toc'].include?(e['t'])))
            new_body[i] = e
          else
            main.push(e)
          end

          # if e.class == Hash && e['t'] == 'yte'
          #   body[i] = {
          #     'yte' => { 's' => e['src'], 'w' => e['width'] }
          #   }
          # end

          # if e.class == Hash && e['i']
          #   body[i] = {
          #     'img' => e['i']
          #   }
          # end

          # if e.class == Hash && e['ul']
          #   body[i] = e['ul']
          # end

          # if e.class == Hash && e['t'] && e['t'].match(/^h(1|2|3|4)$/)
          #   if e['n']
          #     body[i] = {
          #       e['t'] => { c: e['c'], n: e['n'] }
          #     }
          #   else
          #     body[i] = {
          #       e['t'] => e['c']
          #     }
          #   end
          # end
        end

        new_body.push('main' => main)
        page.body = new_body

        # byebug

        page.save!
      end

      def backup_page
        ::Commands::S3Object::Upload.new(
          bucket: bucket,
          key: backup_key,
          body: page.to_json
        ).call
      end

      def backup_key
        "pages/#{page.url} (#{page.updated_at})"
      end
    end
  end
end
