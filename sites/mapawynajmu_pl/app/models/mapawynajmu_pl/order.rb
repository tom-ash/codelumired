# frozen_string_literal: true

module MapawynajmuPl
  class Order < ApplicationRecord
    establish_connection :mapawynajmu_pl

    self.table_name = 'orders'

    belongs_to :announcement, class_name: '::MapawynajmuPl::Listing'

    validates :payu_order_id, presence: true
    validates :payu_merchant_pos_id, presence: true
    validates :status, presence: true
    validates :product, presence: true
    validates :price, presence: true
    validates :currency, presence: true
  end
end
