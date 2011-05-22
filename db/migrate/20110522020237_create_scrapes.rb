class CreateScrapes < ActiveRecord::Migration
  def self.up
    create_table :scrapes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :scrapes
  end
end
