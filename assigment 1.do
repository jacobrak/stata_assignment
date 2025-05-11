// A)

use "ps1_data1.dta", clear
set seed 12345
splitsample, generate(svar) balance(schoolid) values(0, 1)

gen miss = 0
gen rand = runiform()
replace miss = 1 if rand<0.5

// You could simply do runiform again on the 1's and 0's seperatly there you would have 4 classes ["0", "1", "2", "3"]

// b)

quietly ttest pre_verb, by(svar)
display  ///
  "Control mean = "   %6.3f r(mu_1)   ///
  ", Treatment mean = " %6.3f r(mu_2)  ///
  ", Diff = "          %6.3f (r(mu_2)-r(mu_1)) ///
  ", SE = "            %6.3f r(se)     ///
  ", p-value = "       %6.3f r(p)

quietly ttest pre_math,by(svar)
display  ///
  "Control mean = "   %6.3f r(mu_1)   ///
  ", Treatment mean = " %6.3f r(mu_2)  ///
  ", Diff = "          %6.3f (r(mu_2)-r(mu_1)) ///
  ", SE = "            %6.3f r(se)     ///
  ", p-value = "       %6.3f r(p)

quietly ttest pre_tot, by(svar)
display  ///
  "Control mean = "   %6.3f r(mu_1)   ///
  ", Treatment mean = " %6.3f r(mu_2)  ///
  ", Diff = "          %6.3f (r(mu_2)-r(mu_1)) ///
  ", SE = "            %6.3f r(se)     ///
  ", p-value = "       %6.3f r(p)

quietly ttest male, by(svar)
display  ///
  "Control mean = "   %6.3f r(mu_1)   ///
  ", Treatment mean = " %6.3f r(mu_2)  ///
  ", Diff = "          %6.3f (r(mu_2)-r(mu_1)) ///
  ", SE = "            %6.3f r(se)     ///
  ", p-value = "       %6.3f r(p)

// 2b)
use "ps1_data1.dta", clear
set seed 1

splitsample, generate(svar) balance(schoolid) values(0, 1)
quietly ttest pre_verb, by(svar)
display  ///
  "Control mean = "   %6.3f r(mu_1)   ///
  ", Treatment mean = " %6.3f r(mu_2)  ///
  ", Diff = "          %6.3f (r(mu_2)-r(mu_1)) ///
  ", SE = "            %6.3f r(se)     ///
  ", p-value = "       %6.3f r(p)

quietly ttest pre_math, by(svar)
display  ///
  "Control mean = "   %6.3f r(mu_1)   ///
  ", Treatment mean = " %6.3f r(mu_2)  ///
  ", Diff = "          %6.3f (r(mu_2)-r(mu_1)) ///
  ", SE = "            %6.3f r(se)     ///
  ", p-value = "       %6.3f r(p)

quietly ttest pre_tot,by(svar)
display  ///
  "Control mean = "   %6.3f r(mu_1)   ///
  ", Treatment mean = " %6.3f r(mu_2)  ///
  ", Diff = "          %6.3f (r(mu_2)-r(mu_1)) ///
  ", SE = "            %6.3f r(se)     ///
  ", p-value = "       %6.3f r(p)

quietly ttest male, by(svar)
display  ///
  "Control mean = "   %6.3f r(mu_1)   ///
  ", Treatment mean = " %6.3f r(mu_2)  ///
  ", Diff = "          %6.3f (r(mu_2)-r(mu_1)) ///
  ", SE = "            %6.3f r(se)     ///
  ", p-value = "       %6.3f r(p)
// second
use "ps1_data1.dta", clear
set seed 300

splitsample, generate(svar) balance(schoolid) values(0, 1)
quietly ttest pre_verb, by(svar)
display  ///
  "Control mean = "   %6.3f r(mu_1)   ///
  ", Treatment mean = " %6.3f r(mu_2)  ///
  ", Diff = "          %6.3f (r(mu_2)-r(mu_1)) ///
  ", SE = "            %6.3f r(se)     ///
  ", p-value = "       %6.3f r(p)

quietly ttest pre_math, by(svar)
display  ///
  "Control mean = "   %6.3f r(mu_1)   ///
  ", Treatment mean = " %6.3f r(mu_2)  ///
  ", Diff = "          %6.3f (r(mu_2)-r(mu_1)) ///
  ", SE = "            %6.3f r(se)     ///
  ", p-value = "       %6.3f r(p)

quietly ttest pre_tot, by(svar)
display  ///
  "Control mean = "   %6.3f r(mu_1)   ///
  ", Treatment mean = " %6.3f r(mu_2)  ///
  ", Diff = "          %6.3f (r(mu_2)-r(mu_1)) ///
  ", SE = "            %6.3f r(se)     ///
  ", p-value = "       %6.3f r(p)

quietly ttest male, by(svar)
display  ///
  "Control mean = "   %6.3f r(mu_1)   ///
  ", Treatment mean = " %6.3f r(mu_2)  ///
  ", Diff = "          %6.3f (r(mu_2)-r(mu_1)) ///
  ", SE = "            %6.3f r(se)     ///
  ", p-value = "       %6.3f r(p)
  
  // Somehow i get the same p-value for pre_tot maybe something weird with the splitsample function. We would expect different samples from taking a different selection
  
  // 3b) depending on the null hypothesis using a 95% would mean we would expect 5 different ones
  
 // c)
 
 use "ps1_data2.dta", clear
set seed 0
splitsample, generate(svar) values(0, 1)

quietly ttest post_verb, by(svar)
display  ///
  "Control mean = "   %6.3f r(mu_1)   ///
  ", Treatment mean = " %6.3f r(mu_2)  ///
  ", Diff = "          %6.3f (r(mu_2)-r(mu_1)) ///
  ", SE = "            %6.3f r(se)     ///
  ", p-value = "       %6.3f r(p)
  
quietly ttest post_math, by(svar)
display  ///
  "Control mean = "   %6.3f r(mu_1)   ///
  ", Treatment mean = " %6.3f r(mu_2)  ///
  ", Diff = "          %6.3f (r(mu_2)-r(mu_1)) ///
  ", SE = "            %6.3f r(se)     ///
  ", p-value = "       %6.3f r(p)
  
quietly ttest post_tot, by(svar)
display  ///
  "Control mean = "   %6.3f r(mu_1)   ///
  ", Treatment mean = " %6.3f r(mu_2)  ///
  ", Diff = "          %6.3f (r(mu_2)-r(mu_1)) ///
  ", SE = "            %6.3f r(se)     ///
  ", p-value = "       %6.3f r(p)
// with p-values of approx. 0.5 we cannot reject the null hypothesis this means the control and treaments means are the same for all 3 groups 

// conf interval

ttest post_verb, by(svar)

// with a 95% chance the true mean will after infinte itterations be in the interval 95% of the time [19.88377    23.29065] and  [19.6465    21.86622]

// male is a float? i dont understand will just round
replace male = 1 if male>=0.5
replace male = 0 if male<0.5
ttest post_verb, by(male)

// We cannot reject the null hypothesis

// I would not put in post_verb as a treatment variable because of its post treatement effect 

reg post_tot pre_math pre_verb 
reg post_tot pre_math pre_verb male
reg post_tot pre_math pre_verb post_verb
reg post_tot pre_math pre_verb post_verb male

// Not weird at all because we introduce bias with the post_verb because of the. Male however is fine because it is a pretrement and allows us to controll for gender however still low p-value