class Pledge < ApplicationRecord
  enum payment_type: [:PayPal, :Square, :Bitcoin]
end
