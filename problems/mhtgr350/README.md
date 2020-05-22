Create cross-sections files for moltres input file:
---------------------------------------------------
- Files:
	* coolant.coe
	* fuel.coe
	* moderator.coe
	* secBranch
	* tempMapping
	* universeMapping

run:
$MOLTRES/python/extractSerpent2GCs.py xs800000-500-100 htgr_2g tempMapping secBranch universeMapping

Neutronics input files:
-----------------------
- unit-cell.i:
	* unit cell without reflector
	* no delayed neutrons
	* defines kernels individually
	* reaches k = 1.0
- unit-cell-reflec.i:
	* unit cell with reflector
	* no delayed neutrons
	* defines kernels individually
	* reaches k = 1.0

- auto.i
- auto1.i
- auto1b.i
- auto1-d.i
- autob.i
- nts2.i

Thermo-hydraulics:
------------------
- temp.i
- temp2.i
- temp.e

Python scripts:
---------------
- plot.py: plots axial flux on the fuel center line

files that help with the debugging (this files will be eventually deleted):
---------------------------------------------------------------------------
- gdb-output.txt
- input-readme
- kipi.ipynb
- material-properties
- nodelayed-fuel.png
- numerical.py
- plott.e
- plot-wdelayed-fuel.png
- wdelayed.png



Things to look into:
--------------------

- Neutron flux should be equal to the one serpent predicts
	* unit cell input files that define XSs in seprent (w/ and wo/ reflector)
- I believe that if I use the delayed neutrons kernels, the results should be identical, but they are not ...
- NTS Action gets k > 1.0
