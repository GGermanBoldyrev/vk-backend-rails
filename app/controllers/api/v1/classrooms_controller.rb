module Api
  module V1
    class ClassroomsController < ApplicationController
      def index
        classrooms = ClassroomService.new.list_by_school(params[:school_id])
        render json: { data: classrooms }, status: :ok
      end
    end
  end
end