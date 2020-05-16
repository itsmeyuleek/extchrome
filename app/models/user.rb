class User < ApplicationRecord
  has_many :user_widgets
  # has_many :color_scheme_widgets, through: :user_widgets
  # has_many :gradient_widgets, through: :user_widgets
end
