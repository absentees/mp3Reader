class Website < ActiveRecord::Base
  attr_accessible :websiteUrl
  belongs_to :user

  validates :user_id, :presence => true

  default_scope :order => "websites.created_at DESC"

end
