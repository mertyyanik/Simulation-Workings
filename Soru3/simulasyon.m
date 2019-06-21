% Makinenin 1000 simulasyon ortalamas� sonucu ortalama 6 g�nde bo�ald��� ve
% g�nl�k ortalama 26 lira kar etti�i belirlenmi�tir.

function SONUC=simulasyon
doldurmaMaaliyet=15; % Gazoz makinesini doldurma maaliyeti.
toplamGun = 0;
ortalamaGunlukKar = 0;
for i = 1:1000 % Simulasyonu 1000 kez �al��t�r�yoruz.
    gun=0; % Gazoz makinesinin toplam ka� g�nde bo�ald���n� anlamak i�in ba�lang�� de�eri olarak 0 veriyoruz.
    j = 0;
    toplamKar = 0; % Yap�lan toplam kar.
    kumulatifTalep = 0;
    while j<=100
        j = j + 1;
        gun = gun + 1; % Gazoz makinesinin toplam ka� g�nde bo�ald���n� anlamak i�in her seferinde 1 artt�r�yoruz.
        talep = gazozTalebi; % Rastgele gazoz talebi say�s� �retiyoruz.
        kumulatifTalep = kumulatifTalep + talep;
        if (kumulatifTalep > 650) %Gazoz makinesi en fazla 650 tane satabiliyor. Dolay�s�yla toplam talep 650'den fazla olamaz. Bu durumda kar hesaplayabiliriz.
            toplamKar = 650*(0.6-0.25) - doldurmaMaaliyet - (kumulatifTalep - 650)*1; % Kar - doldurma maaliyeti - talebi kar��lanmayan m��teri maaliyeti
            gunlukKar = toplamKar / gun; % G�nl�k Kar
            j = 101;
        end
    end
    toplamGun = toplamGun + gun; % 1000 simulasyon i�in makinenin toplam ka� g�nde bo�ald���.
    ortalamaGunlukKar = ortalamaGunlukKar + gunlukKar; % 1000 simulasyon i�in yap�lan g�nl�k kar toplam�.
end
ortalamaGun = toplamGun / 1000; % Makinenin ka� g�n �al��t���n�n 1000 simulasyon ortalamas�.
ortalamaGun
ortalamaKar = ortalamaGunlukKar / 1000; % Makinenin g�nl�k yapt��� kar�n 1000 simulasyon ortalamas�.
ortalamaKar
end
        