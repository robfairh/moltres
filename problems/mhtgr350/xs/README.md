1/- XS for fuel, coolant, and moderator (simplified-fullcore)
2/- XS for fuel, coolant, moderator, and reflector (simplified-fullcoreC)
3/- XS for fuel, coolant, moderator, and 8 different reflector sections (simplified-fullcoreD)
4/- XS for fuel, coolant, moderator, bottom, and top reflector (standard-column)
5/- XS for fuel, coolant, moderator (standard-fuel)
6/- XS for fuel, coolant, moderator, and 3 reflector types (fullcore)
7/- XS for homogenized, and 4 reflector types (fullcore)
8/- mixes 6/ and 7/

Create cross-sections files for moltres input file:
---------------------------------------------------
- Files:
	* secBranch
	* tempMapping
	* universeMapping
	* <material>.coe

run:
$MOLTRES/python/extractSerpent2GCs.py xs800000-500-100 htgr_2g tempMapping secBranch universeMapping
