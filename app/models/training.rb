class Training < ApplicationRecord
  # userとのアソシエーション
  belongs_to :user
  # commentsとのアソシエーション
  has_many :comments, dependent: :destroy
  # favoritesとのアソシエーション
  has_many :favorites

  # ActiveHashとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :trainingtime
  belongs_to :part

  with_options presence: true do
    validates :title

    with_options numericality: { other_than: 0 } do
      validates :trainingtime_id
      validates :part_id
    end

    validates :event
  end
end
