class Api::ExamResultsController < ApplicationController
  def create
    exam_result = ExamResult.new(exam_result_params)
    if exam_result.save
      render json: exam_result
    else
      render json: exam_result.errors, status: :bad_request
    end
  end

  def upload_image
    exam_result = ExamResult.find(params[:id])
    if exam_result.update(upload_image_prams)
      render json: exam_result, methods: [:upload_image_url]
    else
      render json: exam_result.errors, status: :bad_request
    end
  end

  private

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
