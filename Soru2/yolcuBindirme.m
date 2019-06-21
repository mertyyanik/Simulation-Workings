function SONUC=yolcuBindirme
F(1)=0.35;
F(2)=0.70;
F(3)=1;
U=unifrnd(0,1);
if (U<=F(1))
     x =4;
else if ((U>F(1)) && (U<=F(2)))
     x=8;
else if ((U>F(2)) && (U<=F(3)))
     x=12;
    end
  end
end
SONUC=x;
end