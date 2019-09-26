class Admin::ProductsController < Admin::BaseController
    def index
        @products = Product.all 
    end
    
    def create
        # render plain: params[:product].inspect
        @product = Product.new(product_params)
        @product.save
       
        
        if @product.save 
            # do something
            flash[:notice] = "Product was successfully created"
            redirect_to edit_admin_product_path(@product)
        else
           render 'new' 
        end

        # respond_to do |format|
        #   if @product.save
        #     format.html { redirect_to @product, notice: 'Product was successfully created.' }
        #     format.json { render :show, status: :created, location: @product }
        #   else
        #     format.html { render :new }
        #     format.json { render json: @product.errors, status: :unprocessable_entity }
        #   end
        # end
    end
    
    def new
        @product = Product.new
    end
    
    def edit
        @product = Product.find(params[:id])
    end
    
    def show
        @product = Product.find(params[:id])
    end
    
    def update
        
    end
    
    def destroy
        
    end
    
    private
    # define the product_params
        def product_params
            params.require(:product).permit(:name, :description, :price, :stock, :image, :artist_name, :sku)
        end
end
