# This migration comes from shop_cart (originally 20151011085905)
class CreateShopCartOrders < ActiveRecord::Migration
  def change
    create_table :shop_cart_orders do |t|
      t.decimal :total_price
      t.datetime :completed_date
      t.string :state
      t.string :number
      t.decimal  :delivery_price
      t.belongs_to :customer
      t.belongs_to :coupon
      t.belongs_to :order_item
      t.belongs_to :billing_address
      t.belongs_to :shipping_address
      t.belongs_to :delivery_method
      t.belongs_to :credit_card
      t.timestamps null: false
    end
  end
end
