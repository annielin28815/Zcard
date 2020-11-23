class User < ApplicationRecord

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /[\w]+@([\w-]+\.)+[\w-]{2,4}/ }
  validates :password, presence: true,
                       confirmation: true,
                       length: { minimum: 4 }
  validates :nickname, presence: true

  before_create :encrypt_password

  has_many :posts

  # 是一個類別方法，後面的user可以隨意更換
  def self.login(user)
    pw = Digest::SHA1.hexdigest("a#{user[:password]}z")
    User.find_by(email: user[:email],password: pw)
  end

  private
  def encrypt_password
    # 頭尾加az，是一種灑鹽加密法 https://zh.wikipedia.org/wiki/%E7%9B%90_(%E5%AF%86%E7%A0%81%E5%AD%A6)
    self.password = Digest::SHA1.hexdigest("a#{self.password}z")
  end

end
