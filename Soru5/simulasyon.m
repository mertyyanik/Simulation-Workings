% Verilen şekil sol tarafında bir üçgen, sağ
% tarafında bir üçgen oluşacak şekilde ikiye ayrılmıştır.

% Öncelikle sol tarafta ki doğrunun fonksiyonu daha sonra sağdaki doğrunun
% fonksiyonuna göre altta kalan alan sayısı hesaplanmıştır.

% Şeklin sol tarafı için fonksiyon x=y, sağ tarafı için x + y = 2 olarak
% bulunmuştur.

% 100000 simulasyon sonucunda alan 1'e yakınsamaktadır. Alanı elle
% hesapladığımız zamanda 1 elde etmekteyiz.

function SONUC = simulasyon
MCN = 100000; % Simulasyon toplamda 100.000 kez çalışacak.
teta_sapka1 = 0; % Şeklin sol tarafı için.
teta_sapka2 = 0; % Şeklin sağ tarafı için.
for mci = 1:MCN 
    % Şeklin sol tarafı için x ve y değerleri rastgele üretiliyor.
    x1 = unifrnd(0,1);
    y1 = unifrnd(0,1);
    % Şeklin sağ tarafı için x ve y değerleri rastgele üretiliyor.
    x2 = unifrnd(1,2);
    y2 = unifrnd(0,1);
    
    if x1>y1 % İlk fonksiyon için x>y ise nokta üçgenin içinde kalır.
        Z1 = 1;
    else
        Z1 = 0;
    end
    teta_sapka1 = (teta_sapka1*(mci-1)+Z1)/mci; % Monte Carlo1 hesabı.
    
    if x2+y2<2 % İkinci fonksiyon için x + y < 2 ise nokta üçgenin içinde kalır.
        Z2 = 1;
    else
        Z2 = 0;
    end
    teta_sapka2 = (teta_sapka2*(mci-1)+Z2)/mci; % Monte Carlo2 hesabı.
end
SONUC = teta_sapka1 + teta_sapka2; % İki alan toplanarak şeklin alanını monte carloya göre hesaplamış oluyoruz.
end