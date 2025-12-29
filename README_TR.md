# 🧹 macOS Temizleme Scripti

macOS için kapsamlı sistem temizleme scripti. Disk alanı kazanmak için gereksiz cache, log ve geçici dosyaları güvenli bir şekilde temizler.

**[Click for English README](README.md)** | **[İngilizce README için tıklayın](README.md)**

## ✨ Özellikler

- 🗑️ **Silinebilir Alan Temizliği**: Time Machine yedekleri ve silinebilir dosyalar
- 🌐 **Chrome Temizliği**: Service Worker cache'leri ve IndexedDB dosyaları
- 📝 **Sistem Logları**: Sistem ve uygulama loglarını temizler
- 💾 **Cache Temizliği**: Kullanıcı ve uygulama cache'lerini siler
- 🛠️ **Xcode Temizliği**: DerivedData, Archives ve iOS DeviceSupport dosyaları
- 🎵 **Uygulama Cache'leri**: Discord, SoundCloud ve diğer uygulamalar
- 📊 **Detaylı Rapor**: Kazanılan disk alanını gösterir

## 📋 Gereksinimler

- macOS işletim sistemi
- Terminal erişimi
- Bazı işlemler için sudo yetkisi

## 🚀 Kurulum

### Hızlı Kurulum (Önerilen)

```bash
sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/oguzoldev/macos-cleaner-script/main/script_tr.sh)"
```

### Manuel Kurulum

#### 1. Repository'yi klonlayın

```bash
git clone git@github.com:oguzoldev/macos-cleaner-script.git
cd macos-cleaner-script
```

#### 2. Script'e çalıştırma yetkisi verin

```bash
chmod +x script_tr.sh
```

## 💻 Kullanım

**İki versiyon mevcut:**

- `script.sh` - İngilizce (English)
- `script_tr.sh` - Türkçe (Turkish)

### Normal Kullanım

```bash
./script_tr.sh
# veya İngilizce için
./script.sh
```

### Sudo ile Kullanım (Önerilen)

Sistem loglarını ve korumalı dosyaları temizlemek için:

```bash
sudo ./script_tr.sh
# veya İngilizce için
sudo ./script.sh
```

## 📸 Örnek Çıktı

```
======================================
Başlangıç: 45.23 GB boş alan
======================================

======================================
Sistem temizleme başlatılıyor...
======================================

[1/6] Time Machine yerel yedekleri temizleniyor (silinebilir alan)...
[2/6] Chrome cache ve veritabanları temizleniyor...
[3/6] Sistem logları temizleniyor...
[4/6] Kullanıcı cache'leri temizleniyor...
[5/6] Xcode dosyaları temizleniyor...
[6/6] Uygulama cache'leri ve diğer dosyalar temizleniyor...

======================================
Temizleme tamamlandı!
======================================

Son: 52.18 GB boş alan
✅ Kazanılan alan: 6.95 GB
```

## ⚠️ Önemli Uyarılar

- **Veri Kaybı Riski**: Bu script dosyaları kalıcı olarak siler. Önemli verilerin yedeğini alın.
- **Chrome Oturumları**: Chrome'daki bazı oturumlar kapanabilir.
- **Xcode Projeleri**: DerivedData temizlendiğinde Xcode projeleri yeniden derlenmek zorunda kalabilir.
- **Sistem Dosyaları**: Bazı sistem dosyalarını silmek için sudo yetkisi gerekir.

## 🗂️ Temizlenen Dosyalar

### Silinebilir Alan

- Time Machine yerel yedekleri
- `/private/var/vm/sleepimage` (uyku görüntü dosyası)
- `~/Library/Caches/com.apple.bird`
- Sistem periyodik bakım görevleri

### Chrome

- `~/Library/Application Support/Google/Chrome/*/Service Worker/CacheStorage`
- `~/Library/Application Support/Google/Chrome/*/IndexedDB`
- `~/Library/Application Support/Google/Chrome/OptGuideOnDeviceModel`

### Sistem

- `/Library/Logs/*`
- `/private/var/db/diagnostics`
- `/private/var/folders/*`
- `/private/var/log/*`

### Kullanıcı

- `~/Library/Caches/*`
- `~/Library/Logs/*`
- `~/Library/Caches/Homebrew/downloads`

### Xcode

- `~/Library/Developer/Xcode/Archives`
- `~/Library/Developer/Xcode/DerivedData`
- `~/Library/Developer/Xcode/iOS DeviceSupport`

### Uygulamalar

- `~/Library/Application Support/SoundCloud/Cache`
- `~/Library/Application Support/discord/Cache`
- `~/Library/pnpm`
- `~/Library/Metadata/CoreSpotlight`

## 🔧 Özelleştirme

Script'i kendi ihtiyaçlarınıza göre düzenleyebilirsiniz. `script_tr.sh` dosyasını açın ve temizlemek istemediğiniz satırları yorum satırı yapın veya silin.

Örnek:

```bash
# rm -rf ~/Library/Caches/Homebrew/downloads
```

## 🤝 Katkıda Bulunma

Katkılarınızı bekliyoruz! Lütfen:

1. Fork yapın
2. Feature branch oluşturun (`git checkout -b feature/yeniOzellik`)
3. Değişikliklerinizi commit edin (`git commit -m 'Yeni özellik eklendi'`)
4. Branch'inizi push edin (`git push origin feature/yeniOzellik`)
5. Pull Request oluşturun

## 📝 Lisans

Bu proje MIT lisansı altında lisanslanmıştır. Detaylar için [LICENSE](LICENSE) dosyasına bakın.

## ⚡ Sık Sorulan Sorular

### Script güvenli mi?

Evet, script sadece cache ve geçici dosyaları temizler. Ancak kullanmadan önce içeriğini incelemenizi öneririz.

### Ne sıklıkla çalıştırmalıyım?

Disk alanı sıkıntısı yaşadığınızda veya ayda bir kez çalıştırabilirsiniz.

### Geri alabilir miyim?

Hayır, silinen dosyalar kalıcı olarak silinir. Önemli verilerin yedeğini alın.

### Hangi macOS sürümlerinde çalışır?

macOS 10.14 (Mojave) ve üzeri sürümlerde test edilmiştir.

### Bazı dosyalar neden silinmiyor?

macOS'un System Integrity Protection (SIP) özelliği bazı sistem dosyalarını korur. Safari cache, HomeKit, CloudKit gibi Apple servislerinin cache'leri sudo ile bile silinemez. Bu tamamen normaldir ve sisteminizin güvenliği için önemlidir. Script bu hataları otomatik olarak gizler.

## 🙏 Teşekkürler

Bu scripti kullandığınız için teşekkürler! Sorun bildirmek veya öneride bulunmak için issue açabilirsiniz.

---

**⭐ Beğendiyseniz yıldız vermeyi unutmayın!**
