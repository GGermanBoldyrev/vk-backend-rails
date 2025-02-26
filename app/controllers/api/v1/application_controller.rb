module Api
  module V1
    class ApplicationController < ActionController::API
      before_action :ensure_json_request

      rescue_from StandardError, with: :render_internal_error

      def route_not_found
        def route_not_found
          render json: {
            error: 'Маршрут не найден',
            message: "Маршрут '#{request.path}' не существует.",
            status: 404
          }, status: :not_found
        end
        
      end

      private

      def ensure_json_request
        request.format = :json
      end

      def render_internal_error(exception)
        logger.error "Ошибка: #{exception.message}"
        logger.error exception.backtrace.join("\n")

        response = { error: 'Внутренняя ошибка сервера' }

        if Rails.env.development?
          response[:message] = exception.message
          response[:backtrace] = exception.backtrace
        end

        render json: response, status: :internal_server_error
      end
    end
  end
end
