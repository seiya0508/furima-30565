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

## buyer テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | -----------------------------|
| user             | references | foreign_key: true            |
| items            | references | foreign_key: true            |

### Association

- belongs_to :item
- belongs_to :user
- has_one :destination

## items テーブル

| Colum              | type       | Options           |
| -------------------| ---------- | ------------------|
| name               | string     | null: false       |
| description        | text       | null: false       |
| price              | integer    | null: false       |
| category_id        | string     | null: false       |
| condition_id       | string     | null: false       |
| delivery_charge_id | string     | null: false       |
| delivery_area_id   | string     | null: false       |
| shipping_days_id   | string     | null: false       |
| user               | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

## destinations テーブル

| Column           | Type       | Options---------- |
| ---------------- | ---------- | ----------------- |
| postal_code      | string     | null: false       |
| prefectures      | string     | null: false       |
| municipality     | string     | null: false       |
| addresses        | string     | null: false       |
| building         | string     | null: false       |
| tel              | string     | null: false       |
| buyer            | references | foreign_key: true |

### Association
- belongs_to :buyer