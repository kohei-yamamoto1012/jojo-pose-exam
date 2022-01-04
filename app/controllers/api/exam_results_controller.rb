class Api::ExamResultsController < ApplicationController
  before_action :set_exam_result, only: %i[show]

  def create
    @exam_result = ExamResult.new(exam_result_params)
    @exam_result.upload_image_tmpfile = exam_result_params['upload_image'].tempfile

    if @exam_result.save
      render json: ExamResultResource.new(@exam_result).serialize
    else
      render json: @exam_result.errors, status: :bad_request
    end
  end

  def show
    render json: ExamResultResource.new(@exam_result).serialize
  end

  private

  def set_exam_result
    @exam_result = ExamResult.find(params[:id])
  end

  def exam_result_params
    params.require(:exam_result).permit(
      :exam_id,
      :privacy_setting,
      :hide_face,
      :upload_image
    )
  end
end
