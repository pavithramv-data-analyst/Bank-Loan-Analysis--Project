# BANK_ANALYSIS

CREATE DATABASE Bank_data;
USE Bank_data;
-- KPI'S
# 1.YEAR WISE LOAN AMOUNT STATUS
SELECT YEAR(issue_d)AS Year_of_issue_d,SUM(loan_amnt)AS Total_loan_amnt FROM finance_1
GROUP BY Year_of_issue_d 
ORDER BY Total_loan_amnt;

-- 2.GRADE AND SUBGRADE WISE REVOLVE BALANCE
SELECT grade,sub_grade,SUM(revol_bal) AS Total_revol_bal FROM finance_1
INNER JOIN finance_2
ON(finance_1.id=finance_2.id)
GROUP BY grade,sub_grade 
ORDER BY grade,sub_grade ;

-- 3.TOTAL PAYMENT FOR VERIFIED STATUS VS TOTAL PAYMENT FOR NON-VERIFIED STATUS
SELECT verification_status,concat("$",FORMAT(ROUND(SUM(total_pymnt)/1000000,2),2),"M") FROM finance_1
INNER JOIN finance_2
ON(finance_1.id=finance_2.id)
WHERE  verification_status NOT IN ('Source Verified')
GROUP BY  verification_status;

-- 4.STATE WISE AND last_credit_pull_d WISE LOAN STATUS
SELECT addr_state,last_credit_pull_d ,loan_status FROM finance_1
INNER JOIN finance_2
ON(finance_1.id=finance_2.id)
ORDER BY last_credit_pull_d;

-- 5.HOME OWNERSHIP VS LAST PAYMENT DATE
SELECT home_ownership,last_pymnt_d FROM finance_1
INNER JOIN finance_2
ON(finance_1.id=finance_2.id)
ORDER BY last_pymnt_d ;

