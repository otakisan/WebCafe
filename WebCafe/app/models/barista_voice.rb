class BaristaVoice < ActiveRecord::Base
  scope :replyvoices, ->(voice_attribute) { where("counter_voice_attribute = ?", voice_attribute) }
  scope :barwelcomevoices, ->() { where("situation = 'barwelcome'") }
  scope :breakice, ->() { where("situation = 'silence'") }
end
