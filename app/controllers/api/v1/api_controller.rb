module Api::V1
  class ApiController < ApplicationController
    def page
      params[:page]
    end

    def per_page
      max_per_page_items = 10
      return max_per_page_items if params[:per_page].blank? || params[:per_page].to_i > max_per_page_items

      params[:per_page]
    end

    def current_user
      User.first
    end

    def boolean_cast(value)
      ActiveModel::Type::Boolean.new.cast(value)
    end
  end
end