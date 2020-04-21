class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def self.graphql_query(order: nil, joins: nil, sort: nil, limit: nil)
    query = all
    query = query.joins(joins) if joins
    if order
      query = query.where("orders.ordered_at >= ?", order[:minOrderedAt]) if order[:minOrderedAt]
      query = query.where("orders.ordered_at <= ?", order[:maxOrderedAt]) if order[:maxOrderedAt]
    end
    query = query.order(sort) if sort
    query = query.limit(limit) if limit
    query
  end
end
