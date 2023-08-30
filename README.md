## usersテーブル

| Column            | Type    | Options      |
|-------------------|---------|--------------|
| name	            | string	| null: false  |
| email	            | string	| null: false  |
| encrypted_password|	string	| null: false  |
| first_name	      | string	| null: false  |
| last_name	        | string	| null: false  |
| first_name_kana	  | string	| null: false  |
| last_name_kana	  | string	| null: false  |
| birthday	        | date	  | null: false  |

### Association
 has_many :items
 has_many :purchases


## itemsテーブル

| Column            | Type       | Options                         |
|-------------------|------------|---------------------------------|
| name	            | string	   | null: false                     |
| description	      | text	     | null: false                     |
| category_id	      | integer	   | null: false                     |
| status_id	        | integer	   | null: false                     |
| shipping_cost_id	| integer	   | null: false                     |
| shipping_day_id	  | integer	   | null: false                     |
| prefecture_id	    | integer	   | null: false                     |
| selling_price	    | integer	   | null: false                     |
| user	            | references |	null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase

## purchasesテーブル

| Column    | Type       | Options                         |
|-----------|------------|---------------------------------|
| user	    | references | null: false, foreign_key: true  |
| item	    | references | null: false, foreign_key: true  |

### Association
belongs_to :item
belongs_to :user
has_one :shipping_address

## shipping_addressテーブル

| Column            | Type       | Options      |
|-------------------|------------|--------------|
| postal_code	      | string	   | null: false  |
| prefecture_id	    | integer	   | null: false  |
| municipality	    | string	   | null: false  |
| address	          | string	   | null: false  |
| building_name	    | string	   |              |
| phone_number	    | string	   | null: false  |
| purchase_id	      | integer	   | null: false  |

### Association
belongs_to : purchase