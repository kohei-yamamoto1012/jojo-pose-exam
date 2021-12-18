class Api::ExamResultsController < ApplicationController
  before_action :set_exam_result, only: %i[show upload_image]

  def create
    @exam_result = ExamResult.new(exam_result_params)
    if @exam_result.save
      render json: ExamResultResource.new(@exam_result).serialize
    else
      render json: @exam_result.errors, status: :bad_request
    end
  end

  def show
    render json: ExamResultResource.new(@exam_result).serialize
  end

  def upload_image
    if @exam_result.update(upload_image_prams)
      render json: ExamResultResource.new(@exam_result).serialize
    else
      render json: @exam_result.errors, status: :bad_request
    end
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
      :upload_image,
      exam_result_keypoints: %i[x_coordinate y_coordinate score name]
    )
  end

  def upload_image_prams
    params.require(:exam_result).permit(:upload_image)
  end
end
