Geo & Meshes:
-------------
* 1D-fuel.geo: 
	- Fuel. 
* 1D-fuel-reflec.geo: 
	- Fuel, bottom, and top reflectors. 
	- Bottom and top reflector are different materials.

* 2D-fuel.geo:
	- Fuel channel, H = 793.
* 2D-fuel-reflec.geo:
	- Fuel, bottom, and top reflectors.
	- Both reflectors are the same material.
* 2D-fullcore.geo:
	- Full core 2D-axisymmetric.
	- Inner and outer reflectors.
	- Both reflectors are part of the moderator.
	- No bottom or top reflector.
* 2D-fullcore-reflec.geo:
	- Full core 2D axisymmetric.
	- Moderator and reflectors are defined as 5 different materials.
	- Reflector does not include coolant holes.
* 2D-fullcore-reflecB.geo:
	- Full core 2D axisymmetric.
	- Moderator and reflectors are defined as 5 different materials.
	- Coolant channel goes across the reflector.

* 2D-fullcore-reflec-rpv.geo:
	- Full core 2D axisymmetric.
	- Moderator and reflectors are defined as 5 different materials.
	- Reflector does not include coolant holes.
	- Adds reactor pressure vessel to the TH model.

* 2D-unitcell.geo:
	- Unit cell 2D axisymmetric.
	- No reflectors.
* 2D-unitcell-reflec.geo:
	- Unit cell 2D axisymmetric.
	- Moderator and reflector are 3 different materials.
	- Reflector does not include coolant holes.
* 2D-unitcell-reflecB.geo:
	- Unit cell 2D axisymmetric.
	- Moderator and reflector are 3 different materials.
	- Coolant channel goes across the reflector.

* 3D-assembly.geo:
	- Fuel assembly without reflector.
* 3D-assembly-30deg.geo:
	- geometry of 1/6 of the fuel assembly.
	- No reflector
* 3D-assembly-30deg-reflec.geo:
	- geometry of 1/6 of the fuel assembly.
	- coolant channels don't go through the reflector
* 3D-assembly-30deg-reflecB.geo:
	- geometry of 1/6 of the fuel assembly.
	- coolant go through the reflector

* 3D-assembly-reflec.geo:
	- Fuel assembly column with reflectors.
	- Moderator and reflectors are the same material.

* 3D-fullcore-120-homo.geo:
	- 1/3 of the full core geometry.
	- Fuel, coolant, and moderator are an homogeneous mixture.

* 3D-fullcore-60-homo.geo:
	- 1/6 of the full core geometry.
	- Fuel, coolant, and moderator are an homogeneous mixture.

* 3D-unitcell.geo:
	- Unit cell.
	- No reflectors.
* 3D-unitcell-reflec.geo:
	- Unit cell.
	- Moderator and reflectors are 3 different materials.
	- Reflector does not include coolant holes.
* 3D-unitcell-reflecB.geo:
	- Unit cell.
	- Moderator and reflectors are 3 different materials.
	- Coolant channel goes across the reflector.

* plotter.i:
	- It is just to get the diagram in paraview. 'Converts' from .msh to .e by running the moltres input file.

save/ 
-----
- this files will be eventually deleted

- Python scripts:
	* fuel-assembly.py: Produces geometry of one fuel assembly without the top and bottom reflector.
	* fuel-assembly-reflector.py: Produces geometry of one fuel assembly with top and bottom reflector.

- geometries to help with the debugging:
    * cut-30.geo: 30 deg cut of the fuel assembly column with reflectors.
    * fuel.geo: just the fuel.
    * fuel-reflec.geo: fuel + top and bottom reflectors.
    * fuel-mod.geo: fuel + moderator + top and bottom reflectors.

- This files are in microreactors repo ./usnc, I think...
	* full-core.py: Produces full geometry. doesn't work. need to clean the code
	* extend-arc2D.py: Produces 2D geometry of 1/12th (30 degress) of the reactor. need to clean the code.
	Then the geometry has to be extruded and add the physical groups by hand to produce the 3D geometry.

- saving: to reproduce results
	* 2D-coolant.geo:
		- Coolant channel, H = 100.
		- This can be eventually deleted.