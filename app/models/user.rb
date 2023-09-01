class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_one :order
  has_many :comments
              
  with_options presence: true do
   validates :name
   validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]/ }
   validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]/ }
   validates :first_name_kana, format: { with: /\A[ァ-ンー]+\z/ }
   validates :last_name_kana, format: { with: /\A[ァ-ン一]+\z/ }
   validates :birthday
   validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  end       
end
