class User < ApplicationRecord
  after_create :welcome_send

  has_many :join_event
  has_many :event, through: :join_event
  has_secure_password

  def welcome_send
    puts "cool"
    UserMailer.welcome_email(self).deliver_now
  end
end
