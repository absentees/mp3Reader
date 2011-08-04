# == Schema Information
# Schema version: 20110604092719
#
# Table name: links
#
#  id         :integer         not null, primary key
#  website_id :integer
#  url        :string(255)
#  fileType   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  file_name  :string(255)
#

class Link < ActiveRecord::Base
  belongs_to :website
  validates :website_id, :presence => true
  validates :url, :presence => true, :uniqueness => true
  validates :file_name, :presence => true

  def self.from_websites_in_user_feed(user)
    feed_websites = user.feed.websites.map(&:id).join(", ")
    joins(:website).where("website_id IN (#{feed_websites})")

  end

  def self.search(search)
    if search
      where('file_name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
