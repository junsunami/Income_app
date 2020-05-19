class StaticController < ApplicationController
  def homepage
    if user_signed_in? 
      today = Date.today
      this_month = today.all_month
      user_score = Post.group(:user_id)
      @all_elapsed_time = user_score.sum(:elapsed_time)
      @all_hourly_wage = user_score.average(:hourly_wage)
      @all_price = user_score.sum(:price)

    end
  end

  def features
  end
  
end
