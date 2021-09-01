# テーブル設計

## users テーブル

| Column             | Type      | Options                   |
| -------------------| --------- | ------------------------- |
| nickname           | string    | null: false               |
| email              | string    | null: false, unique: true |
| encrypted_password | string    | null: false               |
| first_name_zenkaku | string    | null: false               |
| first_name_kana    | string    | null: false               |
| last_name_zenkaku  | string    | null: false               |
| last_name_kana     | string    | null: false               |
| birthday_year      | string    | null: false               |
| birthday_month     | string    | null: false               |
| birthday_day       | string    | null: false               |


### Association
 - has_many :items
 - has_many :orders


## items テーブル

| Column               | Type      | Options                        |
| ---------------------| --------- | ------------------------------ |
| product_image        | image     | ActiveStorage                  |
| product_name         | string    | null: false                    |
| product_description  | text      | null: false                    |
| product_category     | string    | null: false                    |
| product_condition    | string    | null: false                    |
| delivery_fee         | string    | null: false                    |
| delivery_from        | string    | null: false                    |
| delivery_day         | string    | null: false                    |
| price                | string    | null: false                    |
| user                 | reference | null: false, foreign_key: true |


### Association
 - belongs_to :user
 - belongs_to :order


## orders テーブル

| Column       | Type      | Options                        |
| -------------| --------- | ------------------------------ |
| postal_code  | string    | null: false                    |
| city         | string    | null: false                    |
| town         | string    | null: false                    |
| home_number  | string    | null: false                    |
| building     | string    |                                |
| telephone    | string    | null: false                    |
| user         | reference | null: false, foreign_key: true |
| item         | reference | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - belongs_to :item