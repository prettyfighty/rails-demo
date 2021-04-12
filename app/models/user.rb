class User < ApplicationRecord

  validates :email, presence: true, uniqueness: true, format: { with: /.+\@.+\..+/ }
  validates :password, presence: true, confirmation: true

  before_create :encrypt_password


  private
  # 在加密前，先幫密碼加點料，目的是為了拖延駭客解碼的時間
  def salted_pwd
    "abc#{self.password}123"
  end

  def encrypt_password
    require 'digest'
    self.password = Digest::SHA1.hexdigest(salted_pwd)
    # self.password = Digest::SHA1.hexdigest(self.password)
    # self.password = Digest::SHA1.hexdigest(password)
  end

end
