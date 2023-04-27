function [] = lab6_(h, ym, licz, mian)

c = (-pi * h) / (4 * ym);
n = nyquistplot(tf([licz], [mian]));
opt = getoptions(n);
opt.ShowFullContour = 'off';
setoptions(n, opt);

hold on;
plot([-1 0], [c c], 'r');
axis([-1 1 -0.8 0.8]);
grid on;
title('Wykres Nyquista części liniowej z wykresem krytycznym');
xlabel('Re');
ylabel('Im');
legend('Wykres Nyquista', 'Wykres krytyczny');
hold off;

out1 = sim("lab6_model.slx");
figure
plot(out1.y.time, out1.y.signals.values);
title('Wielkość regulowana');
grid on;

end