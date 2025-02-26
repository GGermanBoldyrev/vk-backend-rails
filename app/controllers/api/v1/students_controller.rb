module Api
  module V1
    class StudentsController < ApplicationController
      def index
        students = StudentService.new.list_all
        render json: students, status: :ok
      end
    
      def show
        student = StudentService.new.find(params[:id])
        if student
          render json: student, status: :ok
        else
          render json: { error: 'Студент не найден' }, status: :not_found
        end
      end
    
      def create
        student_dto = StudentDTO.new(student_params)
        student = StudentService.new.create(student_dto)
    
        if student
          render json: student, status: :created
        else
          render json: { error: 'Ошибка создания' }, status: :unprocessable_entity
        end
      end
    
      def destroy
        result = StudentService.new.delete(params[:id])
    
        if result
          render json: { message: 'Студент удален' }, status: :ok
        else
          render json: { error: 'Ошибка удаления' }, status: :bad_request
        end
      end
    
      private
    
      def student_params
        params.permit(:first_name, :last_name, :surname, :class_id, :school_id)
      end
    end    
  end
end