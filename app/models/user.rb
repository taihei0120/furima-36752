class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         validates :nickname, presence: true
         validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
         validates :first_name_zenkaku, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :last_name_zenkaku, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
         validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :birthday, presence: true
         
         has_many :items
         #has_many :orders

end
