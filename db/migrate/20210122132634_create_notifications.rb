# frozen_string_literal: true

# create notifications migration
class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :recipient_id
      t.references :user, null: false, foreign_key: true
      t.string :action
      t.string :notifiable_type
      t.integer :notifiable_id
      t.datetime :read_at

      t.timestamps
    end
  end
end
