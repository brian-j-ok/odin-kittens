class KittensController < ApplicationController
    def index
        @kittens = Kitten.all
    end

    def show
        @kitten = Kitten.find(params[:id])
    end

    def new
        @kitten = Kitten.new
    end

    def create
        @kitten = Kitten.new(kitten_params)
        
        if @kitten.save
            redirect_to :action => 'show'
        else
            render :action => 'new'
        end
    end

    def edit
        @kitten = Kitten.find(params[:id])
    end

    def update
        @kitten = Kitten.find(params[:id])

        if @kitten.update_attributes(kitten_params)
            redirect_to :action => 'show', :id => @kitten
        else
            render :action => 'edit'
        end
    end

    private
    def kitten_params
        params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
