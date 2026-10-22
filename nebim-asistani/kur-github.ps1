# Copyright (c) 2026 Ahmet Aksoy. Tum haklari saklidir. Izinsiz degistirilemez, kopyalanamaz, ticari kullanilamaz (LISANS.txt).
# Nebim Asistani - GITHUB'DAN TEK SATIRLA SUBE KURULUMU (22.10.2026)
# Sube bilgisayarinda PowerShell'e su satir yapistirilir (yonetici gerekmez):
#   powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/parfummutfagimagazalari-mgz/parfum-mutfagi-guncelleme/main/nebim-asistani/kur-github.ps1 | iex"
# Yaptigi: yayindaki son surumu bulur, zip'i indirir, SHA-256 ile dogrular, acar ve paketin kendi kur.ps1'ini calistirir
# (sube kodu, adi, sunucu sorulur). Nebim'e HICBIR SEY yazmaz. Dogrulama tutmazsa hicbir sey kurmaz.
$ErrorActionPreference = 'Stop'
$NG_BILDIRIM = 'https://raw.githubusercontent.com/parfummutfagimagazalari-mgz/parfum-mutfagi-guncelleme/main/nebim-asistani/surum.json'
$NG_IZINLI = 'https://raw.githubusercontent.com/parfummutfagimagazalari-mgz/parfum-mutfagi-guncelleme/main/nebim-asistani/paketler/'
function NG-Yaz([string]$m) { Write-Host ('{0:HH:mm:ss} {1}' -f (Get-Date), $m) }
try {
  [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
  NG-Yaz 'Nebim Asistani - GitHub kurulumu. Copyright (c) 2026 Ahmet Aksoy.'
  $b = Invoke-RestMethod -Uri ($NG_BILDIRIM + '?t=' + [DateTime]::UtcNow.Ticks) -UseBasicParsing -TimeoutSec 20
  if (-not $b.surum -or -not $b.zip -or -not $b.sha256) { throw 'Surum bildirimi eksik (surum/zip/sha256).' }
  if (-not ([string]$b.zip).StartsWith($NG_IZINLI)) { throw ('Indirme adresi izinli depoda degil: ' + $b.zip) }
  if ([string]$b.sha256 -notmatch '^[A-Fa-f0-9]{64}$') { throw 'Surum bildirimindeki SHA-256 gecersiz.' }
  NG-Yaz ('Yayindaki surum: ' + $b.surum)

  $is = Join-Path $env:TEMP ('NebimAsistani-kurulum-' + $b.surum + '-' + (Get-Date -Format 'HHmmss'))
  New-Item -ItemType Directory -Force $is | Out-Null
  $zip = Join-Path $is 'NebimAsistani.zip'
  NG-Yaz 'Indiriliyor...'
  Invoke-WebRequest -Uri $b.zip -OutFile $zip -UseBasicParsing -TimeoutSec 300
  $hash = (Get-FileHash -LiteralPath $zip -Algorithm SHA256).Hash
  if ($hash -ne ([string]$b.sha256).ToUpperInvariant()) { throw ('Indirilen dosya dogrulanamadi (SHA-256 farkli). Hicbir sey kurulmadi.') }
  NG-Yaz 'Dosya dogrulandi (SHA-256)'

  $acik = Join-Path $is 'acik'
  Expand-Archive -LiteralPath $zip -DestinationPath $acik -Force
  $kur = Join-Path $acik 'NebimAsistani\kur.ps1'
  if (-not (Test-Path $kur)) { throw 'Paket icinde kur.ps1 bulunamadi.' }
  NG-Yaz 'Kurulum basliyor (sube kodu ve adi sorulacak)...'
  & powershell -NoProfile -ExecutionPolicy Bypass -File $kur
  if ($LASTEXITCODE -ne 0) { NG-Yaz ('Kurulum hata ile bitti (kod ' + $LASTEXITCODE + '). Masaustundeki NEBIM-ASISTAN-KURULUM-SONUC.txt dosyasina bakin.') }
  else { NG-Yaz 'Bitti. Son adim icin masaustundeki NEBIM-ASISTAN-KURULUM-SONUC.txt dosyasina bakin (Nebim.rdp + NebimYardimci).' }
} catch {
  NG-Yaz ('HATA: ' + $_.Exception.Message)
  NG-Yaz 'Internet baglantisini kontrol edip satiri tekrar calistirin; sorun surerse zip ile kurun (KUR.cmd).'
}
