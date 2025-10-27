clear; close all; clc;
N = 1000; 
h = [1, 0.3, -0.1, 0.2]; 
x = randn(N, 1);  
d = filter(h, 1, x); 
%%
%%
%%
%% 2. Génération des signaux test
%% Affichage x

plot(x);
title('Signal d entrée');
xlabel(' n');

%% Affichage d 

plot(d);
title('Signal de référence');
xlabel(' n');
%% 
%%
%%
% 4. Test algolms
%% Convergence des coefficients
M = 4;
mu = 0.02;
[ws, y, e] = algolms2(x, d, M, mu);
plot(ws');
wfin = ws(:,N);
%% Signaux y, d, e évolution
figure;
hold on;
plot(1:length(y), y, 'r', 'DisplayName', 'y');
plot(1:length(d), d, 'g', 'DisplayName', 'd');
plot(1:length(e), e, 'b', 'DisplayName', 'e');
hold off;

legend;
title('Signaux y, d et e');
xlabel('Temps');
ylabel('Amplitude');
%% Tracé des coefficients finaux
figure;
subplot(2, 1, 2);
plot(1:4, wfin', '-o', 'DisplayName', 'Coefficients estimés');
title('Coefficients Estimés (ws)');
xlabel('Indice du coefficient');
ylabel('Valeur');
legend;

subplot(2, 1, 1);
plot(1:4, h, '-s', 'DisplayName', 'Vrais coefficients');
title('Vrais Coefficients (h)');
xlabel('Indice du coefficient');
ylabel('Valeur');
legend;
%%
%%
%%
% 5. Test de l'algorithme LMS

b = 0.1 * randn(N, 1);         
mu = 0.01;    
b = 0.1 * randn(N, 1);
d = filter(h, 1, x+b); 
%% Comparaison erreurs
M = [5, 10, 20];
erreurs_comparees = [];
for i = 1:length(M)
    [w, y, e] = algolms2(x, d, M(i), mu);
    err = e(1000); % erreur une fois que l'algo converge
    erreurs_comparees = [erreurs_comparees; err];
end

plot(M,erreurs_comparees);
title('Evolution de l erreur en fonction de l odre du filtre');
xlabel('Ordre du filtre W');
ylabel('Erreur');

%% Comparaison des vitesses de convergence pour différents M  

M = [5, 10, 20];
figure;
for i = 1:length(M)
    [w, y, e] = algolms2(x, d, M(i), mu);
    if M(i) == 5
        plot(w', 'k', LineWidth=2); % Noir
    elseif M(i) == 10
        plot(w', 'r', LineWidth=1); % Rouge
    elseif M(i) == 20
        plot(w', 'y', LineWidth=0.5); % Jaune
    end
    hold on;
end
title('Evolution des coefficients pour différentes tailles de filtre');
xlabel('Itérations');
ylabel('Valeurs des coefficients');
%% Influence de mu sur la vitesse de convergence

M = 4;
mu = 0.5;
figure();
[ws, y, e] = algolms2(x, d, M, mu);
plot(ws');
title('Convergence des coeffs pour mu = 0.5');
xlabel('Itérations');
ylabel('Valeur');
%%
%%
%%
%%
%%
% Partie 2 : application
%% 1. Signal audio avec une voix
%% Ecouter Voix1

[x1, fs] = audioread('Voix1.wav');
sound(x1, fs);
%% Réponse impulsionnelle
fid = fopen('voice2.dat', 'r'); 
h = fread(fid,'float32');
fclose(fid);
plot(h);
title('réponse impulsionnelle voice2.dat');
xlabel('Echantillons');
ylabel('Amplitude');
%% Filtrage
x1filt = conv(h, x1); % C'est l'écho
sound(x1filt,fs);
%% Filtrage du son + bruit 
b = 0.1 * randn(size(x1)); % C'st la parole locale
x_bruite = x1 + b;
x_bruite_filt = conv(h, x1filt); % Idem avec du bruit
sound(x_bruite_filt,fs);
%% Annulation de l'écho sans bruit
[w, y, e] = algolms2(x1, x_bruite_filt, 10000, 0.01);
sound(y,fs);