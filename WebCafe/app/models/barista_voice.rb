class BaristaVoice < ActiveRecord::Base
  scope :replyvoices, ->(voice_attribute) { where("counter_voice_attribute = ?", voice_attribute).limit(1) }
end
