class User < ApplicationRecord
  
  validates :email, presence: true, uniqueness: true, format: { with: /.+\@.+\..+/ }
  validates :password, presence: true, confirmation: true
  
  before_create :encrypt_password
  
  module Jiami
    require 'digest'

    # 在加密前，先幫密碼加點料，目的是為了拖延駭客解碼的時間
    def self.salt(password, head = 'abc', tail = '123')
      "#{head}#{password}#{tail}"
    end
    
    def self.encrypt(password)
      Digest::SHA1.hexdigest(password)
    end
  end


  def self.login(params)
    email = params[:email]
    password = params[:password]

    salted_pwd = Jiami.salt(password)
    encrypted_pwd = Jiami.encrypt(salted_pwd)

    find_by(email: email, password: encrypted_pwd)
  end

  
  private
  def encrypt_password
    salted_pwd = Jiami.salt(password)
    self.password = Jiami.encrypt(salted_pwd)
    # self.password = Digest::SHA1.hexdigest(self.password)
    # self.password = Digest::SHA1.hexdigest(password)
  end


end
