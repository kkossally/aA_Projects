class CreateArtwordShareIndices < ActiveRecord::Migration[5.2]
  def change
    add_index :artwork_shares, :viewer_id
    add_index :artwork_shares, :artwork_id
  end
end
