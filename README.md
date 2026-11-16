# Mười Hai Giờ Cát Lộc

Game bắn súng giữ bờ biển, chạy trên trình duyệt máy tính và điện thoại, không cần cài đặt.

Quảng Ngãi, mùa hè 1965. Lính Mỹ đổ bộ lúc rạng sáng. Sáu trăm người thôn Cát Lộc đang trú dưới địa đạo và chỉ rút ra được khi trời tối. Bạn giữ ụ súng số 3 trên đồi cát. Còn mười hai giờ nữa mới tới hoàng hôn.

Thôn Cát Lộc và các nhân vật là hư cấu, lấy cảm hứng từ trận Vạn Tường, địa đạo Vịnh Mốc, những người tải đạn và đảo Cồn Cỏ.

## Chơi

- **Online:** https://diennguyendhv.github.io/phong-tuyen-bo-bien/
- **Offline:** tải `index.html` về rồi mở bằng trình duyệt.

| | Máy tính | Điện thoại |
|---|---|---|
| Súng máy | Giữ chuột trái | Chạm giữ màn hình |
| Pháo | Chuột phải hoặc Space | Nút PHÁO |
| Tạm dừng | P hoặc Esc | Nút II |
| Chọn nâng cấp | Phím 1, 2, 3 | Chạm vào thẻ |

Luật chơi đầy đủ: [LUAT-VA-PHASE.md](LUAT-VA-PHASE.md). Kịch bản: [KICH-BAN.md](KICH-BAN.md).

## Tự kiểm tra

Mở game với đuôi `#selftest` để chạy bộ test theo 6 phase, ví dụ `index.html#selftest`.

## Cấu trúc

| File | Vai trò |
|---|---|
| `game.html` | Mã nguồn game (phần thân trang) |
| `index.html` | Trang đầy đủ, tạo từ `game.html` bằng `build.ps1` |
| `build.ps1` | Tạo lại `index.html` sau khi sửa `game.html` |
| `ung-ho-qr.jpg` | Ảnh mã QR ủng hộ (nếu có) |
