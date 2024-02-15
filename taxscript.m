clc
clear;
%%
[income,number] = taxdata;
nbases = length(income);
lb = zeros(1,nbases);
ub = ones(1,nbases);
ub = 100*ub;
prob = @taxproblem;
%%
Np = 50;
T = 100;
rng(1,'twister')
[solns,bestfitness,~,~,~] = TLBO(prob,lb,ub,Np,T);
w = 0.7;
c1 = 1.5;
c2 = 1.5;
Pc = 0.8; F = 0.85;
rng(1,'twister')
[solns_pso,bestfitness_pso,~,~,~] = PSO(prob,lb,ub,Np,T,w,c1,c2);
rng(1,'twister')
[solns_de,bestfitness_de,~,~,~] = DifferentialEvolution(prob,lb,ub,Np,T,Pc,F);
redist_amt = (-bestfitness)*0.1;
redist_amt_pso = (-bestfitness_pso)*0.1;
redist_amt_de = (-bestfitness_de)*0.1;
etac = 20;                         % Distribution index for crossover
etam = 20;                         % Distribution index for mutation
Pc = 0.8;                          % Crossover probability
Pm = 0.2;                          % Mutation probability


rng(1,'twister')

[solns_ga,bestfitness_ga] = GeneticAlgorithm(prob,lb,ub,Np,T,etac,etam,Pc,Pm);
redist_amt_ga = (-bestfitness_ga)*0.1;
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
start_gini = (ideal - real)/ideal;
%%
[income,number] = taxdata;
nbases = length(income);
ub = ub/100;
prob = @redistproblem;
%%
Np = 50;
T = 100;
w = 0.7;
c1 = 1.5;
c2 = 1.5;
Pc = 0.8; F = 0.85;
rng(1,'twister')
[end_gini,redistperc,val,~,~,~] = TLBOmultinp(prob,lb,ub,Np,T,redist_amt);
rng(1,'twister')
[end_gini_pso,redistperc_pso,val_pso,~,~,~] = PSOmultinp(prob,lb,ub,Np,T,w,c1,c2,redist_amt_pso);
rng(1,'twister')
[end_gini_de,redistperc_de,val_de,~,~,~] = DifferentialEvolutionmultinp(prob,lb,ub,Np,T,Pc,F,redist_amt_de);

etac = 20;                         % Distribution index for crossover
etam = 20;                         % Distribution index for mutation
Pc = 0.8;                          % Crossover probability
Pm = 0.2;                          % Mutation probability


rng(1,'twister')
[end_gini_ga,redistperc_ga,val_ga] = GeneticAlgorithmmultinp(prob,lb,ub,Np,T,etac,etam,Pc,Pm,redist_amt_ga);

plot(cumincideal,cuminc);
hold on;
plot(cumincideal,cumincideal);