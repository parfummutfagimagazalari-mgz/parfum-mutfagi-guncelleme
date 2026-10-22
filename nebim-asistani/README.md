# Nebim Asistanı — şube paketi

Parfüm Mutfağı şubelerinde Nebim V3'ün üstünde duran yüzen asistanın kurulum ve güncelleme paketleri.
Asistan Nebim ekranlarını açar ve günün satış özetini okur; **Nebim'e hiçbir veri yazmaz**.

## İlk kurulum (her şube bilgisayarında bir kez)
1. Son paketi indirin: [paketler/NebimAsistani-2026.10.22.3.zip](paketler/NebimAsistani-2026.10.22.3.zip)
2. Zip'i sağ tıklayıp "Tümünü ayıkla" deyin, açılan klasörde **KUR.cmd**'ye çift tıklayın.
3. Şube kodunu ve adını yazın. Ayrıntılar paketin içindeki `OKU-BENI.txt` dosyasında.

## Güncelleme
Kurulu şubelerde masaüstündeki **Nebim Asistanı Güncelle** kısayolu `surum.json`'u okur,
yeni paketi indirir, SHA-256 ile doğrular ve şube ayarlarını koruyarak kurar.

## Yeni sürüm yayımlama
1. Paketi `paketler/NebimAsistani-<sürüm>.zip` olarak ekleyin (sürüm: yıl.ay.gün.sıra).
2. `surum.json`'da `surum`, `zip` ve `sha256` alanlarını güncelleyin.
3. Zip içindeki `surum.json`'daki sürüm de aynı olmalı.

| Sürüm | Tarih | SHA-256 |
|---|---|---|
| 2026.10.22.1 | 2026-10-22 | `1264b88f51708072eb051be95f36043331640563482e9d7ae503517353b378b4` |
| 2026.10.22.2 | 2026-10-22 | `4d17611e503980e5065c0ff075b68b845c579a726480b0c8f51889677f804d25` |
| 2026.10.22.3 | 2026-10-22 | `6a5c92f9792a100e0715f8a03be786e5ac9c48aa80b732329afe32449290dd63` |
