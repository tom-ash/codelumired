# frozen_string_literal: true

namespace :soundof_it do
  desc 'MapawynajmuPl Grape Routes'
  task routes: :environment do
    ::SoundofIt::Api::Base.routes.each do |api|
      method = api.request_method.ljust(10)
      path = api.path
      puts "#{method} #{path}"
    end
  end
end
