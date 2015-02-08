class CustomerVoice < ActiveRecord::Base
  scope :welcomevoices, ->() { where("situation ='Welcome'") }
  scope :orderreactionreplys, ->() { where("situation ='OrderReactionReply'") }
end
