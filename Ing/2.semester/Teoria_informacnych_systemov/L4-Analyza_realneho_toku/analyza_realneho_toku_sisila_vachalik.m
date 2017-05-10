% Anal�za v�skytu paketov v nameranom PCAP z�zname
% 
% 1. 3 r�zne histogramy pod?a zvolen�ch tried a vhodn� zobrazenie medzier (pr�rastkov� a kumulat�vne)
% 
% 2. A aproximova? pomocou Erlangov�ch rozdelen�
% 
% 3. slotovanie na 4, otestovat Bernoulliho a Poissonove modely , histogramy
% 
% 4. slotovanie na 4., ur?i? parametre MMRP pomocou pravdepodobnosti peaku
% 
% 5. slotovanie na 4., zlep�i? parametre MMRP (numericky, zn�en�m vzdialenosti)
clear
close all

times = csvread('C:\Users\Andrej\Desktop\m4.csv');

%==========================================================================
%3 r�zne histogramy pod?a zvolen�ch tried
figure, histogram(times, 4);
figure, histogram(times, 5);    % najkrajsi graf
figure, histogram(times, 6);

%vhodn� zobrazenie medzier (pr�rastkov� a kumulat�vne)
figure, plot(times);

m_cumul = cumsum(times);
figure, plot(m_cumul);


%==========================================================================
% 2. A aproximova? pomocou Erlangov�ch rozdelen�
% ET = repmat(mean(times), size(times), 1);
% odchylka = (sum((times - ET)))^2
% 
% ni = odchylka / ET(1)
% 
% n = 1/ni
% 
% b = n / ET(1)
% 
% f := stats::erlangPDF(2, 1):
% f(-infinity), f(-PI), f(1/2), f(0.5), f(PI), f(infinity)

ET = mean(times);
odchylka = std(times);
ni = odchylka / ET(1);
n = 1/ni
b = n / ET(1)

%==========================================================================
% 3. slotovanie na 4, otestovat Bernoulliho a Poissonove modely , histogramy
min_medzera = min(times)

