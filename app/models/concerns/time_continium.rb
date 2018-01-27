module TimeContinium
#Custom validation for model dealing with time
#Models have to answer to .start_at / .end_at

  def end_come_after_start
    if start_at && end_at
      if start_at > end_at
       errors.add(:base, "Cant end before to start")
     end
    end
  end

  def is_on_same_day
    if start_at && end_at
      if start_at.to_date != end_at.to_date
       errors.add(:base, "Must be on the same day")
     end
   end
 end

end
