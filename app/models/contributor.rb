class Contributor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]


   def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |contributor|
     contributor.email = auth.info.email
     contributor.password = Devise.friendly_token[0,20]
    #  contributor.name = auth.info.name   # assuming the user model has a name
    #  contributor.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |contributor|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        contributor.email = data["email"] if contributor.email.blank?
      end
    end
  end
end
