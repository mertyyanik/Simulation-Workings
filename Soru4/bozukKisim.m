function sonuc = bozukKisim
F(1) = 0.50;
F(2) = 0.80;
F(3) = 1;
U = unifrnd(0,1);
if U<=F(1)
    x = 1; %Mekanik
else if ((U>F(1)) && (U<=F(2)))
    x = 2; % Elektronik
else if ((U>F(2)) && (U<=F(3)))
    x = 3; % Her ikiside
    end
    end
end
sonuc = x;
end