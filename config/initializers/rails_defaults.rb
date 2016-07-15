#
#
# Date::DATE_FORMATS[:default] = '%A %d/%B'
# Time::DATE_FORMATS[:default]= '%A %d %B %l:%M:%p'

Time::DATE_FORMATS[:default]  = ->(time) do
  st = Time.now.beginning_of_day
  nd = Time.now.end_of_day

  case
  when time.between?(st + 1.day, nd + 1.day)
    "Tomorrow #{time.strftime('%l:%M:%p')}"
  when time.between?(st, nd)
    "Today #{time.strftime('%l:%M:%p')}"
  when time.between?(st - 1.day, nd - 1.day)
    "Yesterday #{time.strftime('%l:%M:%p')}"
  when time.between?(st - 6.day, nd - 2.day)
    time.strftime('%A %l:%M:%p')
  else
    time.strftime('%A %d %B %l:%M:%p')
  end
end
