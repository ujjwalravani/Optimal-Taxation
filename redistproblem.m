function [ret,gini] = redistproblem(x,rev)
[income,number] = taxdata;
nbases = length(x);
for i = 1 : nbases
    income(i) = income(i) + x(i)*rev;
end
%% gini index 
sumpop = zeros(1,nbases);
for i = 1:nbases
    for j = 1:i
        sumpop(i) = sumpop(i)+number(j);
    end
end
totalpop = sumpop(nbases);
totalinc = 0;
for i = 1 : nbases
    totalinc = totalinc + number(i)*income(i);
end
cuminc = zeros(1,nbases);
for i = 1 : nbases
    currshare= i*(1/nbases)*totalpop;
    if(currshare <= sumpop(1))
        cuminc(i) = currshare*income(1);
    else 
        j = 1;
        while(j ~= nbases+1 && currshare > sumpop(j))
            cuminc(i) = cuminc(i) + number(j)*income(j);
            j = j+1;
        end
        if(j ~= nbases+1)
            j = j-1;
            cuminc(i) = cuminc(i) + (currshare-sumpop(j))*income(j+1);
        end
    end
    cuminc(i) = cuminc(i)/totalinc;
end
cumincideal = zeros(1,nbases);
for i = 1:nbases
    cumincideal(i) = i*(1/nbases);
end
cumincideal = [0,cumincideal];
cuminc = [0,cuminc];
ideal = trapz(cumincideal,cumincideal);
real = trapz(cumincideal,cuminc);
gini = (ideal - real)/ideal;
%%
penalty_gini = 0;
penalty_domain = 0;
if(gini > 0.4 || gini < 0)
    penalty_gini = 1e5;
end

ret = gini + penalty_gini + penalty_domain;