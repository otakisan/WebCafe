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
    logger.debug((@customer_voice ||= "")  + " was selected voice.")
    if @customer_voice == '3' then
      render 'menu'
    end
  end
end
