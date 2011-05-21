class CreatePresentations < ActiveRecord::Migration
  def self.up
    create_table :presentations do |t|
      t.string   :title,            :null => false
      t.text     :description_html, :null => false
      t.decimal  :rating,           :precision => 5, :scale => 2
      t.integer  :num_ratings,      :null => false, :default => 0
      t.string   :speakers,         :null => false
      t.string   :presentation_type
      t.text     :url,              :null => false

      t.timestamps
    end

    add_index :presentations, :rating
  end

  def self.down
    remove_index :presentations, :rating
    drop_table :presentations
  end
end
