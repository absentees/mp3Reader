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
  validates :url, :presence => true
  validates :file_name, :presence => true


end
