# furima-30565のER図

## users テーブル

| Colum           | type      | Options     |
| --------------  | ------    | ----------- |
| nickname        | string    | null: false |
| first_name      | string    | null: false |
| last_name       | string    | null: false |
| first_name_kana | string    | null: false |
| last_name_kana  | string    | null: false |
| birthday        | date      | null: false |
| email           | string    | null: false |
| password        | string    | null: false |

### Association

- has_many :items
- has_many :buyers

## buyers テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | -----------------------------|
| user             | references | foreign_key: true            |
| item             | references | foreign_key: true            |

### Association

- belongs_to :item
- belongs_to :user
- has_one :destination

## items テーブル

| Colum              | type        | Options           |
| -------------------| ----------- | ------------------|
| name               | string      | null: false       |
| description        | text        | null: false       |
| price              | integer     | null: false       |
| category_id        | integer     | null: false       |
| condition_id       | integer     | null: false       |
| delivery_charge_id | integer     | null: false       |
| delivery_area_id   | integer     | null: false       |
| shipping_day_id    | integer     | null: false       |
| user               | references  | foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

## destinations テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| postal_code      | string     | null: false       |
| prefecture_id    | integer    | null: false       |
| municipality     | string     | null: false       |
| address          | string     | null: false       |
| building         | string     |                   |
| tel              | string     | null: false       |
| buyer            | references | foreign_key: true |

### Association
- belongs_to :buyer



