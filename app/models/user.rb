class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_one :profile
  has_many :tweets

  # follower_follows "names" the Follow join table for accessing through the follower association
  has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow" 
  # source: :follower matches with the belong_to :follower identification in the Follow model 
  has_many :followers, through: :follower_follows, source: :follower

  # followee_follows "names" the Follow join table for accessing through the followee association
  has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow"    
  # source: :followee matches with the belong_to :followee identification in the Follow model   
  has_many :followees, through: :followee_follows, source: :followee

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
   data = access_token.extra.raw_info 
   if user = User.where(:email => data.email).first 
   user 
   else 
   # Create a user with a stub password. 
    un = ""
    data.name.split.each do |name|
      un += name[0]
    end
    User.create!(:email => data.email, :password => Devise.friendly_token[0,20], username: un)
    end 
  end
end
