function f = taxproblem(x)
[income,number] = taxdata;
nbases  = length(income);
totalinc = 0;
for i = 1 : nbases
    totalinc = totalinc + number(i)*income(i);
end

penalty_econeffi = 0;
penalty_budget = 0;
tax = sum(x.*(income.*number)/100);
if(tax > 0.3*totalinc)
    penalty_econeffi = 1e20;
end
if(tax < 1e5*221558.30)
    penalty_budget = 1e20;
end
f = -tax + penalty_budget + penalty_econeffi;



