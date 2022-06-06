module Api
  module V1
    class PropertiesController < ApplicationController
      def index
        @properties = LandChecker::Property.all.includes(:address, :lga)
        @properties = @properties.paginate(page: params[:page], per_page: 30)
      end
    end
  end
end
