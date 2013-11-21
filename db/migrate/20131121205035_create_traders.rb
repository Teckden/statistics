class CreateTraders < ActiveRecord::Migration
  def change
    create_table :traders do |t|
      t.string :pamm_name
      t.string :pamm_url
      t.string :pamm_broker
      t.integer :pamm_num
      t.timestamps
    end
  end
end
