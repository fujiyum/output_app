class HomesController < ApplicationController
    def top
        @titles = Title.all
    end
end
