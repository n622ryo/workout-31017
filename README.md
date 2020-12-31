# workout

## サービス概要
![]
()

## 作る上で意識したこと


## DEMO



## URL

テストユーザーアカウント

メールアドレス：

パスワード：

※ページ内には「簡単ログイン（ゲストユーザーとしてワンクリックでログインができる機能）」も実装してありますので、そちらをご利用いただけると幸いです。

## 開発環境
Ruby 2.6.5

Rails 6.0.0

## ER図
![demo]

## 各種機能＆導入技術
- プラットフォーム（Heroku）
- データベース（MySQL）
- テスト（Rspec、Capybara、factory_bot）
- 自動テスト＆自動デプロイ（Circleci）
- コードチェック（rubocop）
- ユーザー登録＆ログイン（devise)
- 画像アップロード（carrierwave、mini_magick、 AWS S3）
- カレンダー（simple_calendar）
- いいね、ブックマーク（Ajax）
- エディタ（vsコード）
- 検索（ransack）
- アプリケーションメッセージ日本語化(rails-i18n)
- パンくずリスト（gretel）
-各種API（Google、Facebook）

## トップページ



## users テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |
| target    | text   | null: false |

### Association

- has_many :trainings
- has_many :comments

## trainings テーブル

| Column              | Type       | Options                 |
| ------------------- | ---------- | ----------------------- |
| title               | string     | null: false             |
| trainingtime_id     | integer    | null: false,ActiveHash  |
| part_id             | integer    | null: false,ActiveHash  |
| event               | string     | null: false             |
| user                | references |                         |

### Association

- has_many :comments
- belongs_to :user

## comments テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ------------|
| text      | text       | null: false |
| user      | references |             |
| training  | references |             |

### Association

- belongs_to :user
- belongs_to :training
