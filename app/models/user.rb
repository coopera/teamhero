class User < ActiveRecord::Base
  has_and_belongs_to_many :badges
  has_many :scores

  def self.create_from_omniauth(auth_hash)
    self.create(provider: auth_hash[:provider],
                uid: auth_hash[:uid],
                name: auth_hash[:info][:name],
                email: auth_hash[:info][:email],
                avatar: auth_hash[:info][:image],
                token: auth_hash[:credentials][:token],
                nickname: auth_hash[:info][:nickname])
  end
end
