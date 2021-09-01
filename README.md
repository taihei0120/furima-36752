# テーブル設計

## users テーブル
| Column             | Type   | Options                   |
| -------------------| ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name_zenkaku | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_zenkaku  | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association
 - has_many :items
 - has_many :orders


## items テーブル
| Column               | Type       | Options                        |
| ---------------------| ---------- | ------------------------------ |
| product_name         | string     | null: false                    |
| product_description  | text       | null: false                    |
| product_category_id  | integer    | null: false                    |
| product_condition_id | integer    | null: false                    |
| delivery_fee_id      | integer    | null: false                    |
| delivery_from_id     | integer    | null: false                    |
| delivery_day_id      | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - has_one :order


## orders テーブル
| Column   | Type       | Options                        |
| ---------| ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |
| address  | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - belongs_to :item
 - belongs_to :address


 ## addresses テーブル
| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| city         | string     | null: false                    |
| town         | string     | null: false                    |
| home_number  | string     | null: false                    |
| building     | string     |                                |
| telephone    | string     | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association
 - has_one :order