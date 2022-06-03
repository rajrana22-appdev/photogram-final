# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  comments_count  :integer
#  email           :string
#  likes_count     :integer
#  password_digest :string
#  private         :boolean
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  validates(:username,
            {
    :presence => true,
    :uniqueness => { :case_sensitive => false },
  })

  has_many :comments, :foreign_key => "author_id", :dependent => :destroy
  has_many :likes, :foreign_key => "fan_id", :dependent => :destroy
  has_many :sent_follow_requests, :class_name => "FollowRequest", :foreign_key => "sender_id", :dependent => :destroy
  has_many :accepted_sent_follow_requests, -> { where({ :status => "accepted" }) }, :class_name => "FollowRequest", :foreign_key => "sender_id"
  has_many :received_follow_requests, :class_name => "FollowRequest", :foreign_key => "recipient_id", :dependent => :destroy
  has_many :accepted_received_follow_requests, -> { where({ :status => "accepted" }) }, :class_name => "FollowRequest", :foreign_key => "recipient_id"
  has_many :own_photos, :class_name => "Photo", :foreign_key => "owner_id", :dependent => :destroy
  has_many :commented_photos, :through => :comments, :source => :photo
  has_many :liked_photos, :through => :likes, :source => :photo
  has_many :followers, :through => :accepted_received_follow_requests, :source => :sender
  has_many :following, :through => :accepted_sent_follow_requests, :source => :recipient
  has_many :feed, :through => :following, :source => :own_photos
  has_many :discover, :through => :following, :source => :liked_photos
end
