`					      `CL-643 

`					`Project Report

`				   `Ujjwal Ravani ( 210102116 )

`				      `Aum Patel ( 210102112 )





`   `**Optimal taxation for income redistribution**


1. **The Problem :** 
- A fundamental problem in economics is the design of a tax system which ensures that the government’s revenue needs are satisfied subject to the goal of minimizing income inequality and ensuring economic efficiency.
- If the total tax collected by the government is higher, then the government can spend more on improving the overall economy. But, at the same time, the tax collected should not be too high, which could discourage the labor force and might lead to people moving out of the country and can hinder economic growth in several other ways.
- In wealthier countries, there's concern about how globalization and new technologies are impacting everything. Fixing these issues seems to be costing a lot. In poorer countries, where inequality is already high, the main question is whether this inequality is holding them back from growing and reducing poverty. The thought is that if we share income more equally, it might not just make things fairer but also speed up economic growth. This could be really important for poorer countries, helping them reduce poverty more rapidly.
- This calls for an optimal tax structure and optimal redistributive policies that together achieve the goals of maximizing tax revenue and minimizing income inequality.
- This problem can be solved in two parts using optimization techniques using the following formulation : 








**PART A : Calculating Optimal Tax Rates** 

(a) Data : The data provides information on the different income groups and the number of people in that income group. The data for this project has been taken from : 

<https://incometaxindia.gov.in/Pages/Direct-Taxes-Data.aspx>

` ![image](https://github.com/user-attachments/assets/bbca3e60-35be-4cf5-8bb1-985c5b47d984)

(b) Decision Variables : 
The decision variables represent the Tax Rate<sub>i</sub></i>  to be imposed on the 	<i>i<sub>th</sub></i>  income group. These variables are all subject to an upper bound of 100% and a lower bound of 0%.


(c) Objective Function : 

` `Maximize R ( Tax Revenue )  = Σ<sub>i</sub> (Tax Rate)<sub>i</sub> \* (Tax Base)<sub>i</sub>

- ` `*i*  denotes the *i*th income group 
- Tax Rate<sub>i</sub> is the tax imposed on the *i*<sub>th</sub> income group
- Tax Base<sub>i</sub> is the total income of *i*<sub>th</sub> income group that is subject to taxation.



(d) Constraints : 

- Economic Efficiency Constraint  : 

  The total tax collected by the government should be less than the economic efficiency threshold. If the level of taxation is higher than this threshold, it may lead to disruptions in economic behavior and hinder economic growth.

Σ<sub>i</sub> (Tax Rate)<sub>i</sub> \* (Tax Base)<sub>i</sub>  ≤ Economic Efficiency threshold



For this project, we have considered the threshold value to be 30% of the total taxable income ( sum of all taxable incomes across income groups ) .



- Budget Constraint : 

  The government’s total spending must be covered within the tax revenue generated. For this problem, we have assumed the total government spending to be 1e5\*221558.30.


  Government Spending ≤  Σ<sub>i</sub> (Tax Rate)<sub>i</sub> \* (Tax Base)<sub>i</sub>

Once we have the optimal tax rates subject to these constraints, we can now move on to the second objective, minimizing income inequality.









**PART B : Reducing income inequality**

The government has redistributive policies wherein some amount of the total tax collected is redistributed among different income groups, to reduce income disparity. For this project, we have assumed that the government decides to spend 10% of the total tax revenue on such redistributive policies. There is no income tax to be paid on this amount received by each income group.

1) Data : 

   The data required for solving this problem is obtained from Part A. The redistribution amount is :  0.1 \* Σ<sub>i</sub> (Tax Rate)<sub>i</sub> \* (Tax Base)<sub>i</sub>

1) Decision Variables : 

The decision variables represent the fraction<sub>i</sub> , that is the fraction of the total redistribution amount that the <i>i<sub>th</sub></i> income group receives. These variables are all subject to an upper bound of 1 and a lower bound of 0.

**Theory :**  

- Gini Index : 

  One way to measure income inequality is using the gini index. This is a number in between 0 and 1, where 0 represents perfect income equality among groups ( i.e. everyone has the same income ), and 1 represents perfect inequality ( i.e. all income is with one person ). The gini index can be calculated by finding out the area enclosed between the line of perfect equality and the Lorenz curve. 

1. The perfect equality line represents an economy where 10% of the population contributes 10% to the total economy, 20% of the population contributes 20% to the total economy and so on. 
1. The gini index for a given income distribution can be plotted using the following steps : 
1) Assuming that there are *n* income groups, in the ideal case,   each income group will have (100/n)% of the population. So we get the x-axis values as : 

   Population percentage : (100/n), 2\*(100/n) … n\*(100/n)

   In the perfect equality case, the contribution to total income will be exactly same as the population percentage. 

   Contribution to total income :  (100/n), 2\*(100/n) … n\*(100/n)

   Eg. For an income distribution with 10 income groups  : 

   |Population Percentage |Contribution to total Income of country |
   | :- | :- |
   |10%|10%|
   |20%|20%|
   |30%|30%|
   |40%|40%|
   |50%|50%|
   |60%|60%|
   |70%|70%|
   |80%|80%|
   |90%|90%|
   |100%|100%|

1) For the actual distribution, we first calculate the total income (by calculating : Σ<sub>i</sub> (Tax Base)<sub>i</sub>). Then, we calculate the income of the first (100/n)% of the population, and find its share in the total income. Similarly we calculate share of first (100/n)%, 2\*(100/n)% … n\*(100/n)% of the population, and plot a similar table as shown above. Note that, in this case, the population percentage and the contribution to total income will not be same. 








Eg.

|Population Percentage |Contribution to total Income of country |
| :- | :- |
|10%|2%|
|20%|10%|
|30%|13%|
|40%|15%|
|50%|25%|
|60%|45%|
|70%|60%|
|80%|75%|
|90%|80%|
|100%|100%|

(c)  Next, we plot two curves. The first curve is the perfect equality curve. The second curve is the Lorenz curve. Both the curves are plotted by taking the population percentage on the x-axis and the contribution to total income on the y-axis.



`![image](https://github.com/user-attachments/assets/32570bad-bb23-451b-87cd-6563a34dface)

(d) By calculating the areas A and B, as shown in the above figure        

the gini index can be calculated as  : A/(A+B)

- For the given data, we have 23 income groups. The two tables are calculated using code. In our code, the vecto*r cuminc* represents the y axis of the Lorenz Curve. The vector *cumincideal* represents the x-axis of Lorenz Curve and the x and y axes of the Perfect Equality Curve. The two plots turn out to be : 

`![image](https://github.com/user-attachments/assets/e98e2850-2e83-4cc0-9f1f-0480b9ecacdd)


(c)  Objective Function : 

We define [0,0.4] as the target range of gini index. Since we want to minimize income disparity, hence a lower value of gini index will be more feasible. Thus, we choose the objective function as the value of the gini index.

(d) Constraints : 

- Bounds : 

  A penalty of 10^5 is imposed when the gini index value is greater than 0.4 or less than 0. 



**2. Results**

- The two parts of the above problem are solved in succession using 4 metaheuristic algorithms ( TLBO, PSO, DE, GA ). 
- The four algorithms are run for identical population sizes and number of iterations ( with the same seed for random number generators ).
- The results are tabulated below.

**PART A :** 

**	

|**Algorithm**|**Objective Function Value (Tax Revenue)** |
| :- | :- |
|TLBO|` `20876819695392.87|
|PSO|No feasible solution found|
|DE|` `20871967769571.90|
|GA|No feasible solution found|



**PART B :** 

- Since we only found feasible solutions using TLBO and DE, we only consider their results.
- We note that, without income redistribution, the current income distribution has a gini index of 0.6163, which does not fall in the target range.We seek to minimize this number, in order to reduce income inequality.


|**Algorithm**|**Objective Function Value ( final gini index )**|
| :- | :- |
|TLBO|2\.537213392939108 \* 10^-6|
|DE |7\.660009352350450 \* 10^-5|

- Both the algorithms are able to find solutions which create a near perfect equality income distribution.
- Overall, out of the four algorithms, TLBO performs the best for the given problem and is able to maximize tax revenue and find redistribution rates that create a near perfect equality income distribution.

**3. References :** 

- The overall project idea is taken from these papers. Our problem is a highly simplified version of this problem : 

  <https://scholar.harvard.edu/files/mankiw/files/optimal_taxation_in_theory.pdf>

  <https://www.researchgate.net/publication/346377511_Application_of_Genetic_Algorithm_to_Optimal_Income_Taxation>

- The theoretical concepts have been taken from : 

  <https://www.imf.org/en/Publications/fandd/issues/2018/03/bourguignon>

  [https://ourworldindata.org/what-is-the-gini-coefficient#:~:text=The%20Gini%20coefficient%20measures%20inequality,or%20toconsumption%2C%20 per%20 capita](https://ourworldindata.org/what-is-the-gini-coefficient#:~:text=The%20Gini%20coefficient%20measures%20inequality,or%20toconsumption%2C%20per%20capita)


