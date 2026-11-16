# Tạo index.html (trang đầy đủ cho GitHub Pages và chơi offline) từ game.html.
# game.html là phần thân trang, dùng để phát hành lên claude.ai.
# Chạy: powershell -ExecutionPolicy Bypass -File build.ps1
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$body = [IO.File]::ReadAllText((Join-Path $root 'game.html'), [Text.Encoding]::UTF8)
# đưa <title> và <link> lên phần head
$headTags = ([regex]::Matches($body, '(?m)^<(title>.*?</title|link [^>]*)>\s*$') | ForEach-Object { $_.Value.Trim() }) -join "`n"
$body = [regex]::Replace($body, '(?m)^<(title>.*?</title|link [^>]*)>\s*\r?\n', '')
$html = @"
<!doctype html>
<html lang="vi">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="description" content="Mười Hai Giờ Cát Lộc: giữ ụ súng trên đồi cát Quảng Ngãi năm 1965 từ rạng sáng tới hoàng hôn.">
<meta name="theme-color" content="#0e1a22">
<meta property="og:type" content="website">
<meta property="og:locale" content="vi_VN">
<meta property="og:site_name" content="Mười Hai Giờ Cát Lộc">
<meta property="og:title" content="Mười Hai Giờ Cát Lộc">
<meta property="og:description" content="Giữ ụ súng trên đồi cát Quảng Ngãi năm 1965 từ rạng sáng tới hoàng hôn. Chơi ngay trên máy tính và điện thoại.">
<meta property="og:url" content="https://diennguyendhv.github.io/phong-tuyen-bo-bien/">
<meta property="og:image" content="https://diennguyendhv.github.io/phong-tuyen-bo-bien/anh-bia.jpg">
<meta property="og:image:type" content="image/jpeg">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<meta property="og:image:alt" content="Ụ súng trên đồi cát nhìn ra biển lúc hoàng hôn, tàu chiến ngoài khơi">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:image" content="https://diennguyendhv.github.io/phong-tuyen-bo-bien/anh-bia.jpg">
$headTags
</head>
<body>
$body
</body>
</html>
"@
[IO.File]::WriteAllText((Join-Path $root 'index.html'), $html, (New-Object Text.UTF8Encoding $false))
Write-Output "Đã tạo index.html"
