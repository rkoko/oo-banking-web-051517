'require pry'
class Transfer
  # your code here

  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  @@transfer_count=0
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.valid? && self.status == "pending" && self.sender.balance > self.amount
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
      else
      reject_status
      end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
  end
  end

  def reject_status
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

end
