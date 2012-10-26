class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post_id
      t.string :commenter
      t.text :message

      t.timestamps
    end
  end
end
