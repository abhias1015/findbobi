class BusinessesController < InheritedResources::Base

  def home
  end

  def search
    console
  end

  def create
    @business = Business.new(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to root_url, notice: "Business was successfully created." }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    def business_params
      params.require(:business).permit(:name, :email, :is_owner, :location, :telephone, :website, :instagram, :opens_at, :closes_at, :business_type_id, :tag_list, :language_list, :avatar)
    end

end
