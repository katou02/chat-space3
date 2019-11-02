# README


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|null: false, foreign_key: true|
|image|string|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :messages
- has_many :group


## groupテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|null: false, foreign_key: true|
|image|string|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- has_many :messages
- has_many :user






