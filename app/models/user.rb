class User < ApplicationRecord
  # rolify :before_add => :do_this
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validates :firstname, presence: true, length: {minimum: 3, maximum: 10}

  # validates :lastname, presence: true, length: {minimum: 3, maximum: 10}

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

  # validates :password, 
  # presence: true, 
  # length: { in: Devise.password_length }, 
  # format: { with: PASSWORD_FORMAT }, 
  # confirmation: true, 
  # on: :create

  # validates :password, 
  # allow_nil: true, 
  # length: { in: Devise.password_length }, 
  # format: { with: PASSWORD_FORMAT }, 
  # confirmation: true, 
  # on: :update

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :properties, through: :favourites
 # has_many :properties   
 has_many :favourites, dependent: :destroy    


 after_create :create_account

  # def do_this
  #   @user = User.last
  #   if @user.host
  #     @user.add_role :host
  #   else
  #     @user.add_role :tenant
  #   end    
  # end

  def create_account
    @user = User.last
    if @user.host?
      @user.host = true  
      @user.add_role :host
    else
      @user.host = false
      @user.add_role :tenant
    end 
  end

 has_many :bookings, dependent: :destroy

  def unavailable_dates
    bookings.pluck(:startdate, :enddate).map do |range|
      { from: range[0], to: range[1] }
    end
  end

end
