%-> Terminalde otobüsler için tek bir yer olduðu düþünülmüþtür. Bu
% nedenle yer dolu olduðu sürece otobüsler terminale alýnmamýþtýr.

%-> Terminalde iniþ ve biniþ iþlemleri için iki ayrý deðilde tek bir kuyruk sistemi varmýþ
% gibi düþünülmüþtür.

% -> Günde 100 otobüs geldiði düþünülerek (n=100) bir günde geçirilen ortalama
% süre 18.5 dakika olarak bulunmuþtur.

function SONUC = simulasyon(n)
genelOrtalama = 0;
for j = 1:1000 % Simulasyonu 1000 kere gerçekleþtiriyoruz.
    sayac = 0;
    g(1)=0; % Müþterinin geliþ zamaný baþlangýçta 0.
    ts=0; % Toplam Süre
    peronaYanasan = peronaYanasma; % Perona yanaþan yolcu bindirme için mi yolcu indirme için mi yanaþýyor?
    if (peronaYanasan == 1) % Yolcu bindirme için perona yanaþýlýyor ise.
          gIslemi(1) = girisIslemi;
          h(1)=yolcuBindirme;
          cIslemi(1) = cikisIslemi;
          a(1) = g(1)+ gIslemi(1) + h(1) + cIslemi(1); % Ayrýlýþ süresi, müþteri geliþ zamaný + giriþ iþlemi + yolcu bindirme + çýkýþ iþlemi.
    else if(peronaYanasan == 2) % Yolcu indirme için perona yanaþýlýyor ise.
          gIslemi(1) = girisIslemi;
          h(1)=yolcuIndirme;
          cIslemi(1) = cikisIslemi;
          a(1) = g(1)+ gIslemi(1) + h(1) + cIslemi(1);% Ayrýlýþ süresi = müþteri geliþ zamaný + giriþ iþlemi + yolcu indirme + çýkýþ iþlemi.
        end
    end
    for i = 2:n % n sayýsý bir günde kaç tane otobüs geldiðidir.
        peronaYanasan = peronaYanasma; %Perona yanaþan yolcu bindirme için mi yolcu indirme için mi yanaþýyor?
        g(i) = g(i-1) + gelislerArasiSure; %Müþterinin geliþ zamaný geliþ zamaný + geliþler arasý süre.
        if(peronaYanasan == 1) % Yolcu bindirme peronuna yanaþýlýyor ise.
            if (g(i) >= a(i-1)) % Geliþ zamaný bir önceki ayrýlýþ süresinden büyük ise otobüsün yeri boþ demektir.
                gIslemi(i) = girisIslemi;
                h(i) = yolcuBindirme;
                cIslemi(i) = cikisIslemi;
                a(i) = g(i) + gIslemi(i) + h(i) + cIslemi(i);
                ts(i) = a(i);
                sayac = sayac + 1; % Toplam kaç tane otobüsün terminale girdiðini bulmak için.
            else % Geliþ zamaný bir önceki ayrýlýþ süresinden küçük ise otobüs terminale alýnmaz.
                a(i) = 0;
                ts(i) = a(i-1);
            end
        else if (peronaYanasan == 2) % Yolcu indirme peronuna yanaþýlýyor ise.
             if (g(i) >= a(i-1))
                gIslemi(i) = girisIslemi;
                h(i) = yolcuIndirme;
                cIslemi(i) = cikisIslemi;
                a(i) = g(i) + gIslemi(i) + h(i) + cIslemi(i);
                ts(i) = a(i);
                sayac = sayac + 1;
            else 
                a(i) = 0;
                ts(i) = a(i-1);
            end
        end
        end
    end
    ts = ts(i); %Toplam süre.
    ortalamaSure = ts/sayac; % Toplam süreyi gelen otobüs sayýsýna bölerek gün içerisinde ki ortalama süre hesaplanmýþtýr.
    genelOrtalama = genelOrtalama + ortalamaSure; % Ortalama süreyi genel ortalamaya ekleyerek 1000 tane simulasyon için toplam ortalama süre hesaplanmýþtýr.
end
SONUC = genelOrtalama / 1000; % Genel ortalama, simulasyon sayýsýna bölünerek 1000 tane simulasyonun ortalama süresi hesaplanmýþtýr.
end