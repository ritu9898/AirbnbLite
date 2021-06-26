class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
    @properties = Booking.where(user_id: current_user.id)
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
     @reviews = Review.where(property_id: params[:property_id])
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    # binding.pry

    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.property_id = params[:property_id]
    # binding.pry

     if @review.save
      redirect_to properties_path
     else
      render 'new'
     end

    # respond_to do |format|
    #   if @review.save
    #     format.html { redirect_to @review, notice: 'Review was successfully created.' }
    #     format.json { render :show, status: :created, location: @review }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @review.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    redirect_to new_property_review_path
    flash[:notice] = "Thanks for the review.:)"
    # respond_to do |format|
    #   format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:comment, :rating)
    end
end
