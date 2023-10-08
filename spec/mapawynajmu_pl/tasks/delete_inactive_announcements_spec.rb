# frozen_string_literal: true

require 'mapawynajmu_pl/rails_helper.rb'
require 'rake'

RSpec.describe ::Rake::Task do
  before { Rails.application.load_tasks }

  let(:user) { create(:mapawynajmu_pl_user) }
  let(:definite_listing) { create(:mapawynajmu_pl_listing, user: user, active_until: 3.months.ago) }
  let(:indefinite_listing) { create(:mapawynajmu_pl_listing, user: user, active_until: nil) }
  let(:invoke_task) { Rake::Task['mapawynajmu_pl:delete_inactive_announcements'].invoke }

  describe "Rake::Task['mapawynajmu_pl:delete_inactive_announcements']" do
    it 'deletes definite listings' do
      expect { invoke_task }.to change { definite_listing.reload.deleted? }.from(false).to(true)
    end

    it 'does not delete indefinite listings' do
      expect { invoke_task }.not_to change { indefinite_listing.reload.deleted? }
    end
  end
end
