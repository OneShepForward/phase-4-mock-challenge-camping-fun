class ApplicationController < ActionController::API
  include ActionController::Cookies

rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable

private

def render_record_not_found
  render json: {error: "Record was not found"}, status: :not_found
end

def render_unprocessable(exception)
  render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
end

end
