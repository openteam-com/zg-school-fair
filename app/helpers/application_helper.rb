module ApplicationHelper
  def related(event)
    @related_items = {}.tap{ |hash|
      event.related_items.order('id desc').each do |item|
        hash["#{item.item_type}_#{item.item_id}"] = JSON.parse($redis.get "#{item.item_type}_#{item.item_id}")
      end
    }
  end
end
