close all;
clear all;

# initialisaton
colors = ["k", "r", "g", "b", "y", "m", "c", "w"];

# chargement
load 'BY_resultat_de_OpenCV.csv';
res=BY_resultat_de_OpenCV;
normaliser = max(max(res(:,2:3)));

for i=1:size(res,1)
  # recupération des positions
  # repère image vers repère cartésien : x = i et y = -j 
  x = res(i,2)./normaliser;
  y = -res(i,3)./normaliser;
  
  # tarnsformation en bird eye (vue du ciel)
  ######## TODO Decommenter cette partie pour voir le resultat
  z = (y * 0.017452 - 25.0) / (y * 2.9058 - 0.99985);
  x = x * (166.5 * z - 1);
  y = y * (166.5 * z - 1);

  # Affichage
  color = colors(mod(res(i,4),8) + 1);
  plot(x, y, [color "*"]);
  hold on;
  pause(0.00001)
endfor
