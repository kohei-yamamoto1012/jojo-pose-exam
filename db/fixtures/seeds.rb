require 'csv'

CSV.foreach('db/keypoints.csv', headers: true) do |row|
  Keypoint.seed do |s|
    s.id = row['id']
    s.name = row['name']
  end
end

CSV.foreach('db/score_borders.csv', headers: true) do |row|
  ScoreBorder.seed do |s|
    s.id = row['id']
    s.score = row['score']
  end
end

CSV.foreach('db/exam_result_comments.csv', headers: true) do |row|
  ExamResultComment.seed do |s|
    s.id = row['id']
    s.content = row['content']
    s.score_border = ScoreBorder.find_by(score: row['score_border'])
  end
end

CSV.foreach('db/exams.csv', headers: true) do |row|
  Exam.seed do |s|
    s.id = row['id']
    s.title = row['title']
    s.description = row['description']
  end
end

CSV.foreach('db/check_items.csv', headers: true) do |row|
  CheckItem.seed do |s|
    s.id = row['id']
    s.exam = Exam.find_by(title: row['exam_title'])
    s.content = row['content']
    s.allocation = row['allocation']
    s.min_angle = row['min_angle']
    s.max_angle = row['max_angle']
    s.check_pattern = row['check_pattern']
  end
end

CSV.foreach('db/check_item_keypoints.csv', headers: true) do |row|
  CheckItemKeypoint.seed do |s|
    s.id = row['id']
    s.check_item = CheckItem.find_by(content: row['check_item_content'])
    s.keypoint = Keypoint.find_by(name: row['keypoint_name'])
    s.position = row['position']
  end
end
