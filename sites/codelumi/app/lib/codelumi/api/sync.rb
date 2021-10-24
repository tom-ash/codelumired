# frozen_string_literal: true

module Codelumi
  module Api
    class Sync < ::Api::Sync
      helpers do
        def track_data
          {
            root: {
              en: {
                title: 'Code, Light & People | soundof.IT',
                description: 'Resources on coding in JavaScript, Ruby, Python, SQL and other.',
                keywords: 'code, coding, programming, dev, it, javascript, ruby, python, sql, docker'
              }
            }
          }
        end
      end

      before do
        # TODO
      end
    end
  end
end
