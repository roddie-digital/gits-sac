#!/bin/posh
# 2023-12-21 https://roddie.digital
# Extract screenshots from Ghost in the Shell etc

$minutes = 0..40
$workdir = 'H:\bd\Ghost in the Shell Innocence'
$episode = 'Ghost in the Shell Innocence_t00.mkv'
$slug = 'innocence'
$jpgqual = 2

$hour = '01'
$second1 = '00'
$second2 = '30'
$second3 = '15'
$second4 = '45'

$input = 'innocence'
switch ($input) {
    ('gits1995') { $cwidth='1856'; $cheight='1003'; $xoffset='31'; $yoffset='38' }
    ('innocence'){ $cwidth='1920'; $cheight='1036'; $xoffset='0'; $yoffset='22' }
    default      { $cwidth='1920'; $cheight='1080'; $xoffset='0';  $yoffset='0'  }
}

foreach($i in $minutes){
  $i = '0'+$i
  $i = $i.SubString($i.length - 2, 2)
  
  $timestamp1 = $hour+':'+$i+':'+$second1
  $timestamp2 = $hour+':'+$i+':'+$second2

  $crop = 'crop='+$cwidth+':'+$cheight+':'+$xoffset+':'+$yoffset

  $filename1 = $slug+'-'+$hour+'-'+$i+'-'+$second1+'.jpg'
  $filename2 = $slug+'-'+$hour+'-'+$i+'-'+$second2+'.jpg'
  ./ffmpeg.exe -ss $timestamp1 -i "$workdir\$episode" -filter:v "$crop" -frames:v 1 -q:v $jpgqual "$workdir\$filename1" -v error
  ./ffmpeg.exe -ss $timestamp2 -i "$workdir\$episode" -filter:v "$crop" -frames:v 1 -q:v $jpgqual "$workdir\$filename2" -v error
}

foreach($i in $minutes){
  $i = '0'+$i
  $i = $i.SubString($i.length - 2, 2)
  
  $timestamp1 = $hour+':'+$i+':'+$second3
  $timestamp2 = $hour+':'+$i+':'+$second4

  $crop = 'crop='+$cwidth+':'+$cheight+':'+$xoffset+':'+$yoffset

  $filename1 = $slug+'-'+$hour+'-'+$i+'-'+$second3+'.jpg'
  $filename2 = $slug+'-'+$hour+'-'+$i+'-'+$second4+'.jpg'
  ./ffmpeg.exe -ss $timestamp1 -i "$workdir\$episode" -filter:v "$crop" -frames:v 1 -q:v $jpgqual "$workdir\$filename1" -v error
  ./ffmpeg.exe -ss $timestamp2 -i "$workdir\$episode" -filter:v "$crop" -frames:v 1 -q:v $jpgqual "$workdir\$filename2" -v error
}

# ./ffmpeg.exe -ss 00:25:00 -i "$workdir\$episode" -frames:v 1 -q:v $jpgqual "$workdir\$slug-25-00.jpg" -v error
# ./ffmpeg.exe -ss 00:25:30 -i "$workdir\$episode" -frames:v 1 -q:v $jpgqual "$workdir\$slug-25-30.jpg" -v error


# ./ffmpeg.exe -ss 01:22:43 -i "$workdir\$episode" -filter:v $crop -frames:v 1 -q:v $jpgqual "$workdir\innocence-01-22-43.jpg"
# ./ffmpeg.exe -ss 01:22:44 -i "$workdir\$episode" -filter:v $crop -frames:v 1 -q:v $jpgqual "$workdir\innocence-01-22-44.jpg"
# ./ffmpeg.exe -ss 01:22:46 -i "$workdir\$episode" -filter:v $crop -frames:v 1 -q:v $jpgqual "$workdir\innocence-01-22-46.jpg"
# ./ffmpeg.exe -ss 01:22:47 -i "$workdir\$episode" -filter:v $crop -frames:v 1 -q:v $jpgqual "$workdir\innocence-01-22-47.jpg"
# ./ffmpeg.exe -ss 01:22:48 -i "$workdir\$episode" -filter:v $crop -frames:v 1 -q:v $jpgqual "$workdir\innocence-01-22-48.jpg"
