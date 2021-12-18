class ExamResultResource
  include Alba::Resource

  root_key :exam_result

  attributes :id, :privacy_setting

  attribute :upload_image_url do |resource|
    resource.upload_image_url
  end

  attribute :total_score do |resource|
    resource.total_score
  end

  one :exam, resource: ExamResource
  many :check_item_results, resource: CheckItemResultResource

end