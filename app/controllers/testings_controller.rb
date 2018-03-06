class TestingsController < ApplicationController
    before_action :set_testing, only: [:show, :edit, :update, :destroy, :toggle_status]
    access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, site_admin: :all

  def index
    @testings = Testing.all
  end
  def new
    @testing = Testing.new
  end

  def show
    if logged_in?(:site_admin) || @testing.published?
      @testing = Testing.includes(:comments)
    else
      redirect_to testings_path, notice: "You are not authorized to access this page"
    end
  end

  def edit
  end

  

  def destroy
    @testing.destroy
    if @testing.destroy
      redirect_to testings_path
    end
  end

  def create
    @testing = Testing.new(testing_params)

    respond_to do |format|
      if @testing.save
        format.html { redirect_to testing_path(@testing[:id]), notice: 'Your post is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
  @testing = Testing.new(testing_params)

    respond_to do |format|
      if @testing.save
        format.html { redirect_to testing_path(@testing[:id]), notice: 'Your post has been updated.' }
      else
        format.html { render :new }
      end
    end
  end


  private 

  def set_testing
      @testing = Testing.find(params[:id])
    end
    
    def testing_params
      params.require(:testing).permit(:title, :body)
    end
  end