class QueueListToUsersController < ApplicationController
  before_action :set_queue_list_to_user, only: [:show, :edit, :update, :destroy]

  # GET /queue_list_to_users
  # GET /queue_list_to_users.json
  def index
    @queue_list_to_users = QueueListToUser.all
  end

  # GET /queue_list_to_users/1
  # GET /queue_list_to_users/1.json
  def show
  end

  # GET /queue_list_to_users/new
  def new
    @queue_list_to_user = QueueListToUser.new
  end

  # GET /queue_list_to_users/1/edit
  def edit
  end

  # POST /queue_list_to_users
  # POST /queue_list_to_users.json
  def create
    @queue_list_to_user = QueueListToUser.new(queue_list_to_user_params)

    respond_to do |format|
      if @queue_list_to_user.save
        format.html { redirect_to @queue_list_to_user, notice: 'Queue list to user was successfully created.' }
        format.json { render :show, status: :created, location: @queue_list_to_user }
      else
        format.html { render :new }
        format.json { render json: @queue_list_to_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /queue_list_to_users/1
  # PATCH/PUT /queue_list_to_users/1.json
  def update
    respond_to do |format|
      if @queue_list_to_user.update(queue_list_to_user_params)
        format.html { redirect_to @queue_list_to_user, notice: 'Queue list to user was successfully updated.' }
        format.json { render :show, status: :ok, location: @queue_list_to_user }
      else
        format.html { render :edit }
        format.json { render json: @queue_list_to_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /queue_list_to_users/1
  # DELETE /queue_list_to_users/1.json
  def destroy
    @queue_list_to_user.destroy
    respond_to do |format|
      format.html { redirect_to queue_list_to_users_url, notice: 'Queue list to user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_queue_list_to_user
      @queue_list_to_user = QueueListToUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def queue_list_to_user_params
      params.require(:queue_list_to_user).permit(:queue_id, :user_id)
    end
end
