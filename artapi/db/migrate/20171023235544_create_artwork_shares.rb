class CreateArtworkShares < ActiveRecord::Migration[5.1]
  def change
    create_table :artwork_shares do |t|
      t.integer :artwork_id, null: false
      t.integer :viewer_id, null: false
      t.timestamps
    end

    add_index :artwork_shares, :artwork_id
    add_index :artwork_shares, :viewer_id
    add_index :artwork_shares, [:artwork_id, :viewer_id], unique: true
    #index is actually kind of like a binary tree. the first thing
    #is the parent node, the second things are the child node.
    #the third one, for each node in the binary tree, it has another binary tree
    #that is attached to it

    #so the first argument is ALWAYS the table name, referring to the table on line 3.

    #in the third one, it is first searching for the artwork_id. once it finds the
    #correct artwork_id, that node then has a binary tree of viewer_id's attached to it
  end
end
