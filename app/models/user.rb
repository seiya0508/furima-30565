class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buyers

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :email, format: { with: /\A\S+@\S+\.\S+\z/ }
    validates :password, format: { with: /\A[a-z0-9]+\z/ }

    # 13-16行目は、正規表現を用いたバリデーションの設定ができていて良いですね。
    # こちらの正規表現は再度使用することや可読性も考慮し、変数に代入しておくといいでしょう。
    # その際の変数の命名ですが、例えばNAME_REGEXといった感じで、すべて大文字のスネークケースとしましょう。
    NAME_REGEX = /\A([ぁ-んァ-ン一-龥]|ー)+\z/.freeze
    validates :first_name, format: { with: NAME_REGEX }
    validates :last_name, format: { with: NAME_REGEX }
    NAME_REGEX_KANA = /\A([ァ-ン]|ー)+\z/.freeze
    validates :first_name_kana, format: { with: NAME_REGEX_KANA }
    validates :last_name_kana, format: { with: NAME_REGEX_KANA }
  end
end
