6/- XS for fuel, coolant, moderator, and 3 reflector types (fullcore)
7/- XS for homogenized, and 4 reflector types (fullcore)
8/- mixes 6/ and 7/
oecd-nea/- contains XS to carry out Phase I: Exercise 1.

* to create xs/8/ do the following (in xs/):
mkdir 8/
cd 6/
$MOLTRES/python/extractSerpent2GCs.py xs800000-500-100 htgr_2g tempMapping secBranch universeMapping
cd ../7/
$MOLTRES/python/extractSerpent2GCs.py xs800000-500-100 htgr_2g tempMapping secBranch universeMapping
cd ../
cp -R 6/xs800000-500-100 8/xs800000-500-100
cp -R 7/xs800000-500-100 8/

* to create oecd-nea/xs/ do the following (in xs/):
cd oecd-nea/
pythn convert.py