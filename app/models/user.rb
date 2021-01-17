class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :trainings
  has_many :comments
  has_many :favorites
  has_many :favorite_trainings, through: :favorites, source: :training


  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = 'ゲスト'
      user.password = SecureRandom.urlsafe_base64
      user.target = '目標'
    end
  end

  with_options presence: true do
    validates :name
    validates :target
  end
end
