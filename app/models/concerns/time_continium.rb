module TimeContinium
#Custom validation rules for model dealing with time

  def end_come_after_start
    if start_at && end_at
      if start_at > end_at
       errors.add(:end_date, "End timestamp must be post Start timestamp")
     end
    end
  end

end
