class CartController < ApplicationController
  def create
    logger.debug("Adding #{params[:id]} to cart.")
    id = params[:id].to_i
    session[:shopping_cart][id.to_s] ||= 0
    session[:shopping_cart][id.to_s] += 1 # add one to the count for this id
    product = Product.find(id)
    flash[:notice] = "✚ #{product.name} added to cart."
    redirect_to root_path
  end

  def destroy
    # remove params[:id] from cart
    id = params[:id].to_i
    session[:shopping_cart].delete(id.to_s)
    #session[:shopping_cart][id.to_s] -= 1 # add one to the count for this id
    product = Product.find(id)
    flash[:notice] = "− #{product.name} removed from cart...."
    redirect_to root_path
  end
end
