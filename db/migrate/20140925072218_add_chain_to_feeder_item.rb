class AddChainToFeederItem < ActiveRecord::Migration
  def change
    add_column :feeder_items, :chains, :string, array: true, default: '{}'
  end
end
