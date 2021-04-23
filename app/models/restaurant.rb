class Restaurant < ApplicationRecord
  validates :title, presence: true
  
  belongs_to :user
  has_many :comments

  # scope :available, -> { where(deleted_at: nil) }
  # scope :deleted, -> { where.not(deleted_at: nil) }
  
  
  # alias really_destroy destroy

  # def destroy
  #   update(deleted_at: Time.now)
  # end
  
  # def really_destroy!
	# 	# self.class.superclass.instance_method(:destroy).bind(self).call
  #   # kitty的class的上層class的實體方法>把自己綁進去(才知道要刪誰)>再呼叫方法
  #   really_destroy
	# end

  # = gem paranoia 的功能 (軟刪除)
end
