class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :reviews
  has_many :ratings

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def secret_code
    @secret_code ||= ""
  end

  def secret_code=(input_code)
    @secret_code = input_code
    self.trusted = true if "ILOVENICHOLASCAGE" == @secret_code
  end

  # def password=(new_password)

  # User.new(username: 'namuun', password: 12343 secret_code: "Iloveblah")
end
