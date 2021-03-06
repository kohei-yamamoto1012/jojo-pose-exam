class ExamResultResource
  include Alba::Resource

  root_key :exam_result

  attributes :id, :privacy_setting

  attribute :upload_image_url, &:upload_image_url

  attribute :total_score, &:total_score

  one :exam, resource: ExamResource
  one :exam_result_comment do
    attributes :content
  end
  many :check_item_results, resource: CheckItemResultResource
end
