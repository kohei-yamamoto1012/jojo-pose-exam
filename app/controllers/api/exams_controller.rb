class Api::ExamsController < ApplicationController
  def index
    @exams = Exam.all
    render json: ExamResource.new(@exams).serialize
  end

  def show
    @exam = Exam.find(params[:id])
    render json: ExamResource.new(@exam).serialize
  end
end
