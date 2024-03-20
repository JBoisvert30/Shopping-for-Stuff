class ApplicationController < ActionController::Base
  before_action :initialize_session,:increment_visit_count
  helper_method :cart
  helper_method :visit_count
  helper_method :item_quantity

  def initialize_session
    # this will initialize shopping cart
    session[:visit_count] ||= 0
    session[:shopping_cart] ||= {} # empty array of product IDs
  end

  def visit_count
    session[:visit_count]
  end

  def increment_visit_count
    session[:visit_count] += 1
  end

  def cart
    Product.find(session[:shopping_cart].keys) # pass an array of ids and we get back a collection of products
  end

  def item_quantity(id)
    session[:shopping_cart][id.to_s]
  end
end
