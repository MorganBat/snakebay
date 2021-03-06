class ListingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_listing, only: [:show]
    before_action :set_user_listing, only: [:edit, :update, :destroy]
    before_action :set_listing, only: [:show, :edit, :update, :destroy]

    def index
        @listings = Listing.all
    end

    def show
        @listing = Listing.find(params["id"])
    end

    def new
        set_breeds_and_sexes
        @listing = Listing.new
    end

    def create
        @listing= current_user.listings.create(listing_params)
        
        if @listing.errors.any?
            set_breeds_and_sexes
            render "new"
        else
            redirect_to listings_path
        end
    end

    def edit
        set_breeds_and_sexes()
    end 
       
    def update
        @listing = Listing.update(params["id"], listing_params)
        puts @listing
        if @listing.errors.any?
            set_breeds_and_sexes
            render "edit"
        else
            redirect_to listings_path
        end
    end

    def destroy
        Listing.find(params[:id]).destroy
        redirect_to listings_path
    end

    private

    def set_listing
        id = params[:id]
        @listing = Listing.find(id)
    end

    def set_user_listing
        id = params[:id]
        @listing = current_user.listings.find_by_id(id)

        if listing == nil
            redirect_to listings_path
        end
    end

    def set_breeds_and_sexes
        @breeds = Breed.all
        @sexes = Listing.sexes.keys
    end

    def listing_params
        params.require(:listing).permit(:title, :description, :breed_id, :sex, :city, :state, :price, :deposit, :date_of_birth, :diet, :picture)    
    end

end