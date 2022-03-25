fs = 1000;
dt = 1/fs;
t= (0:dt:1);
%%Message signal
fm = 5; 
m = cos(2 *pi * fm *t);
%carrier signal
fc = 50;
Ac = 1;
carrier_signal  = Ac * cos(2 * pi * fc * t);
modulation_factor = 5;
modulated_signal  = fmmod(m, fc, fs, modulation_factor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    MESSAGE %%%%%%%%%%%%%%%%%%%%%%
%Time domain of Message 
fig1 = figure(1)
plot( t, m)
title('Time domain of Message')

%Frequency domain of Message
fft_message = fft(m);
L = 1000;

P2 = abs(fft_message/ L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2 * P1(2:end-1);
    %frequency domain
f= fs * (0:(L/2))/L;
fig2 = figure(2)
plot(f,P1);
xlim([0 60])
title('Frequency domain of Message');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    CARRIER  %%%%%%%%%%%%%%%%%%%%%%
%Time domain of CARRIER 
fig3 = figure(3);
plot( t, carrier_signal);
title('Time domain of Carrier');

%Frequency domain of CARRIER
fft_carrier = fft(carrier_signal);
L = 1000;

P2 = abs(fft_carrier/ L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2 * P1(2:end-1);
    %frequency domain
f= fs * (0:(L/2))/L;
fig4 = figure(4);
plot(f,P1);
xlim([0 60])
title('Frequency domain of Carrier');

%%%%%%%%---------MODULATED-----------%%%%%%%%%%%
%%Frequency Modulation
modulated_signal  = fmmod(m, fc, fs, modulation_factor);
fig6 = figure(6);
plot( t, modulated_signal, 'c');
xlabel('Time(s)');
ylabel('Amplitude');
title('Time domain of modulated Signal');
ylim([-2.0 2.0]);

%Frequency domain of Modulated
fft_modulated = fft(modulated_signal);
L = 1000;

P2 = abs(fft_modulated/ L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2 * P1(2:end-1);
    %frequency domain
f= fs * (0:(L/2))/L;
fig7 = figure(7);
plot(f,P1);
xlim([0 60])
title('Frequency domain of modulated Signal');