class ExamResource
  include Alba::Resource

  root_key :exam

  attributes :id, :title, :description

  many :check_items, resource: CheckItemResource 
end
