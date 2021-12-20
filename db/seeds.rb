giorno_exam = Exam.new(
  title: 'ジョルノ立ち',
  description: '第5部「黄金の風」の第5話「ブチャラティが来る② 」にて、主人公のジョルノ・ジョバーナが行ったジョジョ立ち。ジョルノの回想シーン中で「ギャング・スター」にあこがれるようになったのだ！というナレーションと共に描かれた。'
)
giorno_exam.save!

CheckItem.create!([
  {
    exam: giorno_exam,
    check_pattern: 1,
    content: '顎を軽く引き、正面を見据える',
    allocation: 10
  },
  {
    exam: giorno_exam,
    check_pattern: 2,
    content: '右肘を曲げ、右手で胸元を掴む',
    allocation: 20
  },
  {
    exam: giorno_exam,
    check_pattern: 3,
    content: '左手を軽く握り、左腿に添える',
    allocation: 20
  },
  {
    exam: giorno_exam,
    check_pattern: 4,
    content: '足を大きく開く',
    allocation: 10
  },
  {
    exam: giorno_exam,
    check_pattern: 5,
    content: '右膝を真っ直ぐ斜めに伸ばす',
    allocation: 20
  },
  {
    exam: giorno_exam,
    check_pattern: 6,
    content: '左膝を軽く曲げ、踵を浮かす',
    allocation: 20
  }
])

Keypoint.create!([
  { name: 'nose' },
  { name: 'left_eye' },
  { name: 'right_eye' },
  { name: 'left_ear' },
  { name: 'right_ear' },
  { name: 'left_shoulder' },
  { name: 'right_shoulder' },
  { name: 'left_elbow' },
  { name: 'right_elbow' },
  { name: 'left_wrist' },
  { name: 'right_wrist' },
  { name: 'left_hip' },
  { name: 'right_hip' },
  { name: 'left_knee' },
  { name: 'right_knee' },
  { name: 'left_ankle' },
  { name: 'right_ankle' }
])

score_border_40 = ScoreBorder.new(
  score: 40
)
score_border_40.save!

score_border_60 = ScoreBorder.new(
  score: 60
)
score_border_60.save!

score_border_99 = ScoreBorder.new(
  score: 99
)
score_border_99.save!

score_border_100 = ScoreBorder.new(
  score: 100
)
score_border_100.save!

ExamResultComment.create!([
  {
    content: 'やれやれだぜ',
    score_border: score_border_40
  },
  {
    content: 'あァァァんまりだァァアァ',
    score_border: score_border_40
  },
  {
    content: '何をするだァー！',
    score_border: score_border_40
  },
  {
    content: '貧弱！貧弱ゥ！',
    score_border: score_border_60
  },
  {
    content: 'そう...一味違うのね',
    score_border: score_border_60
  },
  {
    content: 'ゴゴゴゴゴ',
    score_border: score_border_60
  },
  {
    content: 'ブラボー！おお…ブラボー！！',
    score_border: score_border_99
  },
  {
    content: 'ベネ',
    score_border: score_border_99
  },
  {
    content: 'メメタァ',
    score_border: score_border_99
  },
  {
    content: 'グレートですよこいつはァ',
    score_border: score_border_100
  },
  {
    content: 'きさまこのジョジョ立ちやり込んでいるなッ！',
    score_border: score_border_100
  },
  {
    content: 'ふるえるぞハート！燃えるきるほどヒート！！',
    score_border: score_border_100
  }
])