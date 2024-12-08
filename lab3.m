clc
close all
clear all
% Sukurti vektorių X su reikšmėmis intervale nuo 0 iki 1
x = 0.1:1/22:1;

% Sukurti norimo atsako vektorių pagal duotąją formulę
d = ((1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x)) / 2;

% Rankiniu būdu parinktos centrų ir spindulių reikšmės
c1 = 0.21;  % Centras 1
c2 = 0.9;  % Centras 2
r1 = 0.15;  % Spindulys 1
r2 = 0.15;  % Spindulys 2

% Gauso funkcijų skaičiavimas
%F1 = exp(-(x - c1).^2 / (2 * r1^2));
%F2 = exp(-(x - c2).^2 / (2 * r2^2));


% Inicijuojame svorius atsitiktinėmis reikšmėmis
w0 = randn(1);
w1 = randn(1);
w2 = randn(1);

% Mokymosi greitis (parenkamas rankiniu būdu)
eta = 0.01;
 
% Mokymo algoritmas (paprastas gradientinio nusileidimo principas)
for k=1:1000
    for n=1:20
        
      F1=exp(-((x(n)-c1)^2)/(2*(r1^2)));
      F2=exp(-((x(n)-c2)^2)/(2*(r2^2)));

      y(n) = F1*w1+F2*w2+w0;
      
      e = d(n)-y(n);

      w1 = w1 + eta * e * F1;
      w2 = w2 + eta * e * F2;
      w0 = w0 + eta * e;
      
    end
end

% Grafiškai atvaizduojame norimą ir modelio rezultatą
figure;
plot(x, d, 'b-', 'LineWidth', 2); hold on;
plot(x, y, 'r--', 'LineWidth', 2);
xlabel('x');
ylabel('y');
legend('Norimas atsakas', 'Modelio atsakas');
title('SBF tinklo aproksimavimas');
grid on;
