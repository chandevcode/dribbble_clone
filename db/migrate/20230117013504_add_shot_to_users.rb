class AddShotToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :shot, :string
  end
end
