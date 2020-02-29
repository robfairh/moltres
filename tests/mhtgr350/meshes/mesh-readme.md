Geo & Meshes:
-------------

- Unit Cell:
	* unit-cell.geo: unit cell geometry of the mhtgr-350. It doesn't inlcude the top and bottom reflectors.
	* unit-cell.msh: mesh 4.0 ASCII with h=10.

- Unit Cell w/ reflector:
	* unit-cell-reflec.geo: unit cell geometry of the mhtgr-350 that includes the reflector.
	* unit-cell-reflec.msh: mesh 4.0 ASCII with h=10.
	* unit-cell-reflecb.geo: unit cell geometry of the mhtgr-350 that includes the reflector. Dimensions reduced.
	* unit-cell-reflecb.msh: mesh 4.0 ASCII with h=1.
	This one was for the purpose of seeing the results, cause the fuel column is very thin.

- Fuel Assembly:
	* fuel-assembly.geo: geometry of the fuel assembly without reflector.
	* fuel-assembly.msh: mesh 4.0 ASCII with h=20.

- Fuel Assembly w/ Reflector:
	* fuel-assembly-reflector.geo: geometry of the fuel assembly column with reflector.
	* fuel-assembly-reflector.msh: mesh 4.0 ASCII with h=20.
	* fuel-assembly-reflectorb.geo: geometry of the fuel assembly column with reflector. Dimensions reduced.
	* fuel-assembly-reflectorb.msh: mesh 4.0 ASCII with h=2.
	This one was for the purpose of seeing the results, cause the fuel column is very thin.

- Debugging:
    * fuel.geo: just the fuel.
    * fuel.msh: mesh 4.0 ASCII.
    * fuel-reflec.geo: fuel and top and bottom reflectors.
    * fuel-reflec.msh: mesh 4.0 ASCII.

Python scripts:
---------------

* fuel-assembly.py: Produces geometry of one fuel assembly without the top and bottom reflector. It works.

* fuel-assembly-reflector.py: Produces geometry of one fuel assembly with top and bottom reflector. On progress.



* full-core.py: Produces full geometry. doesn't work. need to clean the code

* extend-arc2D.py: Produces 2D geometry of 1/12th (30 degress) of the reactor. need to clean the code.
Then the geometry has to be extruded and add the physical groups by hand to produce the 3D geometry.