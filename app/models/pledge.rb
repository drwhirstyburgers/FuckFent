class Pledge < ApplicationRecord
  enum payment_type: [:PayPal, :Square, :Bitcoin]

  validates :name, length: { minimum: 5 }, presence: true
  validates :email, length: { minimum: 5 }, presence: true
  validates :amount, length: { minimum: 1 }, presence: true
  validates :payment_type, presence: true
end
