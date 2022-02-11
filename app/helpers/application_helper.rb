module ApplicationHelper
  def default_meta_tags
    {
      title: 'ジョジョ立ち検定 - AI技術を用いたジョジョ立ち検定サービス',
      description: 'ジョジョ立ちの高みを目指す人達に向けた、ジョジョ立ち検定サービスです。AI技術を用いてあなたジョジョ立ちを解析し、合否を判定いたします。',
      canonical: 'https://jojo-pose-exam.jp',
      noindex: !Rails.env.production?, # production環境以外はnoindex
      icon: image_url('favicon.ico'),
      og: {
        title: :title,
        description: :description,
        type: 'website',
        url: 'https://jojo-pose-exam.jp',
        image: image_url('ogp.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        creator: '@koheiyamamoto26'
      }
    }
  end
end
