class ListingsController < ApplicationController
    before_action :set_listing(), only: [:show, :edit, :update, :destroy]

    def index
        @listings = Listing.all
    end

    def show
    end
       

    def new
    end

    def create
        #finish logic for creating a record
    end

    def edit
        
       

    def update
        
        #finsih logic for updating the record
    end

    def destroy
        
        #finish logic for deleting the record
    end

    private

    def set_listing
        id = params[:id]
        @listing = Listing.find(id)
    end

end