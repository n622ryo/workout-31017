# テーブル設計

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
