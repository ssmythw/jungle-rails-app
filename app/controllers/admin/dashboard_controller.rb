class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']
  
  def show
    @totalProducts = Product.all.count()
    @totalCategories = Category.all.count()
  end
end
