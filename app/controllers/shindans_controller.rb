class ShindansController < ApplicationController
  before_action :set_shindan, only: [:show, :edit, :update, :destroy]

  # GET /shindans
  # GET /shindans.json
  def index
    @shindans = Shindan.order('id DESC').limit(10).all
  end

  # GET /shindans/1
  # GET /shindans/1.json
  def show
  end

  # GET /shindans/new
  def new
    @shindan = Shindan.new
  end

  # GET /shindans/1/edit
  def edit
    @shindan = Shindan.find params[:id]
  end

  # POST /shindans
  # POST /shindans.json
  def create
    # @shindan = Shindan.new(shindan_params)
    #
    # respond_to do |format|
    #   if @shindan.save
    #     format.html { redirect_to @shindan, notice: 'Shindan was successfully created.' }
    #     format.json { render :show, status: :created, location: @shindan }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @shindan.errors, status: :unprocessable_entity }
    #   end
    # end
    render plain params[:shindan].inspect
  end

  # PATCH/PUT /shindans/1
  # PATCH/PUT /shindans/1.json
  def update
    respond_to do |format|
      if @shindan.update(shindan_params)
        format.html { redirect_to @shindan, notice: 'Shindan was successfully updated.' }
        format.json { render :show, status: :ok, location: @shindan }
      else
        format.html { render :edit }
        format.json { render json: @shindan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shindans/1
  # DELETE /shindans/1.json
  def destroy
    @shindan.destroy
    respond_to do |format|
      format.html { redirect_to shindans_url, notice: 'Shindan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shindan
      @shindan = Shindan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shindan_params
      params.require(:shindan).permit(:title)
    end
end
