require "rspec"

require_relative "account"

describe Account do

 let(:acct_number) {"1234567890"}
  let(:account) { Account.new(acct_number) }

   describe "#initialize" do
    describe "if account number is valid" do
      it "initialize starting balance to be 0" do
        expect(account.transactions[0]).to eq 0
      end
    end

    describe "if account number is not valid" do
      it "raise error" do
        expect {Account.new("123456")}.to raise_error InvalidAccountNumberError 
      end
    end

  end

  describe "#transactions" do
    it "should be an array" do
      expect(account.transactions).to be_an_instance_of(Array)
    end


  end

  describe "#balance" do
    it "sets starting balance to zero" do
      expect(account.balance).to eq 0
    end

  end

  describe "#account_number" do
    it "shows only last four digits" do
    expect(account.acct_number).to eq "******7890"
  end

  end

  describe "deposit!" do
    it "requires an integer amount argument" do
      expect{ account.withdraw!("c") }.to raise_error(ArgumentError)
    end

    it "it returns balance" do
      account.deposit!(100)
      expect(account.balance).to eq 100
    end

    it "returns negative deposit error" do
    expect{ account.deposit!(-100) }.to raise_error(NegativeDepositError)
  end
end

  describe "#withdraw!" do

    it "requires an integer amount argument" do
      expect{ account.withdraw!("c") }.to raise_error(ArgumentError)
    end

    it "requires sufficient amount of money for withdrawal" do
      #this works because starting balance is set to 0!!!
      expect{account.withdraw!(100)}.to raise_error OverdraftError 
    end
end
end




