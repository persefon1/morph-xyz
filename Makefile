all: azg.gen.hfst 

azg.lexc.hfst: azg.lexc
	hfst-lexc $< -o $@

azg.twol.hfst: azg.twol
	hfst-twolc $< -o $@

azg.gen.hfst: azg.twol.hfst azg.lexc.hfst
	hfst-compose-intersect -1 azg.lexc.hfst -2 azg.twol.hfst -o $@
