class Contact < ApplicationRecord
  enum  status: {"未対応": 0, "対応中": 1, "対応済み": 2}
end
