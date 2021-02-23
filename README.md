# テーブル設計

##  users テーブル

| Column               | Type      | Options                   |
|----------------------|-----------|---------------------------|
| nickname             | string    | null: false               |
| email                | string    | null: false, unique: true |
| encrypted_password   | string    | null: false               |
| last_name            | string    | null: false               |
| first_name           | string    | null: false               |
| last_name_kana       | string    | null: false               |
| first_name_kana      | string    | null: false               |
| birthday             | date      | null: false               |

### Association

- has_many :items
- has_many :purchases

##  items テーブル

| Column               | Type       | Options     |
|----------------------|------------|-------------|
| item_name            | string     | null:false  |
| item_description     | text       | null:false  |
| item_category        | string     | null:false  |
| item_status          | string     | null:false  |
| item_delivery_fee    | string     | null:false  |
| item_delivery_source | string     | null:false  |
| item_delivery_days   | string     | null:false  |
| item_prise           | integer    | null:false  |
| user                 | references |             |

### Association

- belongs_to :user
- has_one :purchase

##  purchases テーブル

| Column           | Type       | Options     |
|------------------|------------|-------------|
| user             | references |             |
| item             | references |             |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

##  addresssテーブル

| Column           | Type       | Options     |
|------------------|------------|-------------|
| postal_code      | integer    | null:false  |
| prefectures      | string     | null:false  |
| municipalities   | string     | null:false  |
| address_number   | string     | null:false  |
| building_name    | string     | null:false  |
| phone_number     | integer    | null:false  |

### Association

- belongs_to :purchase