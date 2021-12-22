require 'csv'

CSV.foreach('db/exams.csv', headers: true) do |row|
  exam = Exam.new(
    title: row['title'],
    description: row['description']
  )
  CSV.foreach('db/check_items.csv', headers: true) do |row|
    if row['exam_title'] == exam.title
      exam.check_items << CheckItem.create!(
        exam: exam,
        check_pattern: row['check_pattern'].to_i,
        content: row['content'],
        allocation: row['allocation']
      )
    end
  end
end

CSV.foreach('db/keypoints.csv', headers: true) do |row|
  Keypoint.create!(
    name: row['name']
  )
end

CSV.foreach('db/score_borders.csv', headers: true) do |row|
  ScoreBorder.create!(
    score: row['score']
  )
end

CSV.foreach('db/exam_result_comments.csv', headers: true) do |row|
  ExamResultComment.create!(
    content: row['content'],
    score_border: ScoreBorder.find_by(score: row['score_border'])
  )
end