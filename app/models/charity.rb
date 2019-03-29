class Charity < ApplicationRecord
    has_many :donations
    has_many :users, through: :donations

# Note: How to create a seacrch button in html.


    # def self.search(search)
    #     if search != nil
    #         search= search.capitalize
    #         collect_charity = Charity.find_by(name:search)
    #         if select_charity
    #         end
    #     else
    #      Charity.all
    #      Charity.all
    #     end 
    # end 
  end
