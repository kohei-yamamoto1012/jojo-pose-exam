class CheckItemResultResource
  include Alba::Resource

  root_key :check_item_result

  attributes :result

  attribute :content do |resource|
    resource.check_item.content
  end

end