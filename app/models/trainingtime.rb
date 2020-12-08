class Trainingtime < ActiveHash::Base
  self.data = [
    { id: 0, name: '--'},
    { id: 1, name: '10分' },
    { id: 2, name: '20分' },
    { id: 3, name: '30分' },
    { id: 4, name: '40分' },
    { id: 5, name: '50分' },
    { id: 6, name: '60分' },
    { id: 7, name: '70分' },
    { id: 8, name: '80分' },
    { id: 9, name: '90分' },
    { id: 10, name: '100分' },
    { id: 11, name: '110分' },
    { id: 12, name: '120分' },
    { id: 13, name: '120分以上' }
  ]

  include ActiveHash::Associations
  has_many :trainings
end