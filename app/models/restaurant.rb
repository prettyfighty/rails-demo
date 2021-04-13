class Restaurant < ApplicationRecord

  validates :title, presence: true

  scope :available, -> { where(deleted_at: nil) }
  scope :deleted, -> { where.not(deleted_at: nil) }

  def destroy
    update(deleted_at: Time.now)
  end

  def really_destroy!
		super.destroy
	end

  # = gem paranoia 的功能 (軟刪除)
end
