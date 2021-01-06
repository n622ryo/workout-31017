class Part < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '胸筋（大胸筋、小胸筋、前鋸筋など）' },
    { id: 2, name: '背筋（広背筋、僧帽筋など）' },
    { id: 3, name: '肩（三角筋など）' },
    { id: 4, name: '上腕（上腕二頭筋、上腕筋、上腕三頭筋など）' },
    { id: 5, name: '前腕' },
    { id: 6, name: '腹筋（腹直筋、腹斜筋、腹横筋、腸腰筋など）' },
    { id: 7, name: '太もも（大腿四頭筋、ハムストリングなど）' },
    { id: 8, name: 'ふくらはぎ（下腿三頭筋）' },
    { id: 9, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :trainings
end
