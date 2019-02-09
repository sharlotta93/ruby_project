require_relative( "../models/category" )
require_relative( "../models/product" )
require_relative( "../models/supplier" )
require("pry")

Category.delete_all()
Supplier.delete_all()
Product.delete_all()

category_1 = Category.new({
  'name' => 'Body'
  })

category_1.save()

category_2 = Category.new({
  'name' => 'Beans and Pulses'
  })

category_2.save()

supplier_1 = Supplier.new({
  'name' => 'Lomond',
  'payment_method' => 'cash'
})

supplier_1.save()

supplier_2 = Supplier.new({
  'name' => 'NoPlastic',
  'payment_method' => 'card'
})

supplier_2.save()

product_1 = Product.new({
  'name' => 'Shampoo',
  'unit' => 20,
  'min_units_required' => 10,
  'buying_cost' => 2.0,
  'selling_price' => 3.5,
  'description' => 'solid round bar of shampoo',
  'category_id' => category_1.id,
  'supplier_id' => supplier_2.id,
  })

product_1.save()

product_2 = Product.new({
  'name' => 'Kidney Beans',
  'unit' => 100,
  'min_units_required' => 20,
  'buying_cost' => 1.0,
  'selling_price' => 2.2,
  'description' => 'dried kidney beans',
  'category_id' => category_2.id,
  'supplier_id' => supplier_1.id,
  })

product_2.save()

product_3 = Product.new({
  'name' => 'Barley',
  'unit' => 15,
  'min_units_required' => 20,
  'buying_cost' => 0.5,
  'selling_price' => 1.2,
  'description' => 'medium barley',
  'category_id' => category_2.id,
  'supplier_id' => supplier_1.id,
  })

product_3.save()

product_1.name = 'Solid Shampoo'
product_1.update()

supplier_1.payment_method = 'credit'
supplier_1.update()

category_1.name = 'Body Care'
category_1.update()

m = Product.all()
n = Category.all()
o = Supplier.all()

binding.pry
nil
