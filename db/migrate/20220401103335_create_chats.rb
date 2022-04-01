class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.string :title
      t.references :creator, null: false
      t.timestamps
    end
  end
end
