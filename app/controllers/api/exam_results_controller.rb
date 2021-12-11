class Api::ExamResultsController < ApplicationController
  def create

    exam_result = ExamResult.new(exam_result_params)
    if exam_result.save
      render json: exam_result
    else
      render json: exam_result.errors, status: :bad_request
    end

  end

  private

  def exam_result_params
    params.require(:exam_result).permit(:exam_id, :privacy_setting, :hide_face, exam_result_keypoints: [:x_coordinate, :y_coordinate, :score, :name])
  end
end
