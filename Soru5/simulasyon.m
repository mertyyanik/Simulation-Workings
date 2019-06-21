% Verilen �ekil sol taraf�nda bir ��gen, sa�
% taraf�nda bir ��gen olu�acak �ekilde ikiye ayr�lm��t�r.

% �ncelikle sol tarafta ki do�runun fonksiyonu daha sonra sa�daki do�runun
% fonksiyonuna g�re altta kalan alan say�s� hesaplanm��t�r.

% �eklin sol taraf� i�in fonksiyon x=y, sa� taraf� i�in x + y = 2 olarak
% bulunmu�tur.

% 100000 simulasyon sonucunda alan 1'e yak�nsamaktad�r. Alan� elle
% hesaplad���m�z zamanda 1 elde etmekteyiz.

function SONUC = simulasyon
MCN = 100000; % Simulasyon toplamda 100.000 kez �al��acak.
teta_sapka1 = 0; % �eklin sol taraf� i�in.
teta_sapka2 = 0; % �eklin sa� taraf� i�in.
for mci = 1:MCN 
    % �eklin sol taraf� i�in x ve y de�erleri rastgele �retiliyor.
    x1 = unifrnd(0,1);
    y1 = unifrnd(0,1);
    % �eklin sa� taraf� i�in x ve y de�erleri rastgele �retiliyor.
    x2 = unifrnd(1,2);
    y2 = unifrnd(0,1);
    
    if x1>y1 % �lk fonksiyon i�in x>y ise nokta ��genin i�inde kal�r.
        Z1 = 1;
    else
        Z1 = 0;
    end
    teta_sapka1 = (teta_sapka1*(mci-1)+Z1)/mci; % Monte Carlo1 hesab�.
    
    if x2+y2<2 % �kinci fonksiyon i�in x + y < 2 ise nokta ��genin i�inde kal�r.
        Z2 = 1;
    else
        Z2 = 0;
    end
    teta_sapka2 = (teta_sapka2*(mci-1)+Z2)/mci; % Monte Carlo2 hesab�.
end
SONUC = teta_sapka1 + teta_sapka2; % �ki alan toplanarak �eklin alan�n� monte carloya g�re hesaplam�� oluyoruz.
end