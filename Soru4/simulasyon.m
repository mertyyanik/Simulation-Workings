%Simulasyon, saatçi meþgul ise baþka müþteri kabul etmeyeceði düþünülerek
%hazýrlanmýþtýr.

function SONUC=simulasyon
simulasyonToplam = 0;
for k = 1:50 % Simulasyonu 10 kere tekrarlayalým.
    yilSonuKar = 0; % Yýl sonu kar için.
    for j = 1:365 % 1 yýlýn sonunda ki kar soruluyor. Dolayýsýyla bütün iþlemleri 365 kere gerçekleþtirebiliriz.
        g(1) = 0;
        h(1) = onarimSuresi; %Onarým süresi
        a(1) = g(1) + h(1); % Çýkýþ Zamaný
        kazandigiPara = 0;
        toplamMaaliyet = 0;
        toplamKar = 0;
        for i = 2:100
            g(i) = g(i-1) + musteriGelmesi; % Geliþ süresi + geliþlerarasý süre.
            if g(i) < 660 % Saatçi 11 saatten fazla çalýþmýyor.
                if (g(i) >= a(i-1))
                    h(i) = onarimSuresi; % Onarým süresi için rastgele sayý.
                    a(i) = g(i) + h(i); %Geliþ süresi + onarým süresi.
                    satinAlma = satinAlmaDurumu; % Saatçi, saati tamir mi etti yoksa satýn mý almak istedi?
                    bozukParca = bozukKisim; % Saatin hangi parçasý bozuk?
                    if satinAlma == 1 % Saat satýn alýnmadý.
                        if bozukParca == 1 % Bozuk parça mekanik ise.
                            kazandigiPara = kazandigiPara + 20;
                        else if bozukParca == 2 % Bozuk parça elektronik ise.
                            kazandigiPara = kazandigiPara + 30;
                        else if bozukParca == 3 % Her iki parçada bozuk ise.
                            kazandigiPara = kazandigiPara + 30 + 20;
                            end
                            end
                        end
                    else if satinAlma == 0 % Saat satýn alýndý. Bu durumda maaliyet hesabý yapýlacak. Koþul ne olursa olsun saatin kasasý için 20 TL ödeyecek.
                        if bozukParca == 1 %Bozuk parça mekanik ise.
                            toplamMaaliyet = toplamMaaliyet + 20 + 20 + 5;
                        else if bozukParca == 2 % Bozuk parça elektronik ise.
                            toplamMaaliyet = toplamMaaliyet + 20 + 10; % Bozuk elektronik parça için para ödemiyor. Sadece saðlam bölüm ve kasa.
                        else if bozukParca == 3 % Her iki parçada bozuk ise.
                            toplamMaaliyet = toplamMaaliyet + 20 + 5;
                        end
                        end
                        end
                        end
                    end
                else % O an müþterisi varsa baþka müþteri kabul etmiyor.
                    a(i) = 0;
                end
            else
                break % Saatçinin çalýþmasý süresi 660 'ý geçti ise sistem duruyor.
            end
        end
        toplamKar = kazandigiPara - toplamMaaliyet; % Gün sonunda yaptýðý toplam kar.
        yilSonuKar = yilSonuKar + toplamKar; % Yýl sonundaki kar için ekleme yapýyoruz.
    end
    simulasyonToplam = simulasyonToplam + yilSonuKar;
end
SONUC = floor((simulasyonToplam / 50)); % Simulasyon toplamýný, simulasyon sayýsýna bölerek toplam kazancýn neye yakýnsadýðýný buluyoruz.
end