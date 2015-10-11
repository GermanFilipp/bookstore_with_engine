# This migration comes from shop_cart (originally 20151011085949)
class CreateShopCartOrderItems < ActiveRecord::Migration
  def change
    create_table :shop_cart_order_items do |t|
      t.decimal :price
      t.integer :quantity
      t.belongs_to :order
      t.belongs_to :product
      t.timestamps null: false
    end
  end
end
