# テーブル設計

## users テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| email      |  string | null: false |
| password   |  string | null: false |
| kananame   |  string | null: false |
| name       |  string | null: false |
| nickname   |  string | null: false |
| birthday   |datetime | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| item_name       |    string |                    null: false |
| description     |      text |                    null: false |
| category        |    string |                    null: false |
| status          |    string |                    null: false |
| shipping_charge |    string |                    null: false |
| area            |    string |                    null: false |
| shipping_time   |   integer |                    null: false |
| price           |   integer |                    null: false |
| user            | reference | null: false, foreign_key: true |
| buyer           | reference | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :buyer

## buyers テーブル

| Column     | Type      | Options                        |
| ---------- | --------- | ------------------------------ |
| c_number   |   integer |                    null: false |
| c_limit    |  datetime |                    null: false |
| c_code     |   integer |                    null: false |
| user       | reference | null: false, foreign_key: true |
| item       | reference | null: false, foreign_key: true |
| shipping   | reference | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :shipping

## shipping テーブル

| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| postal_code |   integer |                    null: false |
| prefecture  |    string |                    null: false |
| city        |    string |                    null: false |
| address     |    string |                    null: false |
| building    |    string |                                |
| phone       |   integer |                    null: false |
| buyer       | reference | null: false, foreign_key: true |
## Association

- belongs_to :buyer