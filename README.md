## usersテーブル
|Column|Type|Options|
|------|----|-------|
|id|bigint|null: false|
|name|string|null: false, unique: true|
add_index :users, :name
### Association
- has_many :messages
- has_many :users_groups
- has_many :groups,  through:  :users_groups

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|id|bigint|null: false|
|name|string|null: false, unique: true|
|addition_id|bigint|null: false, foreign_key: true|
|created_at|datelme|-------|
|updated_at|datelme|-------|
add_index :groups, :group_id
### Association
- belongs_to :auth_informatlon
- has_many :messages
- has_many :groups_users
- has_many :users,  through:  :groups_users

## users_groupsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false, foreign_key: true|
|group_id|bigint|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group


## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|id|bigint|null: false|
|body|text|null: false|
|image|text|null: false|
|user_id|bigint|null: false, foreign_key: true|
|group_id|bigint|null: false, foreign_key: true|
|created_at|datelme|-------|
add_index :messages, :body
### Association
- belongs_to :auth_informatlon
- belongs_to :group
- belongs_to :user