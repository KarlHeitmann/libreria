# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  author      :string
#  checkin     :date
#  checkout    :date
#  status      :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer          not null
#
# Indexes
#
#  index_books_on_category_id  (category_id)
#
# Foreign Keys
#
#  category_id  (category_id => categories.id)
#
class Book < ApplicationRecord
  validates :title, presence: true
  validates :status, presence: true

  # XXX
  # enum es el que permite establecer una relación
  # entre el integer que se guarda en la base de datos,
  # y la palabra asociada a ese estado.
  enum status: [:shelf, :lent]
end
