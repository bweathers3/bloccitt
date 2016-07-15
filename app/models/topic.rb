class Topic < ActiveRecord::Base

     has_many :posts, dependent: :destroy

     validates :name, length: { minimum: 4 }, presence: true
     validates :description, length: { minimum: 15 }, presence: true
     validates :public, presence: true

end
