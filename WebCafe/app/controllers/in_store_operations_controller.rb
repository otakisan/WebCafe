require 'cafe/barista_voice_generator'
class InStoreOperationsController < ApplicationController
  include Cafe

  def entrance
    logger.debug("entrance here!")
    @CafeName = "(Store Name)"
  end

  def welcome
    #@welcome_voice = "Good Morning!"
    @welcome_voice = BaristaVoiceGenerator.new.getvoice
    @customer_name = params["customer_name"]
    @customer_voices = CustomerVoice.all
    logger.debug((@customer_name.nil? ? '' : @customer_name) + ", welcome here!")
  end

  def reply
    @customer_voice = params["customer_voice"]
    if @customer_voice then
      @customer_data = CustomerVoice.find(@customer_voice)
      if @custmer_data then
        logger.debug(@customer.voice)
      end
      logger.debug((@customer_voice ||= "")  + " was selected voice.")
#      if @customer_voice == '3' then
      if isnextformenu?(@customer_data.voice) then
        render 'menu'
      end
    end
  end

  def order
    today_repeat = session["today_repeat"]
    if !today_repeat then
      today_repeat = 0
    end
    session["today_repeat"] = today_repeat + 1

    logger.debug("today_repeat:" + today_repeat.to_s)

    @product_id = params["order_product"]
  end

  def isnextformenu?(voice)
    return voice.include?("Good")
  end
end
