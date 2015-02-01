class InStoreOperationsController < ApplicationController
  def entrance
    logger.debug("entrance here!")
    @CafeName = "(Store Name)"
  end

  def welcome
    @customer_name = params["customer_name"]
    logger.debug(@customer_name + ", welcome here!")
  end
end
