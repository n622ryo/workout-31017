# workout

## サービス概要
スポーツジムに通う方の中で、初心者の方には上級者のトレーニングを参考にする事で、自分のトレーニング指針をたててもらい、上級者の方には自分のトレーニングの振り返りと、モチベーションの維持につながればと思いつくりました。


## 作る上で意識したこと
一つ一つの機能自体はいたってシンプルなものばかりであり、画期的で面白みのある作品かどうかと問われればあまり自信はありません。しかしながら、Rails最大の強みでもある「MVCアーキテクチャ」の概念にひたすら忠実に従い、何よりも基本を意識した構成を心掛けております。

基本的にはジムを利用する方向けになりますが、老若男女全ての世代の方が簡単に使用できるように意識しています。
また、自分の身近な問題としてスポーツジムのトレーニングのモチベーション維持が難しく感じていたので、その解決ができればと考えました。そこで自分のトレーニングを共有し、共感を得ることや、他の人のトレーニングを参考にすることでモチベーションの維持とトレーニングの質の向上に繋がればと思い、問題解決には何が必要かを意識しました。
また、変に背伸びをせず、自分が理解して、これはどういう動きなのか説明できる範囲での技術を使っています。

**他にも、branchを切る -> 開発を行う -> pushする -> pull requestを送信する -> mergeする」といったチーム開発の流れを疑似的に再現するなど、より実践的な環境で作業を進めました。**



## URL
https://workout-31017.herokuapp.com/

ID:admin

Pass:2222

テストユーザーアカウント

メールアドレス：b@b

パスワード：111aaa

※ページ内には「簡単ログイン（ゲストユーザーとしてワンクリックでログインができる機能）」も実装してありますので、そちらをご利用いただけると幸いです。

## 開発環境
Ruby 2.6.5

Rails 6.0.0

## ER図
![demo]
(https://i.gyazo.com/30f5af9cd0c7c3f27d23a0b0403f5023.png)
## 各種機能＆導入技術
- プラットフォーム（Heroku）
- データベース（MySQL）
- テスト（Rspec、Capybara、factory_bot）
- ユーザー登録＆ログイン（devise)
- コードチェック（rubocop）
- エディタ（vsコード）
- アプリケーションメッセージ日本語化(rails-i18n)



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
- has_many :favorites
- has_many :relationships

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
- has_many :favorites


## comments テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ------------|
| text      | text       | null: false |
| user      | references |             |
| training  | references |             |

### Association

- belongs_to :user
- belongs_to :training

## favorites テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ------------|
| user      | integer    |             |
| training  | integer    |             |

### Association

- belongs_to :user
- belongs_to :training

## relationships テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ------------|
| user      | integer    |             |
| training  | integer    |             |

### Association

- belongs_to :user