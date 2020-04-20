class QueueListsController < ApplicationController
  before_action :set_queue_list, only: [:show, :edit, :update, :destroy]

  # GET /queue_lists
  # GET /queue_lists.json
  def index
    @queue_lists = QueueList.all
  end

  # GET /queue_lists/1
  # GET /queue_lists/1.json
  def show
  end

  # GET /queue_lists/new
  def new
    @queue_list = QueueList.new
  end

  # GET /queue_lists/1/edit
  def edit
  end

  # POST /queue_lists
  # POST /queue_lists.json
  def create
    @queue_list = QueueList.new(queue_list_params)

    respond_to do |format|
      if @queue_list.save
        format.html { redirect_to @queue_list, notice: 'Queue list was successfully created.' }
        format.json { render :show, status: :created, location: @queue_list }
      else
        format.html { render :new }
        format.json { render json: @queue_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /queue_lists/1
  # PATCH/PUT /queue_lists/1.json
  def update
    respond_to do |format|
      if @queue_list.update(queue_list_params)
        format.html { redirect_to @queue_list, notice: 'Queue list was successfully updated.' }
        format.json { render :show, status: :ok, location: @queue_list }
      else
        format.html { render :edit }
        format.json { render json: @queue_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /queue_lists/1
  # DELETE /queue_lists/1.json
  def destroy
    @queue_list.destroy
    respond_to do |format|
      format.html { redirect_to queue_lists_url, notice: 'Queue list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_queue_list
      @queue_list = QueueList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def queue_list_params
      params.require(:queue_list).permit(:max_users, :allowed_users, :start_time, :end_time)
    end
end
