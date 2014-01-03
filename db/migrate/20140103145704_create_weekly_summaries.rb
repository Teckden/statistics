class CreateWeeklySummaries < ActiveRecord::Migration
  def change
    create_table :weekly_summaries do |t|
      t.datetime  :start_week, :end_week
      t.decimal   :total_profit, :investor_profit, precision: 4, scale: 2
      t.timestamps
    end
  end
end
