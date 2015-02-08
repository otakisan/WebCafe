class CustomerVoice < ActiveRecord::Base
  scope :welcomevoices, ->() { where("situation ='Welcome'") }
  scope :orderreactionreplys, ->() { where("situation ='OrderReactionReply'") }
  scope :replyvoices, ->(voice_attribute) { where("counter_voice_attribute = ?", voice_attribute) }
end
