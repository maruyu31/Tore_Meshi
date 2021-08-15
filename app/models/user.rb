class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :followers, through: :passive_relationships, source: :following

  validates :name, presence: true
  validates :encrypted_password, length: {minimum: 6}
  #メールアドレスの正規表現
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  
  attachment :profile_image
  
  # 退会したユーザーはログイン出来ない仕様にする。
  def active_for_authentication?
    super && is_deleted == false
  end
end
