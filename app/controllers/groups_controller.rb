class GroupsController < ApplicationController
  
  before_filter :require_product, :only => [:create]
  before_filter :require_group, :only => [:spec, :update, :destroy]
   
  # NOTE: groups are responsible for updating their group_specs
  
  # POST /groups
  def create
    @group = @product.groups.new(params[:group])

    if @group.save
      # TODO: add in group specs
      @status = "good"
      @message = "Group was added successfully."
      serve_json_response
      return
    else
     render :json => @group.errors, :status => :unprocessable_entity
    end
  end



  # PUT /groups/1
  def update
    group_specs = params[:group_specs]
    
    # update existing group specs
    @group.group_specs.each do |spec|
      if group_specs[spec.id.to_s]
        spec.name = group_specs[spec.id.to_s]
        spec.save
      else
        # destroy the spec but what do we do about the matching item spec?
        #spec.destory
      end
    end if @group.group_specs
    
    # add new group specs
    new_specs = params[:new_specs]
    new_specs.each do |s|
      spec = @group.group_specs.build
      spec.name = s
      spec.save
    end if new_specs
    
    
    if @group.update_attributes(params[:group])
      @status = "good"
      @message = "Group was updated successfully."
      serve_json_response
    else
     render :json => @group.errors, :status => :unprocessable_entity
    end
    
    return
  end


  def spec
    spec = GroupSpec.where(
      :id => params[:spec_id],
      :group_id => @group.id
    )
    puts "WHATS SPEC"
    puts spec.class
    if spec
      spec.destroy(spec)
      @status = "good"
      @message = "Spec destroyed!"
      serve_json_response
    end
    return
  end

  # DELETE /groups/1
  # should not be able to destroy a group that has items in it.
  def destroy
    if @group.destroy
      @status = "good"
      @message = "Group was destroyed"
      serve_json_response
    else
     render :json => @group.errors, :status => :unprocessable_entity
    end
    
    
  end



end
