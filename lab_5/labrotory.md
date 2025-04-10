# Deney 5: Faz Kaydırmalı Modülasyon (PSK)

## 1. Giriş

PSK (Phase Shift Keying), **dijital modülasyon tekniklerinden biri** olup, taşıyıcı sinyalin fazının değişmesiyle bilgi iletimi sağlar. PSK, özellikle dijital iletişimde **verimli bir modülasyon türü** olarak yaygın şekilde kullanılır. PSK'nin çeşitli türleri vardır. Bunlar arasında en yaygın olanlar şunlardır:

- **BPSK (Binary Phase Shift Keying)**
- **QPSK (Quadrature Phase Shift Keying)**
- **M-ary PSK**

### BPSK Nedir?
BPSK, her bir veri bitini taşıyıcı sinyalin fazını **180°'lik bir kayma** ile temsil eder. Yani:
- `1` biti taşıyıcı sinyalin fazını **0°** ile,
- `0` biti ise taşıyıcı sinyalin fazını **180°** ile ifade eder.

#### Matematiksel İfade:
BPSK modülasyonunun matematiksel ifadesi şu şekildedir:

\[
s(t) = A \cdot \cos(2\pi f_c t + \theta)
\]

Burada:
- \(A\): Taşıyıcı sinyalin genliği
- \(f_c\): Taşıyıcı frekansı
- \(\theta\): Faz açısı
  - Eğer veri biti \(1\) ise \(\theta = 0\),
  - Eğer veri biti \(0\) ise \(\theta = \pi\).

**Not:** İki fazlı bir sistem olduğundan dolayı bu modülasyon türüne **"binary"** denilmektedir.

---

### BPSK Modülasyonu
Aşağıdaki Şekil 1.1'de BPSK modülasyonuna ait sinyaller verilmiştir:
- **(a)** Mesaj işareti
- **(b)** Taşıyıcı işaret
- **(c)** Modüle edilmiş işaret

**Şekil 1.1: BPSK Modülasyonu**

---

## 2. Amaç

Bu çalışmada **Python** yazılım dili kullanılarak **Google Colaboratory** ortamında PSK modülasyonu ve demodülasyonu gerçekleştirilecektir. 

### Gerçekleştirilecek Adımlar:
1. **Modülasyon Aşaması:**
   - Modüle edilecek işaret, taşıyıcı işaret ve modüle edilmiş işaret elde edilecektir.
   - Modüle edilmiş sinyalin spektrumu **FFT yöntemi** kullanılarak analiz edilecektir.
2. **Demodülasyon Aşaması:**
   - Modüle edilmiş sinyalin demodülasyonu gerçekleştirilecektir.

---

## 3. Deneyler

### 1. PSK Modülasyonu İçin Kodlama

#### a. Mesaj Sinyali ve Modüle Edilmiş İşaret
- Mesaj sinyali: \([1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1]\)
- Taşıyıcı frekansı: \(f_c = 5 \, \text{kHz}\)

**Görev:** Modüle edilmiş sinyalin sonuçlarını **Şekil 4.1**'e çiziniz.

#### b. Spektrum Analizi
- Modüle edilmiş sinyalin spektrumu **FFT yöntemi** ile analiz edilecektir.
- Elde edilen spektrum grafiği **Şekil 4.2**'ye çizilecektir.

#### **Grafiklerin Yorumu:**
- Spektrum analizi sonuçlarını kısaca yorumlayınız.

---

### 2. Demodülasyon Aşaması

#### a. Modülasyon Parametrelerini Kullanarak Demodülasyon
- **Mesaj sinyali** ve **taşıyıcı frekans değerleri** kullanılarak demodülasyon işlemi gerçekleştirilir.
- **Sonuç:** Elde edilen demodülasyon sonuçlarını **Şekil 4.3**'e çiziniz.

---

### 3. Kişisel Numaraya Göre Modülasyon ve Demodülasyon

Her öğrenci, **numarasının son 4 hanesini** kullanarak modülasyon ve demodülasyon işlemini tekrar gerçekleştirecektir.

#### a. Mesaj İşareti
Mesaj işareti, numaranın son 4 hanesinin her bir rakamının ikili sayı tabanında yazılmasıyla elde edilir.

**Örnek:**
- Numaranın son 4 hanesi: **6811**
- İkili karşılık:
  \[
  6 \rightarrow 0110, \, 8 \rightarrow 1000, \, 1 \rightarrow 0001, \, 1 \rightarrow 0001
  \]
- Mesaj işareti: \([0, 1, 1, 0 \, | \, 1, 0, 0, 0 \, | \, 0, 0, 0, 1 \, | \, 0, 0, 0, 1]\)

#### b. Taşıyıcı İşareti
- Taşıyıcı frekansı: **Numaranın son 4 hanesi**. Örneğin: \(f_c = 6811 \, \text{Hz}\).

#### c. Çıktılar:
- Modülasyon ve spektrum analizine ait sonuçlar **Şekil 4.4** ve **Şekil 4.5**'e çizilecektir.

---

## 4. Çıktılar ve Sonuçlar

### Şekil Listesi:
- **Şekil 4.1:** Modülasyon deneyinde kullanılan mesaj sinyali, taşıyıcı işaret ve modüle edilmiş işaret.
- **Şekil 4.2:** Modüle edilmiş işaretin spektrum analizi.
- **Şekil 4.3:** Demodülasyon işleminin sonuçları.
- **Şekil 4.4:** Kişisel numaraya göre modüle edilmiş sinyalin sonuçları.
- **Şekil 4.5:** Kişisel numaraya göre spektrum analizi.

---

## 5. Ekler

### EK 1: Modülasyon Kod Örneği
```python
import numpy as np
import matplotlib.pyplot as plt

# Parametreler
fc = 5000  # Taşıyıcı frekansı
Tb = 0.001  # Bit süresi
fs = 100000  # Örnekleme frekansı
t = np.arange(0, 16*Tb, 1/fs)  # Zaman vektörü

# Mesaj sinyali
message_bits = np.array([1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1])
message_signal = np.repeat(message_bits, int(Tb*fs))

# Taşıyıcı sinyal
carrier_signal = np.cos(2 * np.pi * fc * t)

# Modüle edilmiş sinyal
modulated_signal = np.cos(2 * np.pi * fc * t + np.pi * (1 - message_signal))

# Grafikler
plt.figure(figsize=(10, 8))
plt.subplot(3, 1, 1)
plt.plot(t, message_signal[:len(t)])
plt.title("Mesaj Sinyali")
plt.subplot(3, 1, 2)
plt.plot(t, carrier_signal)
plt.title("Taşıyıcı Sinyal")
plt.subplot(3, 1, 3)
plt.plot(t, modulated_signal)
plt.title("Modüle Edilmiş Sinyal")
plt.tight_layout()
plt.show()
```

### EK 2: Spektrum Analizi Kod Örneği
```python
from scipy.fftpack import fft, fftfreq

# FFT hesaplama
N = len(modulated_signal)
yf = fft(modulated_signal)
xf = fftfreq(N, 1/fs)

# Spektrum grafiği
plt.figure()
plt.plot(xf[:N//2], np.abs(yf[:N//2]))
plt.title("Spektrum Analizi")
plt.xlabel("Frekans (Hz)")
plt.ylabel("Genlik")
plt.grid()
plt.show()
```

---

### EK 3: Demodülasyon Kod Örneği
```python
# Demodülasyon işlemi
demodulated_signal = modulated_signal * carrier_signal
filtered_signal = np.convolve(demodulated_signal, np.ones(int(Tb*fs)), mode='same') / (Tb*fs)

# Grafik
plt.figure()
plt.plot(t, filtered_signal[:len(t)])
plt.title("Demodüle Edilmiş Sinyal")
plt.show()
```