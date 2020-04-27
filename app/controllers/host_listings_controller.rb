class HostListingsController < ApplicationController
  before_action :set_host_listing, only: [:show, :edit, :update, :destroy]

  # GET /host_listings
  # GET /host_listings.json
  def index
    @host_listings = current_user.host_listings.all
  end

  # GET /host_listings/1
  # GET /host_listings/1.json
  def show
  end

  # GET /host_listings/new
  def new
    @host_listing = HostListing.new
  end

  # GET /host_listings/1/edit
  def edit
  end

  # POST /host_listings
  # POST /host_listings.json
  def create
    @host_listing = HostListing.new(host_listing_params)

    respond_to do |format|
      if @host_listing.save
        format.html { redirect_to @host_listing, notice: 'Host listing was successfully created.' }
        format.json { render :show, status: :created, location: @host_listing }
      else
        format.html { render :new }
        format.json { render json: @host_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /host_listings/1
  # PATCH/PUT /host_listings/1.json
  def update
    respond_to do |format|
      if @host_listing.update(host_listing_params)
        format.html { redirect_to @host_listing, notice: 'Host listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @host_listing }
      else
        format.html { render :edit }
        format.json { render json: @host_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /host_listings/1
  # DELETE /host_listings/1.json
  def destroy
    @host_listing.destroy
    respond_to do |format|
      format.html { redirect_to host_listings_url, notice: 'Host listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host_listing
      @host_listing = HostListing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def host_listing_params
      params.require(:host_listing).permit(:user_id, :item_id, :selling, :amount, :start_date, :end_date, :max_users, :allowed_users)
    end
end
