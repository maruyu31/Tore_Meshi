class Contact < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  enum status: { "未対応": 0, "対応中": 1, "対応済み": 2 }
end
