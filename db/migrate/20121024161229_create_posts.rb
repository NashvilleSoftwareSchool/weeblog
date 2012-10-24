class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|#where does t come from. table? where is that defined
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
