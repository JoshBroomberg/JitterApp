class Tweet < ActiveRecord::Base
  belongs_to :user
  include SimpleHashtag::Hashtaggable
end
