class InStoreOperationsController < ApplicationController
  def entrance
    logger.debug("entrance here!")
    @CafeName = "(Store Name)"
  end

  def welcome
    @customer_name = params["customer_name"]
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
