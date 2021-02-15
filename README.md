# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- | 
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_frigana      | string  | null: false               |
| last_frigana       | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :records

## items テーブル

| Column                  | Type       | Option                         |
| ----------------------- | ---------- | ------------------------------ |
| name                    | string     | null: false                    |
| explanation             | text       | null: false                    |
| category_id             | integer    | null: false                    |
| state_id                | integer    | null: false                    |
| delivery_fee_id         | integer    | null: false                    |
| delivery_source_area_id | integer    | null: false                    |
| days_to_delivery_id     | integer    | null: false                    |
| price                   | integer    | null: false                    |
| user                    | references | null: false, foreign_key: true |

### Association

- has_one :record
- belongs_to :user

## addresses テーブル

| Column                  | Type       | Option                         |
| ----------------------- | ---------- | ------------------------------ |
| postal_code             | string     | null: false                    |
| delivery_source_area_id | integer    | null: false                    |
| municipality            | string     | null: false                    |
| house_number            | string     | null: false                    |
| building                | string     |                                |
| phone_number            | string     | null: false                    |
| user                    | references | null: false, foreign_key: true |

### Association

- belongs_to :record

## records テーブル

| Column     | Type       | Option                         |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address
