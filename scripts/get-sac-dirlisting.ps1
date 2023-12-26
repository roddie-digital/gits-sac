#$workdir = 'S:\pictures\sac\SACS1D4\*.jpg'
$workdir = 'H:\bd\Ghost in the Shell Innocence'
$slug = 'innocence'

$pictures = (ls "$workdir\*.jpg" | sort -property name | select -ExpandProperty name) # > S:\pictures\sac\ls-s1d2.txt
$dirlist = "$workdir\$slug.txt"
$rooturl = "https://raw.githubusercontent.com/roddie-digital/gits-sac/main/images/$slug"

if (test-path -path $dirlist) { rm "$dirlist" -vb }
    else {echo "$dirlist does not exist"}

#echo '' > $dirlist
foreach ($pic in $pictures) {
    $newline = "$rooturl/$pic"+','+'Innocence #GhostInTheShell,FALSE'
    echo "$newline" >> $dirlist
}
