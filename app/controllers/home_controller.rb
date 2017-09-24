class HomeController < ApplicationController
    require 'will_paginate/array'
    def index
        
    end
    
    def cryptocoin
        if params[:num].nil?
            params[:num] = 10
        end
        response = HTTParty.get('https://api.coinmarketcap.com/v1/ticker/')
        data = JSON.parse(response.body)
        @json = data.paginate(page: params[:page], per_page: params[:num])
    end
end
