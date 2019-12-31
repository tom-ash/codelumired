class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

  def log_changes
    self.change_log = change_log + changes.map do |name, values|
      next if %w[updated_at verification verification_code_iv].include?(name)

      {
        name: name,
        value: values[0],
        time: Time.now
      }
    end.compact
  end
end
