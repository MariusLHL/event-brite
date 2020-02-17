class Event < ApplicationRecord
  has_many :attendance
  has_many :user, through: :attendance
  validates :price , presence: true
  validates :start, presence: true
  validates :duration, presence:true
  validates :description, presence: true, length: { in: 10..1000}
  validates :title, presence: true, length: {in: 5..140}
  validates :price, presence: true , length: {in: 1..1000}
  validates :location, presence: true
end
