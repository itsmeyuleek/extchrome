class ColorBarLibraryWidget < ApplicationRecord
  has_many :user_widgets, as: :widgetable
end
