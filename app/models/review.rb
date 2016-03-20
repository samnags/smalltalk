# == Schema Information
#
# Table name: reviews
#
#  id              :integer          not null, primary key
#  conversation_id :integer
#  rating          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  comment         :text
#

class Review < ActiveRecord::Base
  belongs_to :conversation 

  def review_message
    one_star = ["This conversation will haunt your dreams", "Oh dear.", "Ugh.", "You are very traumatized", "Forget Button?"]
    two_star = ["You are slightly traumatized", "It was average to poor"]
    three_star = ["This conversation went okay", "Not so awkward"]
    four_star = ["Coooooooool!", "YES!"]
    five_star = ["Cheers to your awesomeness","You rocked that talk!", "Wow! Social Networker!", "What a great conversation!"] 
    case rating
      when 1 
        one_star.sample
      when 2 
        two_star.sample
      when 3 
        three_star.sample
      when 4 
        four_star.sample
      when 5 
        five_star.sample
    end 
  end

  def self.high_ratings
    where('rating >= 4')
  end 

  def self.low_ratings
    where('rating <= 1')
  end   

end
