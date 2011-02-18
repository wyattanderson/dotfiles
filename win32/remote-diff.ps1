$file1 = $args[0]
$file2 = $args[1]

$file1 = $file1.Replace("#", "\#")
$file2 = $file2.Replace("#", "\#")

$cmd = "${env:PROGRAMFILES}\Vim\vim72\gvim.exe"
$args = "--servername DIFF --remote-tab-silent +`"vert diffsplit ${file2}|wincmd r|set noma`" $file1"
& $cmd $args
