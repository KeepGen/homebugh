class RecurringPaymentDecorator < Draper::Decorator
  delegate_all

  def amount
    h.get_number_to_currency object.amount, unit
  end

  def type_icon
    object.income? ? h.up_arrow : h.down_arrow
  end

  def next_payment_on
    I18n.l(object.next_payment_on, format: :long)
  end

  def created_on
    I18n.l(object.created_at.to_date, format: :long)
  end

  def unit
    object.account.decorate.unit
  end

  def category_name
    object.category_name
  end
end
