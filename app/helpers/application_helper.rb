module ApplicationHelper
  def display_date(date)
    if date
      formatted = date.strftime("%H:%M:%S")
    else
      formatted = ' '
    end
  end
end
