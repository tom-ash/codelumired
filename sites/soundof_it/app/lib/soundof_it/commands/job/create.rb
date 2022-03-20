# frozen_string_literal: true

module SoundofIt
  module Commands
    module Job
      class Create
        def initialize(user_id:, attrs:)
          @user_id = user_id
          @attrs = attrs
        end

        def call
          byebug
          'TEST TEST TEST'
        end

        private

        attr_reader :user_id, :attrs
      end
    end
  end
end
