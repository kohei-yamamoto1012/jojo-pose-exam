class CheckItemResource
  include Alba::Resource

  root_key :check_item

  attributes :id, :exam_id, :content
end
