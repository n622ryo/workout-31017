class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :trainings
  has_many :comments
  has_many :favorites
  has_many :favorite_trainings, through: :favorites, source: :training

  # ====================自分がフォローしているユーザーとの関連 ===================================
  #フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はfollowing_id(フォローする側)
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
  has_many :followings, through: :active_relationships, source: :follower
  # ========================================================================================

  # ====================自分がフォローされるユーザーとの関連 ===================================
  #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
  has_many :followers, through: :passive_relationships, source: :following
  # =======================================================================================


  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = 'ゲスト'
      user.password = SecureRandom.urlsafe_base64
      user.target = '目標'
    end
  end

  def followed_by?(user)
    # 今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
    passive_relationships.find_by(following_id: user.id).present?
  end

  with_options presence: true do
    validates :name
    validates :target
  end
end
