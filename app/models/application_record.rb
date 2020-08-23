class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

  def log_changes
    self.change_log = change_log + changes.map do |attr, values|
      next if unloggable.concat(%w[updated_at]).include?(attr)

      {
        attr: attr,
        until: Time.now,
        value: values[0]
      }
    end.compact
  end
end
