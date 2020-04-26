class JoinListingsController < ApplicationController
  before_action :set_join_listing, only: [:show, :edit, :update, :destroy]

  # GET /join_listings
  # GET /join_listings.json
  def index
    @join_listings = JoinListing.all
  end

  # GET /join_listings/1
  # GET /join_listings/1.json
  def show
  end

  # GET /join_listings/new
  def new
    @join_listing = JoinListing.new
  end

  # GET /join_listings/1/edit
  def edit
  end

  # POST /join_listings
  # POST /join_listings.json
  def create
    @join_listing = JoinListing.new(join_listing_params)

    respond_to do |format|
      if @join_listing.save
        format.html { redirect_to @join_listing, notice: 'Join listing was successfully created.' }
        format.json { render :show, status: :created, location: @join_listing }
      else
        format.html { render :new }
        format.json { render json: @join_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /join_listings/1
  # PATCH/PUT /join_listings/1.json
  def update
    respond_to do |format|
      if @join_listing.update(join_listing_params)
        format.html { redirect_to @join_listing, notice: 'Join listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @join_listing }
      else
        format.html { render :edit }
        format.json { render json: @join_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /join_listings/1
  # DELETE /join_listings/1.json
  def destroy
    @join_listing.destroy
    respond_to do |format|
      format.html { redirect_to join_listings_url, notice: 'Join listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_join_listing
      @join_listing = JoinListing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def join_listing_params
      params.require(:join_listing).permit(:user_id, :item_id, :selling, :amount_min, :amount_max, :start_date, :end_date)
    end
end
