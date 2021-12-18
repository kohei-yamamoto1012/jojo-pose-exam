class ExamResource
  include Alba::Resource

  root_key :exam

  attributes :id, :title, :description, :path

end