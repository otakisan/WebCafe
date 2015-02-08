module Cafe
  class BaristaVoiceGenerator
    def getvoice
      'barista voice !'
    end

    def welcomevoice(today_repeat)
      isrev = self.isrevisit?(today_repeat)
      # ただのクラスにloggerはない
      #logger.debug("isrev:" + isrev)
      voice = "Thank you for coming."
      if isrev then
        voice = "Glad to see you again !"
      end

      return voice
    end

    def isrevisit?(today_repeat)
      #today_repeat = session['today_repeat']
      return today_repeat > 0
    end

    def generalvoice
    end
  end
end
