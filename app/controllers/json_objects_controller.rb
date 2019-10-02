class JsonObjectsController < ApplicationController
  before_action :set_json_object, only: %i[show update destroy]

  # GET /json_objects
  def index
    @json_objects = JsonObject.all
    json_response(@json_objects)
  end

  # POST /json_objects
  def create
    data = request.raw_post
    @json_object = JsonObject.create!(json_string: data.chomp)
    json_response(@json_object, :created)
  end

  # GET /json_objects/:id
  def show
    json_response(@json_object)
  end

  # PUT /json_objects/:id
  # This requires to have the entire JSON object inserted into the update.
  # Would like this to update on described keys and values only.
  # Could probably use a hash merge?
  def update
    data = request.raw_post
    @json_object.update(json_string: data.chomp)
    head :no_content
  end

  # DELETE /json_objects/:id
  def destroy
    @json_object.destroy
    head :no_content
  end

  private

  def set_json_object
    @json_object = JsonObject.find(params[:id])
  end
end
