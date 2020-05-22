Geo & Meshes:
-------------

Will add 2D case w/ without reflector



- Unit cell:
	* unit-cell.geo: unit cell geometry of the mhtgr-350. It doesn't inlcude the top and bottom reflectors.
	* unit-cell.msh: mesh 4.0 ASCII with h=10.

- Unit cell w/ reflector:
	* unit-cell-reflec.geo: unit cell geometry of the mhtgr-350 that includes the reflector.
	* unit-cell-reflec.msh: mesh 4.0 ASCII with h=10.

- Fuel assembly:
	* fuel-assembly.geo: geometry of the fuel assembly without reflector.
	* fuel-assembly.msh: mesh 4.0 ASCII with h=20.

- Fuel assembly w/ reflector:
	* fuel-assembly-reflec.geo: geometry of the fuel assembly column with reflectors.
	* fuel-assembly-reflec.msh: mesh 4.0 ASCII with h=20.






- Full core w/reflector:
	* cut-30.geo: 30 deg cut of the fuel assembly column with reflectors.
	* cut-30.msh: mesh 4.0 ASCII with h=10.

this files will be eventually deleted:
--------------------------------------
- Geometries to help with the debugging:
    * fuel.geo: just the fuel.
    * fuel-reflec.geo: fuel + top and bottom reflectors.
    * fuel-mod.geo: fuel + moderator + top and bottom reflectors.

Python scripts:
---------------
* fuel-assembly.py: Produces geometry of one fuel assembly without the top and bottom reflector.
* fuel-assembly-reflector.py: Produces geometry of one fuel assembly with top and bottom reflector.

This files are in microreactors repo ./usnc, I think...
* full-core.py: Produces full geometry. doesn't work. need to clean the code
* extend-arc2D.py: Produces 2D geometry of 1/12th (30 degress) of the reactor. need to clean the code.
Then the geometry has to be extruded and add the physical groups by hand to produce the 3D geometry.
