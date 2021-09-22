class User < ApplicationRecord
  has_many :kernel_configs
  has_many :kernel_sources
  has_many :kernel_builds
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["name"]
    end
  end
end
