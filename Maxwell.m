function f = Maxwell()
clear all;
reset(symengine);
%This is a function which computes the Maxwell-Boltzmann distribution of an
%idealized gas with certain molecular mass (g/mol) and speed (m/s) at
%certain temperature (K).
%
%Usage: Maxwell(molar mass,speed,temperature)
%The speed requires to be a range of speed in order to show the
%distribution. The minimum of speed is set to be 0 m/s and user is required
%to input the maximum speed of the idealized gases.
M = input('What is the molar mass (g/mol)of the molecules?')
v = input('What is the maximum speed (m/s)of the molecules?')
T = input('What is the temperature (K) of the distribution?')
M_kg=M/1000;
x = linspace(0, v);
% Since the original unit of molecular mass is in g/mol, it has to be
% divided by 1000 in order to convert to kg/mol, which is the unit used for
% molecular mass in the formula of Maxwell-Boltzmann distribution.
y = 4.*pi.*(((M_kg/(2.*pi.*8.3145.*T)).^(3/2)).*(x.^2).*exp(-(M_kg.*(x.^2))/(2.*8.3145.*T)));
plot(x,y)
legend([num2str(T) ' K'])
title(['Maxwell-Boltzmann distribution function at ' num2str(T) ' K']);
ylabel('f(E) Distribution function');
xlabel('Speed of Gases (m/s)');