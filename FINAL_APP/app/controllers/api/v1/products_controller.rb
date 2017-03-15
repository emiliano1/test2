class Api::V1::ProductsController < Api::V1::ApiController
	respond_to :json
	skip_before_filter :verify_authenticity_token

	def index
        @products = Product.all
        render :json=>{:success=>true ,product: @products}
    end
    
    #Show product
    def show
        @product = Product.find(params[:id])
        if @product.present?
        	render :json=>{:success=>true ,product: @product}
       	else
       		render :json=>{:success=>false,:message=>@product.errors}
       	end
    end

    #Search by height , length and width
    def search_product
    	@product = Product.any_of({:height=> params[:products][:height]}, { :length =>  params[:products][:length] },{ :width =>  params[:products][:width] })
    	if @product.present?
        	render :json=>{:success=>true ,product: @product}
       	else
       		render :json=>{:success=>false,:message=>@product.errors}
       	end
    	# @product = Product.find(params[:id])
    end
    
    #Create product 
    def create
        @product =  Product.new(params[:products].permit!)
        if @product.save
        	render :json=>{:success=>true ,product: @product,:message=>"Product are created!"}
       	else
       		render :json=>{:success=>false,:message=>@product.errors}
       	end
    end

    #Update a product  
    def update
        @product = Product.find(params[:id])
        if @product.update(params[:products])
        	render :json=>{:success=>true ,product: @product, :message=>"Updated sucessfully!"}
       	else
       		render :json=>{:success=>false,:message=>@product.errors}
       	end
    end
      
    #Delete product
    def destroy
        @product = Product.find(params[:id])
        if @product.destroy
        	render :json=>{:success=>true,product: @product, :message=>"deleted sucessfully!"}
       	else
       		render :json=>{:success=>false,:message=>@product.errors}
       	end
    end



end