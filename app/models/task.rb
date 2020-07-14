class Task < ApplicationRecord
  enum is_complete: {未完了: 0, 完了: 1}
end
