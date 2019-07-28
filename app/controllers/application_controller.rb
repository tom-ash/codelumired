class ApplicationController < ActionController::API

  private

  def required_params_present?
    @required_params.each { |param| return unless params[param] }
  end
end
