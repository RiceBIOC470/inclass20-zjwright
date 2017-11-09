%Inclass 20
clear all
%In this folder you will find a .mat file with x and y data

% For all of the questions below, use any options as necessary to get a
% good fit - starting points, lower bounds etc. 
data=load('data.mat');
xx=data.xx(:);
yy=data.yy(:);
% 1. Define a custom model and try to fit the data to a Michaelis function 
% y = V*x/(K+x). 
fit_str1='(V*x/(K+x))';
fitmodel_1=fittype(fit_str1);
[fit_out1, fit_metric1]=fit(xx,yy,fitmodel_1);
figure(1)
plot(fit_out1, xx,yy)

% 2. Use a custom model to try to fit the data to a Hill function with
% exponent 2: y = V*x^2/(K^2+x^2)
fit_str2='(V*x^2/(K^2+x^2))';
fitmodel_2=fittype(fit_str2);
[fit_out2, fit_metric2]=fit(xx,yy,fitmodel_2);
figure(2)
plot(fit_out2, xx,yy)

% 3. Now treat the exponent as a free parameter and perform the fit again,
% that is fit to the model y = V*x^n/(K^n+x^n)
fit_str3='(V*x^n/(K^n+x^n))';
fitmodel_3=fittype(fit_str3, 'problem', {'V', 'K'});
[fit_out3, fit_metric3]=fit(xx,yy,fitmodel_3, 'problem', {5, 5});
figure(3)
plot(fit_out3, xx,yy)

% 4. Redo parts 1 and 2, but using your model from 3 and fixing the value of
% n to either 1 or 2. (treat n as the 'problem')
fit_str4='(V*x^n/(K^n+x^n))';
fitmodel_4=fittype(fit_str4, 'problem', {'n'});
[fit_out4, fit_metric4]=fit(xx,yy,fitmodel_4, 'problem', {2});
figure(4)
plot(fit_out4, xx,yy)
%2 works better than 1