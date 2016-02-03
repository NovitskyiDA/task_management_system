class User < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

  # Include default devise modules. Others available are:
  # :trackable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable

  validates_presence_of :first_name, :last_name

  def full_name
    [first_name, last_name].join(' ')
  end
end
