def random_burner_taddr()
	head = "t1"
	middle = "burnvotertaddrxdlmaoepic"
	tail = [*("A"),*('C'..'H'),*("J".."N"),*("P".."Z"), *("a"),*('c'..'h'),*("j".."n"),*("p".."z"),*('0'),*("2".."9")].shuffle[0,9].join
    
    taddr = (head + middle + tail)
    return taddr if taddr.length == 35
    "Invalid taddr generated"
end