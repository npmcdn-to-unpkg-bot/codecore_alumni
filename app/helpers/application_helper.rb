module ApplicationHelper
  def parse_date(date)
    date_array = date.to_s.split("-")
    year = date_array[0]
    month = date_array[1]
    day = date_array[2]
    case month
    when  "01"
      date_array[1] = "Jan."
    when  "02"
      date_array[1] = "Feb."
    when  "03"
      date_array[1] = "Mar."
    when  "04"
      date_array[1] = "Apr."
    when  "05"
      date_array[1] = "May."
    when  "06"
      date_array[1] = "Jun."
    when  "07"
      date_array[1] = "Jul."
    when  "08"
      date_array[1] = "Aug."
    when  "09"
      date_array[1] = "Sept."
    when  "10"
      date_array[1] = "Oct."
    when  "11"
      date_array[1] = "Nov."
    when  "12"
      date_array[1] = "Dec."
    else
      date_array[1] = "Invalid date"
    end
    parsed_date = date_array[1] + " " + date_array[2]  + ", " + date_array[0]
    parsed_date
  end
end
