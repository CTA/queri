module TimeHelper
  def most_recent_11_am_hour
    t = Time.now - 3600
    while t.hour != 11
      t -= 3600
    end
    return t
  end

  def most_recent_12_pm_hour
    t = Time.now
    while t.hour != 12
      t -= 3600
    end
    return t
  end
end
