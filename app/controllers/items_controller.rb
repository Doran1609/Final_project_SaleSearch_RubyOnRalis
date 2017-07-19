class ItemsController < ApplicationController
 
 
# GET /companies/1/items
  def index
    # For URL like /companies/1/items
    # Get the company with id=1
    @company = Company.find(params[:company_id])
    # Access all items for that company
    @items = @company.items
    
  end
  
  


# GET /companies/1/items/2
  def show
    @company = Company.find(params[:company_id])
    # For URL like /companies/1/items/2
    # Find an item in companies 1 that has id=2
    @item = @company.items.find(params[:id])
  end

# GET /companies/1/items/new
  def new
    @company = Company.find(params[:company_id])
    # Associate an item object with company 
    @item = @company.items.build
  end
  
# POST /companies/1/items
  def create
    @company = Company.find(params[:company_id])
    # For URL like /companies/1/items
    # Populate an item associate with company 1 with form data
    # Company will be associated with the Item
    # @item = @company.items.build(params.require(:item).permit!)
    @item = @company.items.build(params.require(:item).permit(:name, :image, :description, :price, :category, :specification))
      if @item.save
        # Save the item successfully
        redirect_to company_item_url(@company, @item)
      else
      render :action => "new"
      end
  end


# GET /movies/1/reviews/2/edit
  def edit
    @company = Company.find(params[:company_id])
    # For URL like /companies/1/items/2/edit
    # Get item id=2 for company 1
    @item = @company.items.find(params[:id])
  end

# PUT /companies/1/items/2
  def update
    @company = Company.find(params[:company_id])
    @item = Item.find(params[:id])
    if @item.update_attributes(params.require(:item).permit(:name, :image, :specification, :category, :price))
    # Save the review successfully
    redirect_to company_item_url(@company, @item)
    else
      render :action => "edit"
    end
  end

  
# DELETE /companies/1/items/2
  def destroy
    @company = Company.find(params[:company_id])
    @item = Item.find(params[:id])
    @item.destroy
    
    respond_to do |format|
      format.html { redirect_to company_items_path(@company) }
      format.xml { head :ok }
    end
  end

end
