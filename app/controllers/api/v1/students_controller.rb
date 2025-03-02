require_dependency 'student_dto'

module Api
  module V1
    class StudentsController < ApplicationController
      SECRET_SALT = 'GGERMAN'

      def create
        student_dto = StudentDTO.new(student_params)
        result = StudentService.new.create(student_dto)
      
        if result[:error]
          render json: { error: result[:error] }, status: result[:status]
        else
          token = generate_token(result[:student].id)
          render json: result[:student], status: result[:status], headers: { 'X-Auth-Token' => token }
        end
      end
    
      def destroy
        student = StudentService.new.find(params[:id])
        
        if student
          result = StudentService.new.delete(params[:id])
          if result
            render json: { message: 'Студент удален' }, status: :ok
          else
            render json: { error: 'Ошибка удаления' }, status: :unprocessable_entity
          end
        else
          render json: { error: 'Некорректный id студента' }, status: :bad_request
        end
      end

      def by_school
        unless SchoolService.new.exists?(params[:school_id])
          return render json: { error: 'Школа не найдена' }, status: :not_found
        end

        unless ClassroomService.new.exists_in_school?(params[:class_id], params[:school_id])
          return render json: { error: 'Класс не найден в данной школе' }, status: :not_found
        end

        students = StudentService.new.list_by_class(params[:class_id])
        render json: { data: students }, status: :ok
      end
    
      private
    
      def student_params
        params.require(:student).permit(:first_name, :last_name, :surname, :class_id, :school_id)
      end

      def generate_token(user_id)
        Digest::SHA256.hexdigest("#{user_id}#{SECRET_SALT}")
      end
    end    
  end
end