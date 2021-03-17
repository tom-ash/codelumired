# frozen_string_literal: true

module Parsers
  module User
    class Consents
      def initialize(user:, consents:)
        @user = user
        @consents = consents
      end

      def call
        user.assign_attributes(consents: parsed_consents)
      end

      private

      attr_reader :user, :consents

      def parsed_consents
        consents.map { |consent| consent.merge(expressed_at: expressed_at) }
      end

      def expressed_at
        @expressed_at ||= Time.zone.now
      end
    end
  end
end
