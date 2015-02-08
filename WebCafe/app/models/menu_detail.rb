class MenuDetail < ActiveRecord::Base
  belongs_to :menu
  belongs_to :product
end
