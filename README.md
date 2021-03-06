# テーブル設計

## users テーブル

| Column               | Type    | Options                   |
| -------------------- | ------- | ------------------------- |
| email                |  string | null: false, unique: true |
| encrypted_password   |  string |               null: false |
| f_kananame           |  string |               null: false |
| l_kananame           |  string |               null: false |
| f_name               |  string |               null: false |
| l_name               |  string |               null: false |
| nickname             |  string |               null: false |
| birthday             |    date |               null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column             | Type       | Options                        |
| -----------------  | ---------- | ------------------------------ |
| name               |     string |                    null: false |
| description        |       text |                    null: false |
| category_id        |    integer |                    null: false |
| status_id          |    integer |                    null: false |
| shipping_charge_id |    integer |                    null: false |
| prefecture_id      |    integer |                    null: false |
| shipping_time_id   |    integer |                    null: false |
| price              |    integer |                    null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## buyers テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shipping テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   |     string |                    null: false |
| prefecture_id |    integer |                    null: false |
| city          |     string |                    null: false |
| address       |     string |                    null: false |
| building      |     string |                                |
| phone         |     string |                    null: false |
| buyer         | references | null: false, foreign_key: true |
## Association

- belongs_to :buyer