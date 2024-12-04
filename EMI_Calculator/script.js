// Interest Rates for each loan type
const interestRates = {
    homeLoan: 0.08,   
    carLoan: 0.10,    
    educationLoan: 0.06 
};

function calculateEMI() {
    
    const salary = parseFloat(document.getElementById('salary').value);
    const loanAmount = parseFloat(document.getElementById('loanAmount').value);
    const loanType = document.getElementById('loanType').value;

    
    if (isNaN(salary) || isNaN(loanAmount) || salary <= 0 || loanAmount <= 0) {
        alert("Please enter valid salary and loan amount.");
        return;
    }

    
    if (loanAmount > salary * 100) {  
        alert("Your salary is insufficient for the requested loan amount. Please consider adjusting the loan amount or choose a different loan option");
        return;
    }

    // Determine the interest rate and loan duration based on the loan type
    const annualInterestRate = interestRates[loanType];
    const monthlyInterestRate = annualInterestRate / 12;

    let maxLoanDuration = 0;

    if (loanType === 'homeLoan') {
        maxLoanDuration = salary >= 50000 ? 240 : 180; // 20 years or 15 years
    } else if (loanType === 'carLoan') {
        maxLoanDuration = salary >= 40000 ? 120 : 84; // 10 years or 7 years
    } else if (loanType === 'educationLoan') {
        maxLoanDuration = salary >= 30000 ? 120 : 72; // 10 years or 6 years
    }

    // EMI Calculation
    const loanDuration = maxLoanDuration; // max duration based on salary
    const n = loanDuration; // number of months
    const P = loanAmount; // principal
    const r = monthlyInterestRate; // monthly interest rate

  
    const emi = (P * r * Math.pow(1 + r, n)) / (Math.pow(1 + r, n) - 1);

   
    const loanDurationInYears = (loanDuration / 12).toFixed(1);  

   
    document.getElementById('emi').innerText = `Your EMI: ₹${emi.toFixed(2)}`;
    document.getElementById('loanDuration').innerText = `Loan Duration: ${loanDurationInYears} years (${loanDuration} months)`;
}
