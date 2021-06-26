class Property < ApplicationRecord

  validates :name, presence: true, length: {minimum: 5, maximum: 10}

  validates :location, presence: true, length: {minimum: 3, maximum: 15}

  validates :description, presence: true, length: {minimum: 10, maximum: 50}
  
  validates :sub_category_id, presence: true	

  validates :cost, :people, presence: true, numericality: {only_integer: true, greater_than: 0,  }

  validate :validate_data

  belongs_to :user
  has_many :sub_categories
  has_many :favourites
  has_many :bookings
  has_many :reviews, dependent: :destroy

  has_one_attached :image
  has_one_attached :image1
  has_one_attached :image2
  has_one_attached :image3

  

  # scope :search_property, ->(query) { where(['name LIKE ?', "%#{query}%"]) }


  def unavailable_dates
    #  booking.pluck(:startdate, :enddate).map do |range|
    #   { from: range[0], to: range[1] }
    # end
  end

  private

  def validate_data
  	# if name.length < 5 || name.length > 10
  	# 	errors.add(:name, "length must be between 5 - 10")
  	# end
  end

end
