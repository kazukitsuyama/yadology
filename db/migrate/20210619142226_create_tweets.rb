class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string     :yado_title
      t.string     :yado_name
      t.text       :text
      t.integer    :date
      t.integer    :area
      t.integer    :price 
      t.timestamps
    end
  end
end
