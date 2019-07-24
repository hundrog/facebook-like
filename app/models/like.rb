class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :post, uniqueness: { scope: :user,
                         message: "should like once per user" }
end
