Geo & Meshes:
-------------
* 2D-coolant.geo:
	- Coolant channel, H = 100.
	- This can be eventually deleted.

* 3D-assembly.geo:
	- Fuel assembly without reflector.

* 3D-assembly-30deg.geo:
	- geometry of 1/6 of the fuel assembly.
	- No reflector

* 3D-assembly-reflec.geo:
	- Fuel assembly column with reflectors.
	- Moderator and reflectors are the same material.


* cut2D.py:
	- MHTGR-350
	- 1/6th of the fuel assembly
	- 2D surface, to produce the 3D geometry, it has to be extruded by hand
	- run python cut2D.py to produce the .geo: 'untitled2.geo'

* cut-30.geo:
	- 30 deg cut of the fuel assembly column with reflectors. 
	- it has two extra channels than 'untitled2.geo'
	- idk how it was produced
	- it can be deleted eventually

* standard-fuel.py
	- it doesn't work
	- it would produce the mmr fuel assembly geometry (I think)
	- it can be deleted eventually

