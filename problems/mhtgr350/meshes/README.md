Geo & Meshes:
-------------
* 3D-assembly.geo:
	- Fuel assembly without reflector.

* 3D-assembly-30deg.geo:
	- geometry of 1/6 of the fuel assembly.
	- No reflector

* 3D-assembly-30deg-reflecB.geo:
	- geometry of 1/6 of the fuel assembly.
	- coolant go through the reflector

* 3D-assembly-reflec.geo:
	- Fuel assembly column with reflectors.
	- Moderator and reflectors are the same material.

* 3D-fullcore-60-homo.geo:
	- 1/6 of the full core geometry.
	- Fuel, coolant, and moderator are an homogeneous mixture.

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