require 'open_pay_resource'

class Charges < OpenPayResource

  def all(customer_id=nil)
    if customer_id
      customers=@api_hook.create(:customers)
      customers.all_charges(customer_id)
    else
      super ''
    end
  end


  def cancel(transaction_id,customer_id=nil)
    if customer_id
      customers=@api_hook.create(:customers)
      customers.cancel_charge(customer_id, transaction_id)
    else
         post('', transaction_id+'/cancel')
     end
  end


  def refund(transaction_id,description,customer_id=nil)
    if customer_id
      customers=@api_hook.create(:customers)
      customers.refund_charge(customer_id,transaction_id,description)
    else
      post(description, transaction_id+'/refund')
    end
  end


  def capture(transaction_id,customer_id=nil)
    if customer_id
      customers=@api_hook.create(:customers)
      customers.capture_charge(customer_id,transaction_id )
    else
      post( '',transaction_id+'/capture')
    end
  end


  def each(customer_id=nil)
    if customer_id
      all(customer_id).each do |card|
        yield card
      end
    else
      all.each do |card|
        yield card
      end
    end
  end



  def get(charge='', customer_id=nil)
    if customer_id
      customers=@api_hook.create(:customers)
      customers.get_charge(customer_id, charge)
    else
      super charge
    end
  end

  def create(charge, customer_id=nil)
    if customer_id
      customers=@api_hook.create(:customers)
      customers.create_charge(customer_id, charge)
    else
      super charge
    end
  end

end