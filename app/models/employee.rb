class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :issues
  has_many :attendences
  has_many :leaves
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :courses

  has_many :subordinates, class_name: "Employee", foreign_key: "manager_id"
  belongs_to :manager, class_name: "Employee", optional: true

  # validates :title, presence: true, :allow_blank => true, on: :update

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  rolify :before_add => :before_add_method

  def before_add_method(role)
    # do something before it gets added
  end

end
