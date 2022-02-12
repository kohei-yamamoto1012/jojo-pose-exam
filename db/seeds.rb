require 'csv'

CSV.foreach('db/keypoints.csv', headers: true) do |row|
  Keypoint.create!(
    name: row['name']
  )
end

CSV.foreach('db/exams.csv', headers: true) do |row|
  exam = Exam.new(
    title: row['title'],
    description: row['description']
  )
  # examに関連づくcheck_itemを作成
  CSV.foreach('db/check_items.csv', headers: true) do |row|
    if row['exam_title'] == exam.title
      check_item = CheckItem.new(
        exam: exam,
        content: row['content'],
        allocation: row['allocation'],
        min_angle: row['min_angle'],
        max_angle: row['max_angle'],
        check_pattern: row['check_pattern']#.to_i 動作確認必要
      )

      #check_itemに関連づくcheck_item_keypointsを作成
      CSV.foreach('db/check_item_keypoints.csv', headers: true) do |row|
        if row['check_item_content'] == check_item.content
          check_item.check_item_keypoints << CheckItemKeypoint.create!(
            keypoint: Keypoint.find_by(name: row['keypoint_name']),
            check_item: check_item,
            position: row['position']#.to_i 動作確認必要
          )
        end
      end

      exam.check_items << check_item
    end
  end

  exam.save!
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