include FactoryBot::Syntax::Methods

(1..10).each do
  category = create(:category)

  (0..rand(10)).each do
    create(:product, category: category)
  end
end

product_ids = Product.ids

(1..50).each do
  user = create(:user)

  (0..rand(10)).each do
    order = create(:order, user: user)

    (0..rand(10)).each do
      OrderItem.create(product_id: product_ids.sample, order: order)
    end
  end
end