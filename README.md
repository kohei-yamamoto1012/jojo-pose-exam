# ジョジョ立ち検定
![rails](https://img.shields.io/badge/Rails-v6.1.4-red)
![rails](https://img.shields.io/badge/Vue-v2.6.14-brightgreen)

~https://jojo-pose-exam.jp/~ → 現在サービス停止中

<!-- ![ogp](https://github.com/kohei-yamamoto1012/jojo-pose-exam/blob/main/app/assets/images/ogp.png) -->
## サービス紹介動画
[![サービス紹介動画](https://user-images.githubusercontent.com/84756197/173222007-3aefa245-4c0e-45e6-9855-91f0e3be89ed.png)](https://youtu.be/5aKI900iGVo?t=1336)


## サービス概要
[ジョジョ立ち](https://ja.wikipedia.org/wiki/%E8%8D%92%E6%9C%A8%E9%A3%9B%E5%91%82%E5%BD%A6#%E3%82%B8%E3%83%A7%E3%82%B8%E3%83%A7%E7%AB%8B%E3%81%A1)の高みを目指す人達が、ジョジョ立ちの検定を受けるためのサービスです。<br>
AI技術を用いてあなたジョジョ立ちを解析し、アップロードされたジョジョ立ち画像の合否を判定します。

▼ 開発者の受験結果ページ<br>
https://jojo-pose-exam.jp/exam_results/c71da2f4-fdd8-4851-bbf1-e1f831f0b255


## 画面・機能一覧
| トップページ                                                          | 検定一覧ページ                                                          |
| ------------------------------------------------------------------ | -------------------------------------------------------------------- |
| <img src="https://gyazo.com/c210cc60b2312ac2397ec223992d7300.png"> | <img src="https://gyazo.com/fc4a8aa873ae130b9432552c133c285c.png">   |
| ・受検手順を表示する<br>・受検するボタンで検定一覧ページに遷移する               | ・検定一覧を表示する<br>・各検定の詳細ページに遷移する                           |

| 検定詳細ページ                                                                       | 受検結果ページ                                                         |
| ------------------------------------------------------------------                | -------------------------------------------------------------------- |
| <img src="https://gyazo.com/a6cf62864530e720760b91fd9ac222ce.png">                | <img src="https://gyazo.com/82686eb88ca6cc62b21a63fd4fe439c7.png">   |
| ・ジョジョ立ちの概要、チェックポイントを表示する<br>・受検用の画像選択フォームを表示する<br>・受検結果ページに遷移する | ・得点、合否、各チェックポイントの成否判定結果、評価コメントを表示する　<br>・Twitterシェアボタンでツイート投稿ページに遷移する<br>・リトライボタンで検定詳細ページに遷移する |

| 評価コメントのカットイン演出                                                                      | 利用規約                                                       |
| ------------------------------------------------------------------                | -------------------------------------------------------------------- |
| <img src="https://gyazo.com/cf13b301d7f635f21b382a349f36f102.png">                | <img src="https://gyazo.com/1ad975307df6de906859a4ddc30d32c2.png"> |
| ・受検結果ページへ遷移する際には、評価コメントをカットイン演出で表示する<br>・評価コメントは検定結果に対応したもの中からランダムに決定される | 利用規約を表示する|

| プライバシーポリシー                                                    | お問い合わせ                                                               |
| ------------------------------------------------------------------ | --------------------------------------------------------------------    |
| <img src="https://gyazo.com/63ed8c122f667bf7b3eb585814c9a92f.png"> | <img src="https://gyazo.com/36a98d3a56997d7c16896ec9828f58b9.png">      |
| プライバシーポリシーを表示する                                            | お問い合わせ先(Twitterアカウント)の情報を表示する　                            |

## 使用技術
**フロントエンド**
<ul>
  <li>Vue.js 2.6.14</li>
  <details>
    <summary>主要npmパッケージ</summary>
    <ul>
      <li><a href="https://github.com/vuetifyjs/vuetify">vuetify</a></li>
      <li><a href="https://github.com/vuejs/vue-router">vue-router</a></li>
      <li><a href="https://github.com/vuejs/vuex/tree/3.x">vuex</a></li>
      <li><a href="https://github.com/logaretm/vee-validate">vee-validate</a></li>
      <li><a href="https://github.com/cngu/vue-typer">vue-typer</a></li> 
      <li><a href="https://github.com/eslint/eslint">eslint</a></li>
    </ul>
  </deatails>
</ul>

**バックエンド**
<ul>
  <li>Ruby 3.0.2</li>
  <li>Rails 6.1.4</li>
  <details>
    <summary>主要gem</summary>
    <ul>
      <li><a href="https://github.com/microsoft/onnxruntime">onnxruntime</a></li>
      <li><a href="https://github.com/libvips/ruby-vips">ruby-vips</a></li>
      <li><a href=https://github.com/aws/aws-sdk-ruby"">aws-sdk-s3</a></li>     
      <li><a href="https://github.com/okuramasafumi/alba">alba</a></li>
      <li><a href="https://github.com/mbleigh/seed-fu">seed-fu</a></li>
      <li><a href="https://github.com/kpumuk/meta-tags">meta-tags</a></li>
      <li><a href="https://github.com/rubocop/rubocop">rubocop</a></li>
    </ul>
  </deatails>
</ul>
  
**インフラ**
- Heroku
- PostgreSQL
- Amazon S3

**その他**<br>
ジョジョ立ちの姿勢推定用の機械学習モデルとして、Tensorflowの[movenet](https://www.tensorflow.org/hub/tutorials/movenet?hl=ja)を採用した。<br>
Ruby上で実行するために、学習モデルをpb形式からonnx形式に変換した上で、[gem onnxruntime](https://github.com/microsoft/onnxruntime)を用いて実行する。

## 合否判定処理の概要
![合否判定](https://gyazo.com/045ac4c6f0582d06d0c7f88b073ec154.png)

## ER図
![ER図](https://gyazo.com/b1b912d86ed8d3ee1bd09ed60112304a.png)

## 画面遷移図
https://www.figma.com/file/kggQ7O5W0hDlSyVkDHkqz3/Flow?node-id=0%3A1

## 関連ページ
- Twitterハッシュタグ: [#ジョジョ立ち検定](https://twitter.com/search?q=%23%E3%82%B8%E3%83%A7%E3%82%B8%E3%83%A7%E7%AB%8B%E3%81%A1%E6%A4%9C%E5%AE%9A&src=typed_query)
- Qiita記事: [【個人開発】AI技術を用いたジョジョ立ち検定サービスをリリースしましたッ！](https://qiita.com/yamamoto-kohei1111/items/3a966b28f53f76aec7f9)
