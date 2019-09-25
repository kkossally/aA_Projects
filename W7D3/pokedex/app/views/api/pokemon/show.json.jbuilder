# Pokemon show page

json.pokemon do 
  json.extract! @pokemon, :id, :name, :attack, :defense, :moves,
    :poke_type, :image_url, :item_ids 
end

json.items @pokemon.items