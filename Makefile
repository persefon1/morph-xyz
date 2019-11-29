all: azg.gen.hfst azg.mor.hfstol

azg.lexc.hfst: azg.lexc
	hfst-lexc $< -o $@

azg.mor.hfst: azg.gen.hfst azg.mor.twol.hfst
	hfst-compose-intersect -1 azg.gen.hfst -2 azg.mor.twol.hfst | hfst-invert -o $@

azg.gen.hfst: azg.twol.hfst azg.lexc.hfst
	hfst-compose-intersect -1 azg.lexc.hfst -2 azg.twol.hfst -o $@


azg.mor.hfst: azg.gen.hfst
	hfst-invert $< -o $@

azg.mor.hfstol: azg.mor.hfst
	hfst-fst2fst -w $< -o $@
azg.mor.twol.hfst: azg.mor.twol
	hfst.twolc azg.mor.twol -o azg.mor.twol.hfst
