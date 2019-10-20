




$mylang=get-winuserlanguagelist
#$mylang.add("Sv-SE")
#$mylang.add("en-US")
$mylang.add("en-GB")
set-winuserlanguagelist -languagelist $mylang
