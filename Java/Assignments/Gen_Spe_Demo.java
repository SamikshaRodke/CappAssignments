package pack.cap.module5.module4;

//Generalization
class BankAccount{
	String accountNumber;
	double balance;
	public BankAccount(String accountNumber, double balance) {
		super();
		this.accountNumber = accountNumber;
		this.balance = balance;
	}
	public void deposit(double amount) {
		if(amount>0) {
			balance += amount;
			System.out.println("Deposited successfully :"+amount+" New Balance: "+balance);
		}
		else {
			System.out.println("deposit amount must be positive");
		}
	}
	public void withDraw(double amount) {
		if(amount>0 && amount<=balance) {
			balance -= amount;
			System.out.println("withdraw successfully :"+amount+" New Balance: "+balance);
		}
		else {
			System.out.println("insufficient balance");
		}
	}
	
	public void checkBalance() {
		System.out.println("Balance for account "+accountNumber+"$" +balance);
	}
}



//specialization
class SavingsAccount extends BankAccount{
	double intRate;

	public SavingsAccount(String accountNumber, double balance,double intRate) {
		super(accountNumber,balance);
		this.intRate = intRate;
	}
	
	public void applyInterest() {
		double intr = balance * intRate;
		balance += intr;
		System.out.println("Interest of $"+ intr +" applied New balance "+balance);
	}
}

class CheckingAccount extends BankAccount{
	double fee;
	public CheckingAccount(String accountNumber, double balance,double fee) {
		super(accountNumber,balance);
		this.fee = fee;
	}
	@Override
	public void withDraw(double amount) {
		// TODO Auto-generated method stub
		super.withDraw(amount);
		if(amount>0 && amount <=balance) {
			balance -= amount;
			balance -= fee;
			System.out.println("withdraw " +amount+ " with fee of "+fee);
		}
		else {
			System.out.println("Insufficient balance");
		}
	}
}

class SIPAccount extends BankAccount {
    double sipAmount;
    int months;

    public SIPAccount(String accountNumber, double balance, double sipAmount, int months) {
        super(accountNumber, balance);
        this.sipAmount = sipAmount;
        this.months = months;
    }

    public void makeSipContribution() {
        for (int i = 1; i <= months; i++) {
            deposit(sipAmount); 
            System.out.println("Month " + i + ": SIP contribution of $" + sipAmount);
        }
    }
}


class BusinessAccount extends BankAccount {
    double businessFee;

    public BusinessAccount(String accountNumber, double balance, double businessFee) {
        super(accountNumber, balance);
        this.businessFee = businessFee;
    }

    @Override
    public void deposit(double amount) {
        super.deposit(amount);
        if (amount > 0) {
            balance -= businessFee; 
            System.out.println("Business fee of $" + businessFee + " deducted after deposit.");
            System.out.println("current balance : "+balance);
        }
    }
}

class TradingAccount extends BankAccount {
    double tradeFee;

    public TradingAccount(String accountNumber, double balance, double tradeFee) {
        super(accountNumber, balance);
        this.tradeFee = tradeFee;
    }

    public void buyStock(double amount) {
        if (amount + tradeFee <= balance) {
            balance -= (amount + tradeFee);
            System.out.println("Bought stocks worth $" + amount + " with a trade fee of $" + tradeFee);
            System.out.println("New Balance: $" + balance);
        } 
    }

}
public class Gen_Spe_Demo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SavingsAccount sa = new SavingsAccount("SA123" , 5000, 0.03);
		sa.deposit(10000);
		sa.applyInterest();  //specialization apply for savingaccount
		
		CheckingAccount ca = new CheckingAccount("CA456" ,4000, 2.5);
		ca.deposit(1000);
		ca.withDraw(200);  //specialization withdraw  with fee 
		
		SIPAccount sip = new SIPAccount("SIP789", 2000, 100, 2);  
        sip.makeSipContribution();

        BusinessAccount ba = new BusinessAccount("BA101", 10000, 50);
        ba.deposit(2000); 
       
        TradingAccount ta = new TradingAccount("TA202", 5000, 10);
        ta.buyStock(1000);
	}

}
//sip, business account , trading
