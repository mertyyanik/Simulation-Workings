function SONUC = satinAlmaDurumu
F(1) = 0.70;
F(2) = 1;
U = unifrnd(0,1);
if U<=F(1)
    x = 1; % Satin Alinmadý.
else
    x = 0; % Satin Alýndý.
end
SONUC = x;
end