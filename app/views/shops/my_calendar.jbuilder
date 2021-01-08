json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :title, :body
  json.start reservation.start_date
  json.end reservation.end_date
  json.url r_show_path(@reservations)
end