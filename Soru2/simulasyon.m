%-> Terminalde otob�sler i�in tek bir yer oldu�u d���n�lm��t�r. Bu
% nedenle yer dolu oldu�u s�rece otob�sler terminale al�nmam��t�r.

%-> Terminalde ini� ve bini� i�lemleri i�in iki ayr� de�ilde tek bir kuyruk sistemi varm��
% gibi d���n�lm��t�r.

% -> G�nde 100 otob�s geldi�i d���n�lerek (n=100) bir g�nde ge�irilen ortalama
% s�re 18.5 dakika olarak bulunmu�tur.

function SONUC = simulasyon(n)
genelOrtalama = 0;
for j = 1:1000 % Simulasyonu 1000 kere ger�ekle�tiriyoruz.
    sayac = 0;
    g(1)=0; % M��terinin geli� zaman� ba�lang��ta 0.
    ts=0; % Toplam S�re
    peronaYanasan = peronaYanasma; % Perona yana�an yolcu bindirme i�in mi yolcu indirme i�in mi yana��yor?
    if (peronaYanasan == 1) % Yolcu bindirme i�in perona yana��l�yor ise.
          gIslemi(1) = girisIslemi;
          h(1)=yolcuBindirme;
          cIslemi(1) = cikisIslemi;
          a(1) = g(1)+ gIslemi(1) + h(1) + cIslemi(1); % Ayr�l�� s�resi, m��teri geli� zaman� + giri� i�lemi + yolcu bindirme + ��k�� i�lemi.
    else if(peronaYanasan == 2) % Yolcu indirme i�in perona yana��l�yor ise.
          gIslemi(1) = girisIslemi;
          h(1)=yolcuIndirme;
          cIslemi(1) = cikisIslemi;
          a(1) = g(1)+ gIslemi(1) + h(1) + cIslemi(1);% Ayr�l�� s�resi = m��teri geli� zaman� + giri� i�lemi + yolcu indirme + ��k�� i�lemi.
        end
    end
    for i = 2:n % n say�s� bir g�nde ka� tane otob�s geldi�idir.
        peronaYanasan = peronaYanasma; %Perona yana�an yolcu bindirme i�in mi yolcu indirme i�in mi yana��yor?
        g(i) = g(i-1) + gelislerArasiSure; %M��terinin geli� zaman� geli� zaman� + geli�ler aras� s�re.
        if(peronaYanasan == 1) % Yolcu bindirme peronuna yana��l�yor ise.
            if (g(i) >= a(i-1)) % Geli� zaman� bir �nceki ayr�l�� s�resinden b�y�k ise otob�s�n yeri bo� demektir.
                gIslemi(i) = girisIslemi;
                h(i) = yolcuBindirme;
                cIslemi(i) = cikisIslemi;
                a(i) = g(i) + gIslemi(i) + h(i) + cIslemi(i);
                ts(i) = a(i);
                sayac = sayac + 1; % Toplam ka� tane otob�s�n terminale girdi�ini bulmak i�in.
            else % Geli� zaman� bir �nceki ayr�l�� s�resinden k���k ise otob�s terminale al�nmaz.
                a(i) = 0;
                ts(i) = a(i-1);
            end
        else if (peronaYanasan == 2) % Yolcu indirme peronuna yana��l�yor ise.
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
    ts = ts(i); %Toplam s�re.
    ortalamaSure = ts/sayac; % Toplam s�reyi gelen otob�s say�s�na b�lerek g�n i�erisinde ki ortalama s�re hesaplanm��t�r.
    genelOrtalama = genelOrtalama + ortalamaSure; % Ortalama s�reyi genel ortalamaya ekleyerek 1000 tane simulasyon i�in toplam ortalama s�re hesaplanm��t�r.
end
SONUC = genelOrtalama / 1000; % Genel ortalama, simulasyon say�s�na b�l�nerek 1000 tane simulasyonun ortalama s�resi hesaplanm��t�r.
end