class Api::ExamResultsController < ApplicationController
  before_action :set_exam_result, only: %i[show]

  def create
    @exam_result = ExamResult.new(exam_result_params)

    upload_image_file = exam_result_params['upload_image']
    @exam_result.upload_image_vips = Vips::Image.new_from_file(upload_image_file.tempfile.path).autorot
    @exam_result.upload_image_name = "#{upload_image_file.original_filename}.webp"

    if @exam_result.save
      render json: ExamResultResource.new(@exam_result).serialize
    else
      render json: @exam_result.errors, status: :bad_request
    end
    @exam_result.delete_tmp_image
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
