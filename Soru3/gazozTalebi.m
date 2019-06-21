function SONUC=gazozTalebi
F(1)=0.05;
F(2)=0.15;
F(3)=0.30;
F(4)=0.45;
F(5)=0.65;
F(6)=0.90;
F(7)=0.95;
F(8)=0.98;
F(9)=1;
U=unifrnd(0,1);
if (U<=F(1))
     x =65;
else if ((U>F(1)) && (U<=F(2)))
     x=90;
else if ((U>F(2)) && (U<=F(3)))
     x=105;
else if ((U>F(3)) && (U<=F(4)))
     x=120;
else if ((U>F(4)) && (U<=F(5)))
     x=135;
else if ((U>F(5)) && (U<=F(6)))
     x=150;
else if ((U>F(6)) && (U<=F(7)))
     x=165;
else if ((U>F(7)) && (U<=F(8)))
     x=180;
else if ((U>F(8)) && (U<=F(9)))
     x=200;
    end
    end
    end
    end
    end
    end
    end
    end
end
SONUC=x;
end