# テーブル設計

##  users テーブル

| Column     | Type      | Options     |
|------------|-----------|-------------|
| nickname   | string    | null: false |
| email      | string    | null: false |
| password   | string    | null: false |
| name       | string    | null: false |
| birthday   | integer   | null: false |

### Association

- has_many :items
- has_many :purchases

##  items テーブル

| Column           | Type       | Options     |
|------------------|------------|-------------|
| item_name        | text       | null:false  |
| item_description | text       | null:false  |
| item_image       | text       | null:false  |
| item_prise       | integer    | null:false  |
| user             | references |             |

### Association

- belongs_to :user
- has_one :purchase

##  purchases テーブル

| Column           | Type       | Options     |
|------------------|------------|-------------|
| card_information | integer    | null:false  |
| address          | string     | null:false  |
| user             | references |             |
| item             | references |             |

### Association

- belongs_to :user
- belongs_to :item

