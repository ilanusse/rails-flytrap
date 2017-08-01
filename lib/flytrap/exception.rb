module Flytrap
  # Flytrap Base Exception. Every exception that extends this should define:
  #  message - Developer-friendly error message
  #  code - Unique error code for front-end error handling
  #  status_code - The status code to respond with
  class Exception < RuntimeError
    class_attribute :message, :code, :status_code

    def to_json
      {
        error: {
          message: self.class.message,
          code: self.class.code,
          class_name: self.class.name
        }
      }
    end
  end
end
