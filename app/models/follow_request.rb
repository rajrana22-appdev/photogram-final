# == Schema Information
#
# Table name: follow_requests
#
#  id           :integer          not null, primary key
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#
class FollowRequest < ApplicationRecord
  validates(:recipient, {:presence => true })
  validates(:sender, {:presence => true })

  belongs_to :sender, :class_name => "User"
  belongs_to :recipient, :class_name => "User"
end
