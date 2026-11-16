# Phòng Tuyến Bờ Biển — Luật chơi và kế hoạch phase

Game bắn súng giữ bờ biển, làm mới hoàn toàn (code, hình vẽ, âm thanh đều tự tạo).
Chạy bằng một file HTML: chơi offline hoặc qua web.

## 1. Luật chơi

**Mục tiêu:** giữ phòng tuyến càng nhiều đợt càng tốt. Phòng tuyến có 100 điểm bền. Về 0 là thua.

**Vũ khí**

| Vũ khí | Cách bắn | Sát thương | Giới hạn |
|---|---|---|---|
| Súng máy | Giữ chuột trái (điện thoại: chạm giữ màn hình) | 1 / viên, 11 viên/giây | Nóng nòng: bắn liên tục ~3 giây thì khóa 1,6 giây để nguội |
| Pháo | Chuột phải hoặc phím Space (điện thoại: nút PHÁO) | 7, nổ lan theo vùng | Nạp đạn 1,4 giây |

Súng máy chỉ gây **20% sát thương** lên mục tiêu bọc thép (xuồng, xe tăng). Nên dùng pháo cho chúng.

**Kẻ địch**

| Kẻ địch | Máu | Điểm | Mối nguy |
|---|---|---|---|
| Lính bộ binh | 2 | 10 | Tới sát phòng tuyến thì bắn liên tục, mất 2,5 bền/giây mỗi lính |
| Xuồng đổ bộ (bọc thép) | 9 | 50 | Cập bờ thì thả 2–5 lính rồi rút đi |
| Xe tăng (bọc thép) | 14 | 80 | Dừng ở tầm bắn, cứ 3,2 giây bắn 1 phát: mất 9 bền |
| Máy bay | 4 | 60 | Bay ngang, thả 1 quả bom khi tới gần giữa |
| Bom | 1 | 15 | Rơi trúng phòng tuyến: mất 14 bền. Bắn trúng giữa không thì nổ vô hại |

**Đợt tấn công**
- Mỗi đợt có số xuồng, xe tăng, máy bay tăng dần. Đợt sau địch đi nhanh hơn 6% và trâu hơn 5%.
- Hạ hết địch của một đợt: thưởng `100 × số đợt` điểm, sửa phòng tuyến +20 bền, rồi **chọn 1 trong 3 nâng cấp** (bấm chuột hoặc phím 1, 2, 3).
- Điểm cao nhất được lưu trên trình duyệt.

**Nâng cấp sau mỗi đợt**

| Nâng cấp | Tác dụng | Cấp tối đa |
|---|---|---|
| Gia cố bao cát | Bền tối đa +25 và sửa đầy | 4 |
| Nòng làm mát bằng nước | Súng máy nóng chậm hơn 25%, nguội nhanh hơn 30% | 3 |
| Đạn xuyên giáp | Súng máy: sát thương +30%, xuyên giáp thêm 20% | 3 |
| Bộ nạp đạn nhanh | Súng máy bắn nhanh hơn 20% | 3 |
| Kíp pháo thành thạo | Pháo nạp nhanh hơn 25% | 3 |
| Đạn pháo nổ mạnh | Pháo: sát thương +3, vùng nổ +25% | 3 |
| Đội công binh | Sửa +50 bền ngay. Luôn có trong bảng khi bền dưới 50% | không giới hạn |

**Thùng tiếp tế thả dù** (từ đợt 2: 1 thùng mỗi đợt, từ đợt 6: 2 thùng). Bắn trúng trước khi chạm đất:

| Ký hiệu | Tác dụng |
|---|---|
| `+` xanh lá | Sửa phòng tuyến +20 |
| `❄` xanh dương | Súng máy không nóng nòng trong 8 giây |
| `»` cam | Pháo nạp nhanh gấp 4 lần trong 8 giây |

**Phím khác:** `P` hoặc `Esc` để tạm dừng.

## 2. Các phase và cách tự kiểm tra

Game có sẵn bộ tự kiểm tra. Mở game với đuôi `#selftest` (ví dụ `index.html#selftest`) để xem kết quả từng phase.

| Phase | Nội dung | Tự kiểm tra |
|---|---|---|
| 1. Thế giới | Phối cảnh (xa–gần), trời, biển, bờ cát, vòng lặp khung hình, đổi kích thước | Phối cảnh tăng dần từ chân trời xuống đáy; đổi tọa độ xuôi–ngược khớp nhau; bờ biển nằm giữa chân trời và đáy; canvas đúng kích thước; vòng lặp có chạy |
| 2. Vũ khí & địch | Súng máy, nóng nòng, pháo, nổ lan, lính, xuồng, xe tăng, máy bay, bom | Bắn trúng trừ đúng máu; bọc thép chỉ ăn 20%; luôn trúng mục tiêu gần nhất; nóng nòng thì khóa; pháo phải nạp; nổ lan trúng gần, không trúng xa; lính tới nơi thì gây sát thương; xuồng cập bờ thả đúng số lính; máy bay thả bom; bắn bom thì không mất bền |
| 3. Đợt, điểm, thua | Hàng đợi địch, độ khó tăng, thưởng đợt, sửa phòng tuyến, thua, lưu điểm | Độ khó không giảm qua các đợt; cùng seed ra cùng thứ tự địch; hạ địch cộng đúng điểm; qua đợt có thưởng và sửa +20; hết bền thì thua |
| 4. Giao diện | Menu, tạm dừng, thua, HUD, nút cho điện thoại, âm thanh | Nút Vào trận bắt đầu game; tạm dừng/tiếp tục; có nút pháo cho điện thoại; trang không bị cuộn ngang |
| 5. Nâng cấp & tiếp tế | Bảng chọn nâng cấp, 7 loại nâng cấp, 3 loại thùng tiếp tế, cân bằng đợt 4 | Mỗi nâng cấp đổi đúng chỉ số; 3 lựa chọn khác nhau; đủ cấp thì không hiện nữa; bền thấp luôn có sửa chữa; game dừng khi đang chọn; phím 1–3 chọn được; mỗi loại thùng có đúng tác dụng; thùng chạm đất thì mất; thùng không chặn qua đợt; đợt 4 không tăng vọt |

Ngoài bộ test trong game, mỗi phase còn được chạy thử trong trình duyệt: chụp màn hình và kiểm tra lỗi console.
