class Admin::OrdersController < Admin::BaseController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /admin/orders
  # GET /admin/orders.json
  def index
    @orders = Order.all
  end

  # GET /admin/orders/1
  # GET /admin/orders/1.json
  def show
     @order = Order.find(params[:id])
  end

  # GET /admin/orders/new
  def new
    @order = Order.new
  end

  # GET /admin/orders/1/edit
  def edit
    @order = Order.find(params[:id])
    # @user = User.find(params[:Order.user_id])
  end

  # POST /admin/orders
  # POST /admin/orders.json
  def create
    @order = Order.new(admin_order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/orders/1
  # PATCH/PUT /admin/orders/1.json
  def update
    respond_to do |format|
      if @order.update(admin_order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/orders/1
  # DELETE /admin/orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to admin_orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.fetch(:order, {})
    end
end
