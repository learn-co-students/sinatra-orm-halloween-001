class House < ActiveRecord::Base

  has_many :candies

  def unclaimed_candies
    self.candies.where(bucket_id: nil)
  end

  def give_candy(kid)

    if kid.age < 18
      kid_bucket = kid.bucket.id
      self.unclaimed_candies[0].update(bucket_id: kid_bucket)
      "Happy Halloween!"
    else
      "You're too old to trick-or-treat."
    end

  end



end