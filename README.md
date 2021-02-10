# テーブル設計

## users テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- | 
| nickname    | string  | null: false |
| email       | string  | null: false |
| password    | string  | null: false |
| first_name  | string  | null: false |
| last_name   | string  | null: false |
| birth_year  | integer | null: false |
| birth_month | integer | null: false |
| birth_day   | integer | null: false |

### Association

- has_many :products
- has/many :records

## products テーブル

| Column               | Type       | Option                         |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| explanation          | text       | null: false                    |
| category             | string     | null: false                    |
| state                | string     | null: false                    |
| delivery_fee         | string     | null: false                    |
| delivery_source_area | string     | null: false                    |
| days_to_delivery     | string     | null: false                    |
| price                | integer    | null: false                    |
| user_id              | references | null: false, foreign_key: true |

### Association

- has_one :record
- belongs_to :user

## addresses テーブル

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| municipality | string     | null: false                    |
| house_number | integer    | null: false                    |
| phone_number | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :record

## records テーブル

| Column     | Type       | Option                         |
| ---------- | ---------- | ------------------------------ |
| product_id | references | null: false, foreign_key: true |
| user_id    | references | null: false, foreign_key: true |
| address_id | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user
- has_one :address
