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

| Column           | Type       | Options      |
| ---------------- | ---------- | -----------  |
| user_id          | references |             |
| items_id         | references |             |

### Association

- belongs_to :item
- belongs_to :user
- has_one :user

## items テーブル

| Colum       | type       | Options     |
| ----------  | ---------- | ----------- |
| items_name  | text       | null: false |
| description | text       | null: false |
| price       | integer    | null: false |
| user_id     | references |             |

### Association

- belongs_to :user
- has_many :buyers

## destinations テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| municipality     | string     | null: false |
| addresses        | string     | null: false |
| building         | string     | null: false |
| tel              | integer    | null: false |
| buyer_id         | integer    | null: false |

belongs_to :buyer