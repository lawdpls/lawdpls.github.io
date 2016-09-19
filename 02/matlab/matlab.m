bmw = csvread('cars/bmw.csv');
ford = csvread('cars/ford.csv');
merc = csvread('cars/mercedes.csv');
honda = csvread('cars/honda.csv');
toyota = csvread('cars/toyota.csv');
[a1,b1] = size(ford);
[a2,b2] = size(merc);
[a3,b3] = size(honda);
[a4,b4] = size(toyota);
bsz = bmw(:,1)/50;
fsz = ford(:,1)/50;
msz = merc(:,1)/50;
hsz = honda(:,1)/50;
tsz = toyota(:,1)/50;

hold all
s1=scatter(bmw(:,1),bmw(:,2),bsz,'filled')
s2=scatter(ford(:,1),ford(:,2),fsz,'filled')
s3=scatter(honda(:,1),honda(:,2),hsz,'filled')
s4=scatter(merc(:,1),merc(:,2),msz,'filled')
s5=scatter(toyota(:,1),toyota(:,2),tsz,'filled')
title('Cars Sample')
axis([1500,5000,8,48])
xlabel('Weight')
ylabel('MPG') 
alpha(s1,.5)
alpha(s2,.5)
alpha(s3,.5)
alpha(s4,.5)
alpha(s5,.5)

legend('show')
legend('bmw','ford','honda','mercedes','toyota')