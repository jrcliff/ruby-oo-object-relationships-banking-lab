require 'pry'
class Transfer
  
  attr_accessor :status, :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = "pending"
    
  end

  def valid?
    sender.valid? && receiver.valid? 
  end




  def execute_transaction
    if self.valid?  == false or self.status == "complete"
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.valid? == true && sender.balance > self.amount
      sender.withdraw(self.amount)
      receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
   
    


    # if @status = "complete"
      
  
    #checking to see if sender has enough funds for transaction

    # if @sender.balance < @amount 
    #   @self.status = "rejected"
    #   self.valid? && @sender.balance >= @amount && self.status = "pending"
    #   return "Transaction rejected. Please check your account balance."
    # elsif self.status != "complete" && @sender.valid?
    #   @sender.withdraw(@amount)
    #   @receiver.deposit(@amount)
    #   self.status = "complete"
    #   # binding.pry
    # else !self.instance_variables.include? self
    #   @status = "rejected"

    
    #   @sender.balance -= @amount
    #   @receiver.balance += @amount
    #   @status = "complete"
    # else
    #   @status =+ "rejected"
    #   return "Transaction rejected. Please check your account balance."
      
    
    

    #   @sender.balance > @amount && @status == "pending"
    #   @sender.balance -= @amount
    #   @receiver.balance += @amount
    #   @status = "complete"
    # else
    
    # binding.pry
  end


  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
  # your code here
end
