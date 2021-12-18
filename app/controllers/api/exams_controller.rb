class Api::ExamsController < ApplicationController
  def index
    @exams = Exam.all
    render json: ExamResource.new(@exams).serialize
  end
end
