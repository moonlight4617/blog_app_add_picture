class DfgAddToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :dfg, :integer
  end
end
