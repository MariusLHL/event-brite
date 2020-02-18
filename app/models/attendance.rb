class Attendance < ApplicationRecord
  after_create :attend_send

  belongs_to :user
  belongs_to :event

  def attend_send
    @owner = User.find_by(id: self.event.user_id)
    AttendeeMailer.attend_email(@owner).deliver_now
  end
end
