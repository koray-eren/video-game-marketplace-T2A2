class OrdersController < ApplicationController
    before_action :order_params
    before_action :find_order, only: %i[ show ]
    before_action :authenticate_user!
    
    # get /orders
    def index
        @orders = Order.all.eager_load(:user, :listing)
    end

    # get /orders/:id
    def show
    end

    # POST /orders
    def create
        @order = Order.new(user_id: params[:user_id], listing_id: params[:listing_id])

        if @order.save
            redirect_to @order, notice: "Order was successfully created."
        else
            redirect_to :root, notice: "Error, this item could not be purchased."
        end
    end

    private
        # Not required for order, but rails requires presence
        def order_params 
        end
        
        # find the order object based on id param
        def find_order
            @order = Order.eager_load(:user, :listing).find(params[:id])
        end
end