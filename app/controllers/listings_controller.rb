class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy purchase ]
  before_action :authenticate_user!, only: %i[ new edit update destroy purchase ]
  before_action :authorise_action, only: %i[ edit update destroy ] 

  # GET /listings or /listings.json
  def index
    # loads all listings
    @listings = Listing.all
  end

  # GET /listings/1 or /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    @listing = Listing.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # GET /listings/1/purchase
  def purchase
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      # loads the listing identified by param id
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:name, :price, :category, :console_compatibility, :functional_condition, :cosmetic_condition, :description, :user_id, :image)
    end

    # Only allows the action on a listing if the current user is the listing's creator
    def authorise_action
      unless @listing.user == current_user
        redirect_to listings_path, alert: "You do not have permission to perform this action."
      end
    end
    
end