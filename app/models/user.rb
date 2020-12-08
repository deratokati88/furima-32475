class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :f_name,:l_name,:nickname,:birthday, presence: true
  validates :f_kananame,:l_kananame, presence: true,
    format: {
    with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  }
  validates :f_name,:l_name, presence: true,
    format: {
    with: /\A[ぁ-んァ-ン一-龥]+\z/,
    message: "全角で漢字、ひらがな、かたかなのみで入力して下さい"
  }

  has_many :items
  has_many :buyers

  
end
