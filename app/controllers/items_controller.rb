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
    @item = @company.items.build(params.require(:item).permit(:name))
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
    respond_to do |format|
      if @item.update(company_items_params)
        format.html { redirect_to @item, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
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
