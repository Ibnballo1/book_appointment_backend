class RootController < ApplicationController
    def index
        render json: {welcome: "hello"}
    end
end