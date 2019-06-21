function SONUC=cikisIslemi
F(1)=0.15;
F(2)=0.55;
F(3)=0.75;
F(4)=0.95;
F(5) = 1;
U=unifrnd(0,1);
if (U<=F(1))
     x =4;
else if ((U>F(1)) && (U<=F(2)))
     x=8;
else if ((U>F(2)) && (U<=F(3)))
     x=12;
else if ((U>F(3)) && (U<=F(4)))
     x=16;
else if ((U>F(4)) && (U<=F(5)))
     x=20;
    end
    end
    end
    end
end
SONUC=x;
end