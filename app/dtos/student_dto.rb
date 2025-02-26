class StudentDTO
  attr_reader :first_name, :last_name, :surname, :class_id, :school_id

  def initialize(params)
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @surname = params[:surname]
    @class_id = params[:class_id]
    @school_id = params[:school_id]
  end

  def to_h
    {
      first_name: @first_name,
      last_name: @last_name,
      surname: @surname,
      class_id: @class_id,
      school_id: @school_id
    }
  end
end
