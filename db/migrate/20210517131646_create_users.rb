class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string    :username      , null: false, limit: 60
      t.string    :email
      t.string    :password_hash 
      t.string    :password_salt

      t.integer  :failed_attempts, null: false, default: 0
      t.datetime :locked_at

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
