require 'cafe/barista_voice_generator'
class InStoreOperationsController < ApplicationController
  include Cafe

  def entrance
    logger.debug("entrance here!")
    @CafeName = "(Store Name)"
  end

  def welcome
    today_repeat = gettodayrepeat()
    @welcome_voice = BaristaVoiceGenerator.new.welcomevoice(today_repeat)
    @customer_name = params["customer_name"]
    @customer_voices = CustomerVoice.welcomevoices
    logger.debug((@customer_name.nil? ? '' : @customer_name) + ", welcome here!")
  end

  def reply
    customer_voice_id = params["customer_voice"]
    if customer_voice_id then
      @customer_voice = CustomerVoice.find(customer_voice_id)
      if @custmer_voice then
        logger.debug(@customer_voice.voice)
      end

      logger.debug((@customer_voice_id ||= "")  + " was selected voice.")
      barista_voices = BaristaVoice.replyvoices(@customer_voice.voice_attribute)
      if barista_voices.size > 0 then
        @barista_voice = barista_voices.offset(rand(barista_voices.size)).first
      end

      if isnextformenu?(@customer_voice.voice) then
        @order_styles = [["For here", "forhere"],["To go", "togo"]]
        getproducts
        render 'menu'
      else
        if @barista_voice then
          @customer_voices = CustomerVoice.replyvoices(@barista_voice.voice_attribute)
          if !@customer_voices || @customer_voices.size == 0 then
            @customer_voices = CustomerVoice.breakice
          end 
        end
      end
    end
  end

  def order
    incrementtodayrepeat

    product_id = params["order_product"]
    if product_id then
      product = Product.find(product_id)
    end

    @product_name = ""
    if product then
      @product_name = product.name
    end

    @orderreactionreplys = CustomerVoice.orderreactionreplys 
  end

  def afterorder
    req_customer_voice = customervoicefromqueryparameters
    @barista_voice = baristavoice(req_customer_voice) 
    @customer_voices = customervoices(@barista_voice) 
  end

  def bar
    barista_voices = BaristaVoice.barwelcomevoices
    @barista_voice = choiceonerecord(barista_voices)

    #req_customer_voice = customervoicefromqueryparameters
    #@barista_voice = baristavoice(req_customer_voice) 
    @customer_voices = customervoices(@barista_voice) 
    return @customer_voices ||= []
  end

  def talkatbar
    req_customer_voice = customervoicefromqueryparameters
    @barista_voice = baristavoice(req_customer_voice) 
    @customer_voices = customervoices(@barista_voice) 
    logger.debug("(talkatbar) barista:" + (@barista_voice.nil? ? "(nil)" : @barista_voice.voice))

    reqcv = req_customer_voice.nil? ? "" : req_customer_voice.voice
    if isnextfordelivery?(reqcv) then
      render 'delivery'
    end
  end

  def delivery
    req_customer_voice = customervoicefromqueryparameters
    @barista_voice = baristavoice(req_customer_voice) 
    @customer_voices = customervoices(@barista_voice) 
  end

  def seeoff
    req_customer_voice = customervoicefromqueryparameters
    @barista_voice = baristavoice(req_customer_voice) 
    #@customer_voices = customervoices(@barista_voice) 
  end

  def isnextfordelivery?(voice)    
    return voice.include?("Thank")
  end

  def customervoicefromqueryparameters
    customer_voice_id = params["customer_voice"]
    if customer_voice_id then
      customer_voice = CustomerVoice.find(customer_voice_id)
      if customer_voice then
        logger.debug("get cv :" + customer_voice.voice)
      end
    end
    return customer_voice
  end

  def baristavoice(customer_voice)
    if customer_voice then
      barista_voices = BaristaVoice.replyvoices(customer_voice.voice_attribute)
      if barista_voices.size > 0 then
        barista_voice = barista_voices.offset(rand(barista_voices.size)).first
        logger.debug("barista:" + barista_voice.voice)
      end
    else
      barista_voice = choiceonerecord(BaristaVoice.breakice)
    end
    return barista_voice 
  end

  def choiceonerecord(activerecord_relation)
    if activerecord_relation != nil && activerecord_relation.size > 0 then
      activerecord = activerecord_relation.offset(rand(activerecord_relation.size)).first
    end
  end

  def customervoices(barista_voice)
    if barista_voice then
      logger.debug("from barista: " + barista_voice.voice + " attr:" + barista_voice.voice_attribute)
      customer_voices = CustomerVoice.replyvoices(barista_voice.voice_attribute)
      if !customer_voices || customer_voices.size == 0 then
        customer_voices = CustomerVoice.breakice
      end 
    end
    return customer_voices 
  end

  def incrementtodayrepeat
    session["today_repeat"] = gettodayrepeat + 1
  end

  def gettodayrepeat
    today_repeat = session["today_repeat"]
    if !today_repeat then
      today_repeat = 0
    end

    logger.debug("today_repeat:" + today_repeat.to_s)
    return today_repeat
  end

  def isnextformenu?(voice)
    return voice.include?("Thank")
  end

  def getproducts
    today = gettoday
    menus_result = Menu.nowonsale(today)
    logger.debug("get products : " + menus_result.size.to_s)

    @menu_details = []
    if menus_result.size > 0 then
      logger.debug("menu details : " + menus_result.first.menu_details.first.product.name.to_s)
      # 強引なかんじだけど、これでいいらしい 
      @menu_details = menus_result.first.menu_details.map{ |detail| [detail.product.name, detail.product.id]}
    end
  end

  def gettoday
    #Date.today
    return Date::new(2015, 2, 16)
  end
end
