# furima-30565のER図

## users テーブル

| Colum      | type    | Options     |
| ---------- | ------  | ----------- |
| nickname   | text    | null: false |
| fullname   | text    | null: false |
| birthday   | integer | null: false |
| email      | string  | null: false |
| password   | string  | null: false |

### Association

- has_many :items
- has_many :buyers

## buyer テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| card_number      | integer     | null: false |
| card_expiration  | integer     | null: false |
| security_code    | integer     | null: false |
| shipping_address | text        | null: false |
| tel              | integer     | null: false |
| user_id          | references  |             |
| items_id         | references  |             |

### Association

- belongs_to :item
- belongs_to :user

## items テーブル

| Colum       | type       | Options     |
| ----------  | ---------- | ----------- |
| items_name  | text       | null: false |
| description | text       | null: false |
| price       | string     | null: false |
| image       |            |             |
| user_id     | references |             |

### Association

- belongs_to :user
- has_one :buyer