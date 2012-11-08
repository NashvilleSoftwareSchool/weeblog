class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.integer :post_id
      t.string :path

      t.timestamps
    end
  end
end
