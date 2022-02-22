class Public::ItemsController < ApplicationController

  def index
    @item = @admin.name
  end

  def show
  end
end
