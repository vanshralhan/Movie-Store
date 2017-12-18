class View < ApplicationRecord
  belongs_to :movie, counter_cache: :view_count
end
