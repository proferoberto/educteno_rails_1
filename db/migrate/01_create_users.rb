class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :password
      t.integer :type
      t.string :email

      t.timestamps
    end
  end
end
