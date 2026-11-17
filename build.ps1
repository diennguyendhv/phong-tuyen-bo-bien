# Tạo index.html (tiếng Việt) và en.html (tiếng Anh) cho GitHub Pages và chơi offline, từ game.html.
# game.html là phần thân trang, dùng để phát hành lên claude.ai.
# Chạy: powershell -ExecutionPolicy Bypass -File build.ps1
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$site = 'https://diennguyendhv.github.io/phong-tuyen-bo-bien/'
$body = [IO.File]::ReadAllText((Join-Path $root 'game.html'), [Text.Encoding]::UTF8)
# đưa <link> lên phần head, bỏ <title> của game.html (mỗi trang có tiêu đề riêng)
$links = ([regex]::Matches($body, '(?m)^<link [^>]*>\s*$') | ForEach-Object { $_.Value.Trim() }) -join "`n"
$body = [regex]::Replace($body, '(?m)^<(title>.*?</title|link [^>]*)>\s*\r?\n', '')

function Write-Page($file, $lang, $locale, $title, $desc, $ogDesc, $image, $alt, $url, $extra) {
  $html = @"
<!doctype html>
<html lang="$lang">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<title>$title</title>
<meta name="description" content="$desc">
<meta name="theme-color" content="#0e1a22">
<link rel="alternate" hreflang="vi" href="$site">
<link rel="alternate" hreflang="en" href="${site}en.html">
<meta property="og:type" content="website">
<meta property="og:locale" content="$locale">
<meta property="og:site_name" content="$title">
<meta property="og:title" content="$title">
<meta property="og:description" content="$ogDesc">
<meta property="og:url" content="$url">
<meta property="og:image" content="$site$image">
<meta property="og:image:type" content="image/jpeg">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<meta property="og:image:alt" content="$alt">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:image" content="$site$image">
$links
$extra
</head>
<body>
$body
</body>
</html>
"@
  [IO.File]::WriteAllText((Join-Path $root $file), $html, (New-Object Text.UTF8Encoding $false))
  Write-Output "Đã tạo $file"
}

Write-Page 'index.html' 'vi' 'vi_VN' 'Mười Hai Giờ Cát Lộc' `
  'Mười Hai Giờ Cát Lộc: giữ ụ súng trên đồi cát Quảng Ngãi năm 1965 từ rạng sáng tới hoàng hôn.' `
  'Giữ ụ súng trên đồi cát Quảng Ngãi năm 1965 từ rạng sáng tới hoàng hôn. Chơi ngay trên máy tính và điện thoại.' `
  'anh-bia.jpg' 'Ụ súng trên đồi cát nhìn ra biển lúc hoàng hôn, tàu chiến ngoài khơi' $site ''

Write-Page 'en.html' 'en' 'en_US' 'Twelve Hours at Cát Lộc' `
  'Twelve Hours at Cát Lộc: hold a gun pit on the sand dunes of Quảng Ngãi, Vietnam, 1965, from dawn until sunset.' `
  'Hold a gun pit on the sand dunes of Quảng Ngãi, Vietnam, 1965, from dawn until sunset. Play free in your browser on desktop or phone.' `
  'anh-bia-en.jpg' 'A gun pit on a sand dune facing the sea at sunset, a warship offshore' "${site}en.html" `
  '<script>window.PTBB_LANG = ''en'';</script>'
