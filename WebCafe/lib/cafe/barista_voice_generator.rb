module Cafe
  class BaristaVoiceGenerator
    def getvoice
      'barista voice !'
    end

    def welcomevoice
      isrev = self.isrevisit
      logger.debug("isrev:" + isrev)
      voice = "Thank you for coming."
      if isrev then
        voice = "Glad to see you again !"
      end

      return voice
    end

    def isrevisit
      today_repeat = session['today_repeat']
      return today_repeat > 0
    end
  end
end
