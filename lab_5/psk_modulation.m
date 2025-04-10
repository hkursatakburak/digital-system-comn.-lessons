% Parametreler
fc = 4074;   % Taşıyıcı frekansı (Hz)
Tb = 0.0005; % Bit süresi (saniye)
fs = 100000; % Örnekleme frekansı (Hz)
t = 0:1/fs:16*Tb; % Zaman vektörü

% Mesaj sinyali (16 bit)
message_bits = [0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0];

% Mesaj sinyalini zaman domaininde oluştur
message_signal = zeros(1, length(t));
for i = 1:length(message_bits)
    start_idx = floor((i-1) * Tb * fs) + 1;
    end_idx = floor(i * Tb * fs);
    message_signal(start_idx:end_idx) = message_bits(i);
end

% Taşıyıcı sinyal
carrier_signal = cos(2 * pi * fc * t);

% PSK modüle edilmiş sinyal
psk_signal = cos(2 * pi * fc * t + pi * message_signal);

% Grafikleri oluştur
figure;

% Mesaj sinyali
subplot(3, 1, 1);
plot(t, message_signal, 'b', 'LineWidth', 2);
title('Mesaj Sinyali (16 bit)');
xlabel('Zaman (s)');
ylabel('Genlik');
ylim([-0.1, 1.1]);
grid on;

% Taşıyıcı sinyal
subplot(3, 1, 2);
plot(t, carrier_signal, 'r', 'LineWidth', 1);
title('Taşıyıcı Sinyal');
xlabel('Zaman (s)');
ylabel('Genlik');
grid on;

% PSK modüle edilmiş sinyal
subplot(3, 1, 3);
plot(t, psk_signal, 'g', 'LineWidth', 1);
title('PSK Modüle Edilmiş Sinyal');
xlabel('Zaman (s)');
ylabel('Genlik');
grid on;

% Grafik düzenleme
sgtitle('PSK Modülasyonu') % Genel başlık