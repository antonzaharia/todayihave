class TagsController < ApplicationController

    def show
        @tag = Tag.find(params[:id])
    end

    def index
        @tags = Tag.ordered_by_posts
    end
end
