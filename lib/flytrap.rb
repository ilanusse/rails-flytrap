require 'flytrap/version'
require 'flytrap/exception'

module Flytrap

  def self.included(controller)
    controller.rescue_from Flytrap::Exception do |e|
      render json: e.to_json, status: e.status_code
    end
  end
end
