module Api
  module V1
    class ApplicationController < ActionController::API
      rescue_from StandardError, with: :render_internal_error

      private

      def render_internal_error(exception)
        logger.error "Ошибка: #{exception.message}"
        logger.error exception.backtrace.join("\n")

        render json: { error: 'Внутренняя ошибка сервера' }, status: :internal_server_error
      end
    end
  end
end
