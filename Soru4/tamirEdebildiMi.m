function SONUC = tamirEdebildiMi
F(1) = 0.70;
F(2) = 1;
U = unifrnd(0,1);
if U<=F(1)
    x = 'Tamir Edildi';
else
    x = 'Tamir Edilemedi';
end
SONUC = x;
end