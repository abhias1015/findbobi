class BusinessesController < InheritedResources::Base

  def home
  end

  private

    def business_params
      params.require(:business).permit(:name, :email, :is_owner, :location, :telephone, :website, :instagram, :opens_at, :closes_at, :business_type_id)
    end

end
