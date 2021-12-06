class Api::CheckItemsController < ApplicationController
  def index
    @check_items = CheckItem.all
    render json: @check_items
  end
end
