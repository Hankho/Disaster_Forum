class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  ADMIM_EMAIL_LIST = ["hankhe@gmail.com"]  #用陣列包起來是因為可能不只一筆，可以一直加

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

    has_many :disasters, dependent: :destroy
    has_many :messages, dependent: :destroy


  scope :normal, -> { where.not(:email => ADMIM_EMAIL_LIST) }

  before_destroy :deletable?
  
    def admin?            #辨識使用者是否有admin權限
      self.email.in? ADMIM_EMAIL_LIST
    end

    def short_name
    	self.email.split("@").first
    end

    def self.from_omniauth(auth)
     # Case 1: Find existing user by facebook uid
     user = User.find_by_fb_uid( auth.uid )
     if user
        user.fb_token = auth.credentials.token
        #user.fb_raw_data = auth
        user.save!
       return user
     end

     # Case 2: Find existing user by email
     existing_user = User.find_by_email( auth.info.email )
     if existing_user
       existing_user.fb_uid = auth.uid
       existing_user.fb_token = auth.credentials.token
       #existing_user.fb_raw_data = auth
       existing_user.save!
       return existing_user
     end

     # Case 3: Create new password
     user = User.new
     user.fb_uid = auth.uid
     user.fb_token = auth.credentials.token
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
     #user.fb_raw_data = auth
     user.save!
     return user
   end

   def deletable?
    throw(:abort) if admin?
   end

end
