json.extract! @guest, :name, :age, :favorite_color

json.gifts do
  # debugger
  json.array! @guest.gifts, :title, :description
end