all: azg.gen.hfst azg.mor.hfstol

azg.lexc.hfst: azg.lexc
	hfst-lexc $< -o $@

azg.twol.hfst: azg.twol
	hfst-twolc $< -o $@
	
azg.gen.hfst: azg.twol.hfst azg.lexc.hfst
	hfst-compose-intersect -1 azg.lexc.hfst -2 azg.twol.hfst -o $@

azg.mor.hfst: azg.gen.hfst azg.mor.twol.hfst
	hfst-compose-intersect -1 azg.gen.hfst -2 azg.mor.twol.hfst | hfst-invert -o $@

azg.mor.hfstol: azg.mor.hfst
	hfst-fst2fst -w $< -o $@

azg.mor.twol.hfst: azg.mor.twol
	hfst-twolc $< -o $@
	
azg.mor.twol.hfst: azg.mor.twol
	hfst-twolc azg.mor.twol -o azg.mor.twol.hfst


azg.seg.hfst: azg.mor.hfst azg.gen.hfst
	hfst-compose -1 azg.mor.hfst -2 azg.gen.hfst -o azg.seg.hfst
