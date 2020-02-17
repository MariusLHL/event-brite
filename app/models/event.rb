class Event < ApplicationRecord
  has_many :attendance
  has_many :user, through: :attendance
  validates :price , presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 1000}
  validates :start, presence: true
  validates :duration, presence:true
  validates :description, presence: true, length: { in: 10..1000}
  validates :title, presence: true, length: {in: 5..140}
  validates :price, presence: true , length: {in: 1..1000}
  validates :location, presence: true
  validate :multiple_of_five
  validate :cant_be_past
  
  private   
  
  def multiple_of_five
    errors.add(:duration, "is not multiple of five") unless duration % 5 == 0 
  end  
  
  def cant_be_past
    errors.add(:start, "Cant be a date that already happened") if start < Time.now
  end
end
