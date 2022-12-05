class ChargesController < ApplicationController
  def new
    @price = Course.find_by(id: params[:format]).price
  end
  
  def create
  require 'stripe'

  Stripe.api_key = ENV['STRIPE_API_KEY']
  # Amount in cents
  course = Course.find_by(id: params[:course_id])
  @amount = course.price * 100
  
  customer = Stripe::Customer.create(
  :email => params[:stripeEmail],
  :source => params[:stripeToken]
  )

  charge = Stripe::PaymentIntent.create({
    customer: customer.id,
    amount: @amount,
    description: "Course",
    currency: 'inr',
    payment_method_types: ['card'],
  })
  
  confirm = Stripe::PaymentIntent.confirm(
  charge.id,
  {payment_method: 'pm_card_visa'},
  )
  if confirm[:status] == "succeeded"
    current_employee.courses << course
    redirect_to path
  end
  
  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
  end
  
  protected
  
  def path 
    case current_employee.roles.first.name
    when "admin"
      admin_course_path(params[:course_id])
    when "hr"
      hr_course_path(params[:course_id])
    when "manager"
      manager_course_path(params[:course_id])
    when "employee"
      employee_course_path(params[:course_id])
    end
  end

end