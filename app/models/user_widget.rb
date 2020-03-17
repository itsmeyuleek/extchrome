class UserWidget < ApplicationRecord
  belongs_to :widgetable, polymorphic: true
  belongs_to :user
end
