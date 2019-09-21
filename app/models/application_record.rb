class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

  def log_changes
    self.changelog = changelog + changes.map do |name, values|
      next if name == 'updated_at'

      {
        name: name,
        value: values[0],
        time: Time.now
      }
    end.compact
  end
end
