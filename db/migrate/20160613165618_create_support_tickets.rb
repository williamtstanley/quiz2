class CreateSupportTickets < ActiveRecord::Migration
  def change
    create_table :support_tickets do |t|
      t.string :name
      t.string :email
      t.string :department
      t.text :message
      t.boolean :complete

      t.timestamps null: false
    end
  end
end
