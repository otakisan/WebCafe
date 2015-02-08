class Menu < ActiveRecord::Base
  has_many :menu_details
  scope :nowonsale, ->(today) { where("start_at < ? and ? < end_at", today, today).limit(1) }
end
