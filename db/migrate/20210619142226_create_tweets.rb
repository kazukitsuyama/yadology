class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string     :yado_title,         null: false
      t.string     :yado_name,          null: false
      t.text       :text,               null: false
      t.datetime   :date,               null: false
      t.integer    :price,              null: false
      t.references :user,               null: false, foreign_key: true
      t.integer    :area_id,            null: false
      t.timestamps
    end
  end
end
