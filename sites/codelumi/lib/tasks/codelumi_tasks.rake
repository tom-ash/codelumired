# frozen_string_literal: true

namespace :codelumi do
  desc 'Warsawlease Grape Routes'
  task routes: :environment do
    ::Codelumi::Api::Base.routes.each do |api|
      method = api.request_method.ljust(10)
      path = api.path
      puts "#{method} #{path}"
    end
  end
end
