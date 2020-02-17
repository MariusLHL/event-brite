class Event < ApplicationRecord
  has_many :join_event
  has_many :user, through: :join_event
  validates :price , presence: true
  validates :start_date, presence: true
  validates :duration, presence:true
  validates :description, presence: true, length: { in: 10..1000}
  validates :title, presence: true, length: {in: 5..140}
  validates :price, presence: true , length: {in: 1..1000}
  validates :location, presence: true
end
