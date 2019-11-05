class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, transfer_amount)
   @sender = sender
   @receiver = receiver
   @status = "pending"
   @amount = transfer_amount
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    elsif @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if execute_transaction
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
