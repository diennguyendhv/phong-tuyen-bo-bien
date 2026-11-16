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
$headTags
</head>
<body>
$body
</body>
</html>
"@
[IO.File]::WriteAllText((Join-Path $root 'index.html'), $html, (New-Object Text.UTF8Encoding $false))
Write-Output "Đã tạo index.html"
