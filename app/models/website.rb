# == Schema Information
# Schema version: 20110604034525
#
# Table name: websites
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  url        :string(255)
#  feedUrl    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  feed_id    :integer
#

require 'nokogiri'
require "open-uri"

class Website < ActiveRecord::Base
  attr_accessible :name, :url, :feedUrl
  belongs_to :feed
  has_many :links, :foreign_key => "website_id", :dependent => :destroy

  #crawl website URL for mp3 links
  def crawl
    doc = Nokogiri::HTML(open(self.url))
    mp3_links = doc.xpath("//a").select { |link| link['href'] =~ /\.mp3$/ }
    mp3_links.each do |link|
      href = link['href']
      name = link.text

      new_link = Link.create
      new_link.file_name = name
      new_link.website_id = self.id
      new_link.url = href
      new_link.save
    end
  end
end
