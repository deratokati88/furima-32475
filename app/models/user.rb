class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は6文字以上かつ英数字をそれぞれ含めてください' }
  validates :nickname, :birthday, presence: true

  with_options presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: 'に全角カタカナを使用してください' } do
    validates :f_kananame
    validates :l_kananame
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角で漢字、ひらがな、かたかなのみで入力して下さい' } do
    validates :f_name
    validates :l_name
  end

  has_many :items
  has_many :buyers
end
