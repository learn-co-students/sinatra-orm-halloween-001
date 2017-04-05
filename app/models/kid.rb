class Kid < ActiveRecord::Base

  has_one :bucket
  has_many :candies, through: :bucket


  def pig_out(number)
    counter = 0
    number.times do
      self.bucket.candies[counter].destroy!
      counter += 1
    end

    if number.between?(1,2)
      self.update(:feeling => "Happy")
    elsif number >= 3
      self.update(:feeling => "Sick")
    end

    self.save!
      
  end



end