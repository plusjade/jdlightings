class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  def serve_json_response
    rsp = {}
    @status  ||= 'bad'
    @message ||= 'Oops! Please try again!'
    
    # hack: newly created resources will be "frozen" as a way to identify them.
    if @resource
      name = @resource.class.to_s.downcase
      h = @resource.attributes
      h["type"]  = @resource.frozen? ? 'new' : 'existing'
      h["image"] = @resource.avatar.url(:sm) if @resource.respond_to?(:avatar) && @resource.avatar?
      h["path"]  = self.send(name + "_path", @resource) if self.respond_to?(name + "_path")
      
      rsp[name] = h
    end  
    
    rsp["status"] = @status
    rsp["msg"]    = @message
          
    # remember this param should be added with js.
    if params["is_ajax"]
      # respond to ajaxForm in hidden iframe (not xhr but still js)
      render :text => "<textarea>#{rsp.to_json}</textarea>"
    else
      render :json => rsp
    end
  end
    

  def require_product
    # todo , make sure id is from the product controller tho =x
    id = params[:product_id] ? params[:product_id].to_i : params[:id]
    @product = Product.find_by_id(id)
    if @product.nil?
      @message = "Need a product"
      serve_json_response
      return
    end
  end
  
  def require_group
    # todo , make sure id is from the group controller tho =x
    id = params[:group_id] ? params[:group_id].to_i : params[:id] 
    @group = Group.find_by_id(id)
    if @group.nil?
      @status = "good"
      @message = "Need a group"
      serve_json_response
      return
    end
  end
  

  
    
end
