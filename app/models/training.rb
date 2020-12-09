class Training < ApplicationRecord
    #userとのアソシエーション
  belongs_to :user
  has_many :comments
    #ActiveHashとのアソシエーション
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :trainingtime
    belongs_to :part

    with_options presence: true do
      validates :title
      validates :event

      with_options numericality: { other_than: 0 } do
        validates :trainingtime_id
        validates :part_id
      end
    end
end