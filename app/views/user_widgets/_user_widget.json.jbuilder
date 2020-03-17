json.extract! user_widget, :id, :user_id, :widgetable_type, :widgetable_id, :created_at, :updated_at
json.url user_widget_url(user_widget, format: :json)
