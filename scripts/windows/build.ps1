get-childitem templates/windows -filter *.tera | foreach-object {
    whiskers $_.FullName
}

$null = new-item -type directory -force dist
get-childitem -directory themes/windows/ | foreach-object {
    $f = "$($_.FullName)/$($_)"
    compress-archive -path "$($f).pal","$($f).prefs","$($f).qss","$($f).xml" -destinationpath dist/temp.zip -force
    move-item -path dist/temp.zip -destination "dist/$($_).scrtheme" -force
}
