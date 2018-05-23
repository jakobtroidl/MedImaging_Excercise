% Das erste Beispiel dient einerseits dem Vertrautwerden mit Matlab und andererseits
% dazu, das Verstandis der PCA (Principal Component Analysis) zu vertiefen.
% Ziel des Beispiels ist die Implementierung einer PCA (Principal Component
% Analysis) und die Untersuchung ihrer grundlegenden Eigenschaften. Teile des Codes
% werden zur Verfugung gestellt (Daten, Plotfunktionen, etc) um die Konzentration
% aufs Wesentliche zu erleichtern.

% 2.1 Vorhandene Hilfsfunktionen
% plot2DPCA.m und plot3DPCA.m konnen verwendet werden, um Datenpunkte, Eigenvektoren,
% Eigenwerte, Ellipsen/Ellipsoide und rekontruierte Daten zu plotten.
% plotDEMO.m zeigt die Moglichkeiten, open plot2DPCA.m zeigt die Dokumentation
% und Verwendung.
% Evtl benotigte Matlab Funktionen sind unter anderem: clear, close all,
% load, plot (dazu als Parameter ,'.' fur Punkte), axis equal, bar, imagesc,
% repmat, mean, var, std, sort, mvnrnd und eig. Informationen zu den Matlab-
% Funktionen mit doc Funktionsname.

% 2.2 Fragestellung
% In Klammer jeweils die erreichbare Punktezahl, insgesamt 30 Punkte.
% Fuer alle Punkte wird angenommen, dass die n Datenpunkte d Dimensionen
% haben und in einer dxn-Matrix D vorliegen. D.h. 2xn fuer 2D und 3xn fuer 3D.

% 1. Kovarianzmatrix
% (a) Schreiben Sie eine Funktion ourCov.m, die die Kovarianzmatrix C fuer
% D berechnet. Die Verwendung der Matlab Funktion cov ist zur Berechnung
% nicht erlaubt, aber kann zum Ergebnis-Vergleich verwendet
% werden (cov erwartet eine nxd Matrix). (2 Punkte)

% -> ourCov.m



% (b) Berechnen Sie C fuer die Daten in daten.mat. Zeigen Sie die Daten
% mit plot in separaten Figures und stellen Sie die Skalierung auf axis
% equal. Interpretieren Sie die unterschiedlichen C zwischen den Datensets!
% Welche Informationen stehen an welcher Stelle von C? (2 Punkte)

D = load('daten.mat');

D1 = D.data1;
D2 = D.data2;
D3 = D.data3;
D4 = D.data4;

c1 = ourCov(D1,1);
figure('Name','Matrix 1');
plot(D1(1,:), D1(2,:),'*');
axis on
axis equal

c2 = ourCov(D2,1);
figure('Name','Matrix 2');
plot(D2(1,:), D2(2,:),'*');
axis on
axis equal

c3 = ourCov(D3,1);
figure('Name','Matrix 3');
plot(D3(1,:), D3(2,:),'*');
axis on
axis equal

c4 = ourCov(D4,1);
figure('Name','Matrix 4');
plot(D4(1,:), D4(2,:),'*');
axis on
axis equal



% 2. PCA { Schreiben Sie eine Funktion pca.m, die die PCA fuer D berechnet. Die
% Berechnung soll unabhaengig von der Dimension der Daten sein. Ergebnis sind
% die absteigend sortierten Eigenwerte und die nach absteigenden Eigenwerten
% sortierten, normierten Eigenvektoren. Sie koennen fuer die Berechnung der
% Eigenvektoren/-werte die Matlab Funktion eig verwenden. (2 Punkte)

% -> pca.m

[eVal1,eVec1]=pca(D1,1);
[eVal2,eVec2]=pca(D2,1);
[eVal3,eVec3]=pca(D3,1);
[eVal4,eVec4]=pca(D4,1);


% (a) Plotten Sie mit plot2DPCA.m Ihre Ergebnisse fuer die Daten aus daten.mat.
% ( 1 Punkt)

% disp('2d pca D1 ')
% D1trans = transpose(D1);
% dummyReconstruction1 = D1trans;  % here you would use your reconstructed data
% plot2DPCA(D1trans, mean(D1trans), dummyReconstruction1, eVec1, eVal1, 1, 1);

% disp('2d pca D2 ')
% D2trans = transpose(D2);
% dummyReconstruction2 = D2trans;  % here you would use your reconstructed data
% plot2DPCA(D2trans, mean(D2trans), dummyReconstruction2, eVec2, eVal2, 1, 1);

% disp('2d pca D3 ')
% D3trans = transpose(D3);
% dummyReconstruction3 = D3trans;  % here you would use your reconstructed data
% plot2DPCA(D3trans, mean(D3trans), dummyReconstruction3, eVec3, eVal3, 1, 1);
% 
% disp('2d pca D4 ')
% D4trans = transpose(D4);
% dummyReconstruction4 = D4trans;  % here you would use your reconstructed data
% plot2DPCA(D4trans, mean(D4trans), dummyReconstruction4, eVec4, eVal4, 1, 1);

% (b) Was geben die Eigenvektoren an? Wo sieht man das im Plot? (1.5
% Punkt)



% (c) Was geben die Eigenwerte an? Wo sieht man das im Plot? In welcher
% Relation stehen sie zur Gesamtvarianz? (1.5 Punkte)



% (d) Welchen Einfluss hat ein fehlender Mittelwertabzug (bei D) auf die
% Berechnung? (1 Punkt)
% Eigenvektoren werden auf Nullpunkt verschoben
% disp('2d pca D1 ')
% D1trans = transpose(D1);
% dummyReconstruction1 = D1trans;  % here you would use your reconstructed data
% plot2DPCA(D1trans, mean(D1trans), dummyReconstruction1, eVec1, eVal1, 1, 1);
% 
% [eVal1_0,eVec1_0]=pca(D1,0);
% disp('2d pca D1 ')
% D1trans = transpose(D1);
% dummyReconstruction1 = D1trans;  % here you would use your reconstructed data
% plot2DPCA(D1trans, mean(D1trans), dummyReconstruction1, eVec1_0, eVal1_0, 1, 1);

% 3. Unterraum-Projektion
% (a) Berechnen Sie die PCA fur data3. Projiziieren Sie die Daten in data3
% auf den Hauptvektor (Plot). Welche Dimension haben Ihre Daten jetzt?
% Rekonstruieren Sie die Projektion und plotten Sie das Ergebnis mittels
% plot2DPCA.m. Beschreiben Sie den Eekt von Projektion und Rekonstruktion
% auf die Datenpunkte. Wie gro ist der Durchschnittliche Fehler
% zwischen Rekonstruktion und Originaldaten? (3 Punkte)
[eVal3,eVec3]=pca(D3,1);
meanD3=mean(transpose(D3));

D3_hv_zent =  D3-repmat(transpose(meanD3),1,size(D3,2)); %zentrieren
D3_hv_rot  =  transpose(eVec3)*D3_hv_zent; % Rotation, sodass die Eigenvektoren die X und Y Achse sind
D3_hv_proj =  [D3_hv_rot(1,:);zeros(1,size(D3_hv_rot,2))];
D3_hv_rec  =  eVec3*D3_hv_proj; %inverse of eVec3 = transpose of eVec3, wegen gleicher orthonormal basis
D3_hv_shift =  D3_hv_rec+repmat(transpose(meanD3),1,size(D3,2)); %rezentrieren

disp('2d pca D3_hv ')
plot2DPCA(transpose(D3), meanD3, transpose(D3_hv_shift), eVec3, eVal3, 1, 1);

%Durchschnittlicher Fehler


D3_hv_diff = D3-D3_hv_shift;
for i=1:size(D3,2)
   D3_hv_distance(i)=norm(D3_hv_diff(:,i)); 
end
D3_hv_err_hv = mean(transpose(D3_hv_distance))

% (b) Machen Sie die selbe Untersuchung, nur mit dem Nebenvektor. Welche
% Eigenvektoren werden Sie verwenden, um eine Datenmatrix mit
% moglichst wenig Fehler mit moglichst wenig Eigenvektoren (in diesem
% Fall 1) darzustellen? (1 Punkt)
[eVal3,eVec3]=pca(D3,1);
meanD3=mean(transpose(D3));

D3_nv_zent =  D3-repmat(transpose(meanD3),1,size(D3,2)); %zentrieren
D3_nv_rot  =  transpose(eVec3)*D3_nv_zent; % Rotation, sodass die Eigenvektoren die X und Y Achse sind
D3_nv_proj =  [zeros(1,size(D3_nv_rot,2));D3_nv_rot(2,:)];
D3_nv_rec  =  eVec3*D3_nv_proj; %inverse of eVec3 = transpose of eVec3, wegen gleicher orthonormal basis
D3_nv_shift =  D3_nv_rec+repmat(transpose(meanD3),1,size(D3,2)); %rezentrieren

disp('2d pca D3_nv ')
plot2DPCA(transpose(D3), meanD3, transpose(D3_nv_shift), eVec3, eVal3, 1, 1);

%Durchschnittlicher Fehler

D3_nv_diff = D3-D3_nv_shift;
for i=1:size(D3,2)
   D3_nv_distance(i)=norm(D3_nv_diff(:,i)); 
end
D3_nv_distance;
D3_nv_err_nv = mean(transpose(D3_nv_distance))



% 4. Untersuchungen in 3D
% (a) Berechnen Sie die PCA und plotten Sie Daten und Eigenvektoren fuer
% die Daten in daten3d.mat. Beschreiben Sie die Relation von Kovarianzmatrix
% (Varianzen), Eigenwerten und -vektoren und den Ellipsoiden
% der Standardabweichungen. (2 Punkt)

D3D=load('daten3d.mat');
D3D=D3D.data;
meanD3D=mean(transpose(D3D));
[eValD3D,eVecD3D]=pca(D3D,1);
plot3DPCA(transpose(D3D), meanD3D, eVecD3D, eValD3D, 1, 0)

% (b) Projiziieren Sie auf den Unterraum, der durch die ersten beiden Eigenvektoren
% aufgespannt wird. Welche Dimension haben Ihre Daten?
% Rekonstruieren Sie die Punkte im Originalraum und plotten Sie das
% Ergebnis. Welche Information ist verloren gegangen? (1 Punkt)

D3D_zent =  D3D-repmat(transpose(meanD3D),1,size(D3D,2)); %zentrieren
D3D_rot  =  transpose(eVecD3D)*D3D_zent; % Rotation, sodass die Eigenvektoren die X, Y und Z Achse sind
D3D_proj =  [D3D_rot(1,:);D3D_rot(2,:);zeros(1,size(D3D_rot,2))];
D3D_rec  =  eVecD3D*D3D_proj; %inverse of eVec3 = transpose of eVec3, wegen gleicher orthonormal basis
D3D_shift =  D3D_rec+repmat(transpose(meanD3D),1,size(D3D,2)); %rezentrieren

plot3DPCA(transpose(D3D_shift), meanD3D, eVecD3D, eValD3D, 1, 1);

% 5. Shape Modell
% (a) Berechnen Sie die PCA der Shape Daten in shape.mat die Matrix
% aligned hat die Dimensionen nPunkte x nDimensionen x nShapes.
% Schreiben Sie eine Funktion generateShape, die zu einem Parametervektor
% b mit einer Lange entsprechend der Zahl der Eigenvektoren neue
% Shapes generieren kann.(4 Punkt)

shapes = load('shapes.mat'); %Daten laden
shapes = shapes.aligned; %aligned auswaehlen

%%von Jakob:
%for i = 1 : size(shapes,1)
%    point = shapes(i,:,:);
%    C = permute(point,[1 3 2])
%    C = reshape(C,[],size(point,2),1)
%    C = C.'
%%end


%3dim Matrix in 2dim Matrix speichern: ([x(1 1);y(1 1);x(2 1);y(2
%1);...],...,[x(1 14);...])
for i=1:14
    for j=1:128
        shapesmat(j*2,i)=shapes(j,2,i);
        shapesmat(j*2-1,i)=shapes(j,1,i);
    end
end

%LÖSCHEN shapes normieren, bzw verzerrung entfernen??
shapesmean=mean(shapesmat'); %mean aller Punkte
shapesmatwom=shapesmat-shapesmean'; %shapes without mean
[shapeseVal,shapeseVec]=pca(shapesmatwom,1); %pca berechnen

% -> generateShape

%10Bsp mit random vector (blau) + mean shape (rot):
plot([shapesmean(1:2:256),shapesmean(1)],[shapesmean(2:2:256),shapesmean(2)],'r')
hold on
numposeVal=sum(shapeseVal>0.0000000001);%Anzahl Eigenwerte > 0
for i=1:10
    bnew=round(randn(numposeVal,1)*10);
    xnew=generateShape(bnew,shapeseVec,shapesmean);
    plot([xnew(1:2:256);xnew(1)],[xnew(2:2:256);xnew(2)],'b')
end
    
% (b) Schreiben Sie eine Funktion plotShape, die die Shapes in blau darstellt
% und plotten und interpretieren Sie die Einzelnen Modes (d.h. b ist 0
% bis auf einen Wert) im Bereich von +/-3 lambda, wobei lambda die Standardabweichung
% des entprechenden Modes bezeichnet. Die Funktion soll gleichzeitig
% auch das mean shape (d.h. b gleich dem Nullvektor) in rot darstellen.
% Beschreiben und interpretieren Sie. (4 Punkt)

%LÖSCHEN "Shapes in blau darstellt" -> alle shapes in grunddaten darstellen? (14
%stück)??
plotShape(shapeseVal,shapeseVec,shapesmean);

% (c) Setzen Sie nun b=randn(1,nEigenvectors).*stddeviations. Beschraenken
% Sie nun wie in den 2D und 3D Beispielen die Zahl der Eigenvektoren,
% dementsprechend die Laenge von b, plotten Sie die resultierenden Shapes
% und interpretieren Sie. Beschraenken Sie so, dass das Shape Modell
% 100%, 95%, 90% und 80% der Gesamtvarianz beinhaltet.(4 Punkt)

antgesamtvar=shapeseVal(1:numposeVal)/sum(shapeseVal(1:numposeVal)); %Anteil der Gesamtvarianz
kumgesamtvar=cumsum(antgesamtvar); %kumulierte Gesamtvarianz


%Shape Modell mit 100% der Gesamtvarianz
nEigenvectors=numposeVal;%Gesamtvarianz entspricht der Anzahl aller positiven Eigenwerte
stddeviations=sqrt(shapeseVal(1:nEigenvectors))'; %Varianz=Stdabw.^2
b100=randn(1,nEigenvectors).*stddeviations;
shapenew100=generateShape(b100',shapeseVec,shapesmean);

%Shape Modell mit 95% der Gesamtvarianz
nEigenvectors=5;%kumgesamtvar(5)=0.9633
stddeviations=sqrt(shapeseVal(1:nEigenvectors))'; %Varianz=Stdabw.^2
b95=randn(1,nEigenvectors).*stddeviations;
shapenew95=generateShape(b95',shapeseVec,shapesmean);

%Shape Modell mit 90% der Gesamtvarianz
nEigenvectors=3;%kumgesamtvar(3)=0.9058
stddeviations=sqrt(shapeseVal(1:nEigenvectors))'; %Varianz=Stdabw.^2
b90=randn(1,nEigenvectors).*stddeviations;
shapenew90=generateShape(b90',shapeseVec,shapesmean);

%Shape Modell mit 80% der Gesamtvarianz
nEigenvectors=2;%kumgesamtvar(2)=0.7928
stddeviations=sqrt(shapeseVal(1:nEigenvectors))'; %Varianz=Stdabw.^2
b80=randn(1,nEigenvectors).*stddeviations;
shapenew80=generateShape(b80',shapeseVec,shapesmean);

%Alles ploten:
plot([shapenew80(1:2:256);shapenew80(1)],[shapenew80(2:2:256);shapenew80(2)])
hold on
plot([shapenew90(1:2:256);shapenew90(1)],[shapenew90(2:2:256);shapenew90(2)])
plot([shapenew95(1:2:256);shapenew95(1)],[shapenew95(2:2:256);shapenew95(2)])
plot([shapenew100(1:2:256);shapenew100(1)],[shapenew100(2:2:256);shapenew100(2)])
plot([shapesmean(1:2:256),shapesmean(1)],[shapesmean(2:2:256),shapesmean(2)])
hold off
legend({'80% of Totvar','90% of Totvar','95% of Totvar','100% of Totvar','MeanShape'})
