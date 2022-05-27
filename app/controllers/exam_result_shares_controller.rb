class ExamResultSharesController < ApplicationController
  def show
    @exam_result = ExamResult.find(params[:exam_result_id])
  end
end
