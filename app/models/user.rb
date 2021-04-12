class User < ApplicationRecord

  validates :email, presence: true, uniqueness: true, format: { with: /.+\@.+\..+/ }
  validates :password, presence: true, confirmation: true

  before_create :encrypt_password

  def self.login(params)
    email = params[:email]
    password = params[:password]

    salted_pwd = salted(password)
    encrypted_pwd = encrypted(salted_pwd)

    find_by(email: email, password: encrypted_pwd)
  end

  
  private
  # 在加密前，先幫密碼加點料，目的是為了拖延駭客解碼的時間
  def salted(password)
    "abc#{password}123"
  end
  
  def encrypted(password)
    Digest::SHA1.hexdigest(password)
  end

  def encrypt_password
    require 'digest'
    salted_pwd = salted(password)
    self.password = encrypted(salted_pwd)
    # self.password = Digest::SHA1.hexdigest(self.password)
    # self.password = Digest::SHA1.hexdigest(password)
  end


end
