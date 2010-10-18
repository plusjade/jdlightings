class ItemsController < ApplicationController

  before_filter :require_group, :only => [:create, :update]
  
  # NOTE: items are responsible for updating their item.specs
  
  # POST /items
  def create
    @item = @group.items.new(params[:item])
    
    if @item.save
      item_specs = params[:specs]

      @group.group_specs.each do |gspec|
        spec = @item.specs.build
        spec.group_spec_id = gspec.id
        spec.value = item_specs[gspec.id.to_s]
        spec.save
      end if item_specs
      
      @status = "good"
      @message = "Item added!"
      serve_json_response
    else
     render :json => @item.errors, :status => :unprocessable_entity
    end
  end



  # PUT /items/1
  def update
    @item = Item.find(params[:id])
    item_specs = params[:specs]

    # TODO: optimize this:
    @group.group_specs.each do |gspec|
      spec = @item.specs.find_by_group_spec_id(gspec.id)
      if spec.nil?
        spec = @item.specs.build
        spec.group_spec_id = gspec.id
      end  
      spec.value = item_specs[gspec.id.to_s]
      spec.save
    end if item_specs


    if @item.update_attributes(params[:item])
      @status = "good"
      @message = "Item updated!"
      serve_json_response
    else
     render :json => @item.errors, :status => :unprocessable_entity
    end
    
  end


  # DELETE /items/1
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.xml  { head :ok }
    end
  end
  
  
    
    
end
