class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null:false ,default:""
      t.text :opinion, null:false ,default:""
      t.integer :user_id,null:false ,default:""
      t.timestamps
    end
  end
end
