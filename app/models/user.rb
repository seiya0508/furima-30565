class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buyers
  
  with_options presence: true do
  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :first_name, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ }
  validates :last_name, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ }
  validates :first_name_kana, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :last_name_kana, format: { with: /\A([ァ-ン]|ー)+\z/ }
  end
end
