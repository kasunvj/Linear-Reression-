function out = predict_output(input)
clear all;
database1 = 'Regression_database.xlsx' ;
X = xlsread (database1,'A1:A16'); 
Y = xlsread (database1, 'B1:B16');

ones_clm = ones(size(X),1);
gama = Y;  % 10*1
psi = [X , ones_clm]; % 10*2
tita = zeros(2,1); % 2*1

psi_T_psi = (psi') * (psi) ;% 2*10 and 10*2 = 2*2
psi_T_gama = (psi')* (gama) ;% 2*10 and 10*1 =2*1

tita = inv(psi_T_psi)* psi_T_gama; %2*1 and 2*2

figure()
scatter(X, Y)

hold on;

x = 1:size(X);
y= tita(1,1)*x + tita(2,1) ;

plot(x,y)
out = tita(1,1)*input + tita(2,1); 