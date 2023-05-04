function [] = hurwitz_comp(k, Ti, Td, T)

dog = imread('dog.jpg');
nope = imread('nope.jpg');
licz_o = 10;
mian_o = [1 2 2 1];
licz_r = [k * (Ti * T + Td * Ti) k * (Ti + T) k];
mian_r = [Ti * T Ti 0];
[lo, mo] = series(licz_o, mian_o, licz_r, mian_r);
[lz, mz] = cloop(lo, mo, -1);
H1 = [mz(2)];
H2 = [mz(2) mz(4); mz(1) mz(3)];
H3 = [mz(2) mz(4) mz(6); mz(1) mz(3) mz(5); 0 mz(2) mz(4)];
H4 = [mz(2) mz(4) mz(6) 0; mz(1) mz(3) mz(5) 0; 0 mz(2) mz(4) mz(6); 0 mz(1) mz(3) mz(5)];
if (det(H1)>0 && det(H2)>0 && det(H3)>0 && det(H4)>0)
    h = msgbox(sprintf('k=%2.3f, T_{i}=%2.3f, T_{d}=%2.3f', k, Ti, Td), 'Układ stabilny', 'custom', dog);
else
    h = msgbox(sprintf('k=%2.3f, T_{i}=%2.3f, T_{d}=%2.3f', k, Ti, Td), 'Układ niestabilny', 'custom', nope);
end
set(h, 'position', [600 440 200 80]);

end