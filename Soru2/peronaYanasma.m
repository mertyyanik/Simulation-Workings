function SONUC2=peronaYanasma
F(1)=0.6;
U=unifrnd(0,1);
if (U<=F(1))
    y = 1;
else if (U > F(1))
    y = 2;
    end
end
SONUC2 = y;
end