class SubCatsController < ApplicationController
  before_action :set_sub_cat, only: [:show, :edit, :update, :destroy]

  # GET /sub_cats
  # GET /sub_cats.json
  def index
    @sub_cats = SubCat.all
  end

  # GET /sub_cats/1
  # GET /sub_cats/1.json
  def show
  end

  # GET /sub_cats/new
  def new
    @sub_cat = SubCat.new
  end

  # GET /sub_cats/1/edit
  def edit
  end

  # POST /sub_cats
  # POST /sub_cats.json
  def create
    @sub_cat = SubCat.new(sub_cat_params)

    respond_to do |format|
      if @sub_cat.save
        format.html { redirect_to @sub_cat, notice: 'Sub cat was successfully created.' }
        format.json { render :show, status: :created, location: @sub_cat }
      else
        format.html { render :new }
        format.json { render json: @sub_cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_cats/1
  # PATCH/PUT /sub_cats/1.json
  def update
    respond_to do |format|
      if @sub_cat.update(sub_cat_params)
        format.html { redirect_to @sub_cat, notice: 'Sub cat was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_cat }
      else
        format.html { render :edit }
        format.json { render json: @sub_cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_cats/1
  # DELETE /sub_cats/1.json
  def destroy
    @sub_cat.destroy
    respond_to do |format|
      format.html { redirect_to sub_cats_url, notice: 'Sub cat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_cat
      @sub_cat = SubCat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_cat_params
      params.require(:sub_cat).permit(:cat_id, :name, :status)
    end
end
