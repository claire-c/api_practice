# frozen_string_literal: true

class BicyclesController < ApplicationController
  before_action :set_bicycle, only: %i[show update destroy]

  # GET /bicycles
  def index
    @bicycles = Bicycle.all
    json_response(@bicycles)
  end

  # POST /bicycles
  def create
    @bicycle = Bicycle.create!(bicycle_params)
    json_response(@bicycle, :created)
  end

  # GET /bicycles/:id
  def show
    json_response(@bicycle)
  end

  # PUT /bicycles/:id
  def update
    @bicycle.update(bicycle_params)
    head :no_content
  end

  # DELETE /bicycles/:id
  def destroy
    @bicycle.destroy
    head :no_content
  end

  private

  def bicycle_params
    params.permit(:colour, :bicycle_type, :tyre_width, :brand)
  end

  def set_bicycle
    @bicycle = Bicycle.find(params[:id])
  end
end
