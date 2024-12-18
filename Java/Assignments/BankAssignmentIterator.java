package pack.cap.module9.collection;
/*A banking system needs to manage customer accounts efficiently. 
 * The system must perform various operations, such as:
Adding a new account.
Depositing money into an account.
Withdrawing money from an account.
Checking the balance of an account.
Removing inactive accounts.
Displaying accounts with the highest and lowest balances.

The system needs to maintain unique accounts (no duplicates), 
perform operations like deposit and withdrawal, and track inactive accounts.
 Additionally, the system should support streaming and iterating over accounts 
 to find those with the maximum and minimum balances.
To implement this system, we will use the Set interface (via HashSet) to store 
unique account details and leverage Java 8 streams and iteration techniques for 
performing operations.*/
import java.util.*;

class Account1 {
    int accountId;
    String accountHolder;
    double balance;

    public Account1(int accountId, String accountHolder, double balance) {
        this.accountId = accountId;
        this.accountHolder = accountHolder;
        this.balance = balance;
    }

    @Override
    public String toString() {
        return "Account{ID=" + accountId + ", Holder='" + accountHolder + "', Balance=" + balance + "}";
    }

    @Override
    public int hashCode() {
        return Objects.hash(accountId);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Account account = (Account) obj;
        return accountId == account.accountId;
    }
}

public class BankAssignmentIterator {
    Set<Account1> accounts = new HashSet<>();

    void addAccount(int id, String holder, double balance) {
        if (accounts.add(new Account1(id, holder, balance))) {
            System.out.println("Account added: " + holder);
        } else {
            System.out.println("Account already exists with ID: " + id);
        }
    }

    void deposit(int id, double amount) {
        Iterator<Account1> iterator = accounts.iterator();
        while (iterator.hasNext()) {
            Account1 account = iterator.next();
            if (account.accountId == id) {
                account.balance += amount;
                System.out.println("Deposited " + amount + " to Account " + id);
                return;
            }
        }
        System.out.println("Account not found with ID: " + id);
    }

    void withdraw(int id, double amount) {
        Iterator<Account1> iterator = accounts.iterator();
        while (iterator.hasNext()) {
            Account1 account = iterator.next();
            if (account.accountId == id) {
                if (amount <= account.balance) {
                    account.balance -= amount;
                    System.out.println("Withdrew " + amount + " from Account " + id);
                } else {
                    System.out.println("Insufficient balance in Account " + id);
                }
                return;
            }
        }
        System.out.println("Account not found with ID: " + id);
    }

    void checkBalance(int id) {
        Iterator<Account1> iterator = accounts.iterator();
        while (iterator.hasNext()) {
            Account1 account = iterator.next();
            if (account.accountId == id) {
                System.out.println("Balance for Account " + id + ": " + account.balance);
                return;
            }
        }
        System.out.println("Account not found with ID: " + id);
    }

    void displayAllAccounts() {
        Iterator<Account1> iterator = accounts.iterator();
        while (iterator.hasNext()) {
            System.out.println(iterator.next());
        }
    }

    void HigLowBalance() {
        if (!accounts.isEmpty()) {
            Account1 highest = null;
            Account1 lowest = null;
            Iterator<Account1> iterator = accounts.iterator();
            while (iterator.hasNext()) {
                Account1 account = iterator.next();
                if (highest == null || account.balance > highest.balance) {
                    highest = account;
                }
                if (lowest == null || account.balance < lowest.balance) {
                    lowest = account;
                }
            }
            System.out.println("Highest balance: " + highest);
            System.out.println("Lowest balance: " + lowest);
        } else {
            System.out.println("No accounts found.");
        }
    }

    void removeInactive() {
        Iterator<Account1> iterator = accounts.iterator();
        while (iterator.hasNext()) {
            Account1 account = iterator.next();
            if (account.balance == 0) {
                iterator.remove(); 
            }
        }
        System.out.println("Zero balance accounts removed.");
    }

    public static void main(String[] args) {
    	BankAssignmentIterator bank = new BankAssignmentIterator();

        bank.addAccount(1, "Lisa", 5000);
        bank.addAccount(2, "Rose", 0);
        bank.addAccount(3, "Maria", 6000);
        bank.addAccount(4, "Bella", 100);

        System.out.println("\nAll accounts:");
        bank.displayAllAccounts();

        System.out.println("========================================");

        bank.deposit(1, 2000);
        bank.withdraw(2, 500);
        bank.checkBalance(3);

        System.out.println("\nAccounts after update:");
        bank.displayAllAccounts();

        System.out.println("\nAccounts with highest and lowest balance:");
        bank.HigLowBalance();

        System.out.println("\nRemoving zero balance accounts:");
        bank.removeInactive();

        System.out.println("\nAccounts after removal:");
        bank.displayAllAccounts();
    }
}

/*OUTPUT
 * Account added: Lisa
Account added: Rose
Account added: Maria
Account added: Bella

All accounts:
Account{ID=1, Holder='Lisa', Balance=5000.0}
Account{ID=2, Holder='Rose', Balance=0.0}
Account{ID=3, Holder='Maria', Balance=6000.0}
Account{ID=4, Holder='Bella', Balance=100.0}
========================================
Deposited 2000.0 to Account 1
Insufficient balance in Account 2
Balance for Account 3: 6000.0

Accounts after update:
Account{ID=1, Holder='Lisa', Balance=7000.0}
Account{ID=2, Holder='Rose', Balance=0.0}
Account{ID=3, Holder='Maria', Balance=6000.0}
Account{ID=4, Holder='Bella', Balance=100.0}

Accounts with highest and lowest balance:
Highest balance: Account{ID=1, Holder='Lisa', Balance=7000.0}
Lowest balance: Account{ID=2, Holder='Rose', Balance=0.0}

Removing zero balance accounts:
Zero balance accounts removed.

Accounts after removal:
Account{ID=1, Holder='Lisa', Balance=7000.0}
Account{ID=3, Holder='Maria', Balance=6000.0}
Account{ID=4, Holder='Bella', Balance=100.0}

 */