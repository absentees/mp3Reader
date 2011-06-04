# == Schema Information
# Schema version: 20110521064009
#
# Table name: feeds
#
#  id         :integer         not null, primary key
#  website_id :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Feed < ActiveRecord::Base
  belongs_to :user
  has_many :websites, :foreign_key => "feed_id"

  validates :user_id, :presence => true



end
