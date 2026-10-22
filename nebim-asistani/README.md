# Nebim Asistanı — şube paketi

> **Copyright (c) 2026 Ahmet Aksoy. Tüm hakları saklıdır.**
> Nebim Asistanı Ahmet Aksoy tarafından tasarlanmış ve geliştirilmiştir; fikri ve ticari haklar Ahmet Aksoy'a aittir.
> Ahmet Aksoy'un yazılı izni olmadan değiştirilemez, kopyalanamaz, dağıtılamaz, satılamaz ve ticari olarak kullanılamaz.
> Paketlerin bu depoda bulunması yalnız izinli şubelerin indirebilmesi içindir, kullanım hakkı vermez. Ayrıntı: [LISANS.txt](LISANS.txt)

Parfüm Mutfağı şubelerinde Nebim V3'ün üstünde duran yüzen asistanın kurulum ve güncelleme paketleri.
Asistan Nebim ekranlarını açar ve günün satış özetini okur; **Nebim'e hiçbir veri yazmaz**.
Paketler **hazır program** (exe) olarak yayımlanır; kaynak kod bu depoda bulunmaz.

## İlk kurulum (her şube bilgisayarında bir kez)
1. Son paketi indirin: [paketler/NebimAsistani-2026.10.22.10.zip](paketler/NebimAsistani-2026.10.22.10.zip)
2. Zip'i sağ tıklayıp "Tümünü ayıkla" deyin, açılan klasörde **KUR.cmd**'ye çift tıklayın.
3. Şube kodunu ve adını yazın. Ayrıntılar paketin içindeki `OKU-BENI.txt` dosyasında.

## Tailscale (Ankara bağlantısı için)
**Asistanı kurmak ve kullanmak için gerekmez.** Asistan Nebim'e şubenin uzak masaüstüyle bağlanır, güncellemeyi buradan (GitHub) alır.
Ankara merkez paneli şubelerin günlük özetini **Tailscale** özel ağı üzerinden okuyacak. Şubeye gitmişken her bilgisayara bir kez kurulması önerilir:
1. [tailscale.com/download](https://tailscale.com/download) → Windows sürümünü kurun.
2. Saatin yanındaki simge → **Log in** → şirketin ortak Google hesabı (Mahmutbey ile aynı).
3. Simgeye sağ tık → **Run unattended** açık.
4. [login.tailscale.com](https://login.tailscale.com) → Machines → bilgisayarın satırı → ⋯ → **Disable key expiry**.
5. Bilgisayara `tag:sube` etiketi verin; Ankara sunucusu `tag:ankara` olacak.

`KUR.cmd`, Tailscale kuruluysa bilgisayarın 100.x.y.z adresini kurulum sonuç dosyasına yazar. Ayrıntılı açılış adımları paketteki `docs/ANKARA-MERKEZ-PLANI.md` dosyasında.

## Güncelleme
Kurulu şubelerde asistan simgesinin sağ tık menüsündeki **Güncelle** (ya da masaüstündeki **Nebim Asistanı Güncelle** kısayolu) `surum.json`'u okur,
yeni paketi indirir, SHA-256 ile doğrular ve şube ayarlarını koruyarak kurar.

## Yeni sürüm yayımlama
Paketler yalnız geliştirme bilgisayarında **PAKET-HAZIRLA** ile üretilir: kaynak derlenir, öz-testten geçer, pakette kaynak kod olmadığı denetlenir. Ardından paket `paketler/` klasörüne konur ve `surum.json` içindeki `surum`, `zip`, `sha256` güncellenir.

| Sürüm | Tarih | SHA-256 |
|---|---|---|
| 2026.10.22.1 | 2026-10-22 | kaldırıldı (kaynak içeriyordu) |
| 2026.10.22.2 | 2026-10-22 | kaldırıldı (kaynak içeriyordu) |
| 2026.10.22.3 | 2026-10-22 | kaldırıldı (kaynak içeriyordu) |
| 2026.10.22.4 | 2026-10-22 | kaldırıldı (kaynak içeriyordu) |
| 2026.10.22.5 | 2026-10-22 | kaldırıldı (kaynak içeriyordu) |
| 2026.10.22.6 | 2026-10-22 | kaldırıldı (kaynak içeriyordu) |
| 2026.10.22.7 | 2026-10-22 | kaldırıldı (kaynak içeriyordu) |
| 2026.10.22.8 | 2026-10-22 | kaldırıldı (kaynak içeriyordu) |
| 2026.10.22.9 | 2026-10-22 | kaldırıldı (kaynak içeriyordu) |
| 2026.10.22.10 | 2026-10-22 | `ba75242de59546987d5f754368a75dedbe5bd5b0eb4f3daa10d40fd63c10826e` |
