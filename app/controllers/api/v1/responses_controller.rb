class ResponsesController < ApplicationController
  before_action :set_response, only: %i[ show update destroy ]

  # GET /responses
  def index
    @responses = Response.all

    render json: @responses
  end

  # GET /responses/1
  def show
    render json: @response
  end

  # POST /responses
  def create
    @response = Response.new(response_params)

    if @response.save
      render json: @response, status: :created, location: api_v1_post_path(@post)
    else
      render json: @response.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /responses/1
  def update
    if @response.update(response_params)
      render json: @response
    else
      render json: @response.errors, status: :unprocessable_entity
    end
  end

  # DELETE /responses/1
  def destroy
    @response.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def response_params
      params.require(:response).permit(:title, :content)
    end
end
