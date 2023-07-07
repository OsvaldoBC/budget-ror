class PaymentsController < ApplicationController
  before_action :set_group, only: %i[index new create]

  def index
    @payments = @group.payments.order(created_at: :desc)
  end

  def new
    @payment = Payment.new
    @groups = current_user.groups
  end

  def create
    if params[:payment][:groups].blank?
      flash[:alert] = 'Must select at least one category'
      redirect_to new_group_payment_path(@group)
    else
      @payment = current_user.payments.build(payment_params)

      if @payment.save
        create_group_payments(params[:payment][:groups], @payment)
        redirect_to group_payments_path(@group), notice: 'The Payment was added successfully.'
      else
        render :index, status: :unprocessable_entity
      end
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, categories: [])
  end

  def create_group_payments(group_ids, payment)
    group_ids.each do |group_id|
      GroupPayment.create(group_id:, payment:)
    end
  end
end
