class TagsController < ApplicationController
  def new
    @tag=params[:tag]
    respond_to do |format|
        format.js
    end
  end
  
  def index
    @tag=params[:q]
    @tags=Tag.where('name LIKE ?', "%#{@tag}%")
    
    ActiveRecord::Base.include_root_in_json = false
    json= @tags.to_json(:only =>  [:id,:name])
    json=json.gsub(/id/, "value")
     
    respond_to do |format|
        format.json { render :json =>  json}
    end
  end
end
