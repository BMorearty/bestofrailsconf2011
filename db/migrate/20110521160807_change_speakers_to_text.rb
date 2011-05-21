class ChangeSpeakersToText < ActiveRecord::Migration
  def self.up
    remove_column :presentations, :speakers
    add_column    :presentations, :speakers, :text
  end

  def self.down
    remove_column :presentations, :speakers
    add_column    :presentations, :speakers, :string
  end
end