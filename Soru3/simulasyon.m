% Makinenin 1000 simulasyon ortalamasý sonucu ortalama 6 günde boþaldýðý ve
% günlük ortalama 26 lira kar ettiði belirlenmiþtir.

function SONUC=simulasyon
doldurmaMaaliyet=15; % Gazoz makinesini doldurma maaliyeti.
toplamGun = 0;
ortalamaGunlukKar = 0;
for i = 1:1000 % Simulasyonu 1000 kez çalýþtýrýyoruz.
    gun=0; % Gazoz makinesinin toplam kaç günde boþaldýðýný anlamak için baþlangýç deðeri olarak 0 veriyoruz.
    j = 0;
    toplamKar = 0; % Yapýlan toplam kar.
    kumulatifTalep = 0;
    while j<=100
        j = j + 1;
        gun = gun + 1; % Gazoz makinesinin toplam kaç günde boþaldýðýný anlamak için her seferinde 1 arttýrýyoruz.
        talep = gazozTalebi; % Rastgele gazoz talebi sayýsý üretiyoruz.
        kumulatifTalep = kumulatifTalep + talep;
        if (kumulatifTalep > 650) %Gazoz makinesi en fazla 650 tane satabiliyor. Dolayýsýyla toplam talep 650'den fazla olamaz. Bu durumda kar hesaplayabiliriz.
            toplamKar = 650*(0.6-0.25) - doldurmaMaaliyet - (kumulatifTalep - 650)*1; % Kar - doldurma maaliyeti - talebi karþýlanmayan müþteri maaliyeti
            gunlukKar = toplamKar / gun; % Günlük Kar
            j = 101;
        end
    end
    toplamGun = toplamGun + gun; % 1000 simulasyon için makinenin toplam kaç günde boþaldýðý.
    ortalamaGunlukKar = ortalamaGunlukKar + gunlukKar; % 1000 simulasyon için yapýlan günlük kar toplamý.
end
ortalamaGun = toplamGun / 1000; % Makinenin kaç gün çalýþtýðýnýn 1000 simulasyon ortalamasý.
ortalamaGun
ortalamaKar = ortalamaGunlukKar / 1000; % Makinenin günlük yaptýðý karýn 1000 simulasyon ortalamasý.
ortalamaKar
end
        