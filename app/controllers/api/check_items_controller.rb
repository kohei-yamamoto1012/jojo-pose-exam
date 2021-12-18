class Api::CheckItemsController < ApplicationController
  def index
    @check_items = CheckItem.all
    # render json: @check_items # ここ修正
    render json: CheckItemResource.new(@check_items).serialize
  end
end
