%Simulasyon, saat�i me�gul ise ba�ka m��teri kabul etmeyece�i d���n�lerek
%haz�rlanm��t�r.

function SONUC=simulasyon
simulasyonToplam = 0;
for k = 1:50 % Simulasyonu 10 kere tekrarlayal�m.
    yilSonuKar = 0; % Y�l sonu kar i�in.
    for j = 1:365 % 1 y�l�n sonunda ki kar soruluyor. Dolay�s�yla b�t�n i�lemleri 365 kere ger�ekle�tirebiliriz.
        g(1) = 0;
        h(1) = onarimSuresi; %Onar�m s�resi
        a(1) = g(1) + h(1); % ��k�� Zaman�
        kazandigiPara = 0;
        toplamMaaliyet = 0;
        toplamKar = 0;
        for i = 2:100
            g(i) = g(i-1) + musteriGelmesi; % Geli� s�resi + geli�leraras� s�re.
            if g(i) < 660 % Saat�i 11 saatten fazla �al��m�yor.
                if (g(i) >= a(i-1))
                    h(i) = onarimSuresi; % Onar�m s�resi i�in rastgele say�.
                    a(i) = g(i) + h(i); %Geli� s�resi + onar�m s�resi.
                    satinAlma = satinAlmaDurumu; % Saat�i, saati tamir mi etti yoksa sat�n m� almak istedi?
                    bozukParca = bozukKisim; % Saatin hangi par�as� bozuk?
                    if satinAlma == 1 % Saat sat�n al�nmad�.
                        if bozukParca == 1 % Bozuk par�a mekanik ise.
                            kazandigiPara = kazandigiPara + 20;
                        else if bozukParca == 2 % Bozuk par�a elektronik ise.
                            kazandigiPara = kazandigiPara + 30;
                        else if bozukParca == 3 % Her iki par�ada bozuk ise.
                            kazandigiPara = kazandigiPara + 30 + 20;
                            end
                            end
                        end
                    else if satinAlma == 0 % Saat sat�n al�nd�. Bu durumda maaliyet hesab� yap�lacak. Ko�ul ne olursa olsun saatin kasas� i�in 20 TL �deyecek.
                        if bozukParca == 1 %Bozuk par�a mekanik ise.
                            toplamMaaliyet = toplamMaaliyet + 20 + 20 + 5;
                        else if bozukParca == 2 % Bozuk par�a elektronik ise.
                            toplamMaaliyet = toplamMaaliyet + 20 + 10; % Bozuk elektronik par�a i�in para �demiyor. Sadece sa�lam b�l�m ve kasa.
                        else if bozukParca == 3 % Her iki par�ada bozuk ise.
                            toplamMaaliyet = toplamMaaliyet + 20 + 5;
                        end
                        end
                        end
                        end
                    end
                else % O an m��terisi varsa ba�ka m��teri kabul etmiyor.
                    a(i) = 0;
                end
            else
                break % Saat�inin �al��mas� s�resi 660 '� ge�ti ise sistem duruyor.
            end
        end
        toplamKar = kazandigiPara - toplamMaaliyet; % G�n sonunda yapt��� toplam kar.
        yilSonuKar = yilSonuKar + toplamKar; % Y�l sonundaki kar i�in ekleme yap�yoruz.
    end
    simulasyonToplam = simulasyonToplam + yilSonuKar;
end
SONUC = floor((simulasyonToplam / 50)); % Simulasyon toplam�n�, simulasyon say�s�na b�lerek toplam kazanc�n neye yak�nsad���n� buluyoruz.
end