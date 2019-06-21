function SONUC=gelislerArasiSure
F(1)=0.15;
F(2)=0.45;
F(3)=0.80;
F(4)=1;
U=unifrnd(0,1);
if (U<=F(1))
     x =0;
else if ((U>F(1)) && (U<=F(2)))
     x=6;
else if ((U>F(2)) && (U<=F(3)))
     x=12;
else if ((U>F(3)) && (U<=F(4)))
     x=18;
    end
    end
  end
end
SONUC=x;
end
