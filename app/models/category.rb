# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
  validates :name, presence: true
  has_many :books
end
