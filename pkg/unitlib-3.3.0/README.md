# GAP package UnitLib

Let KG be  a group algebra  of  a  finite  p-group  G  over  the  field  K of 
characteristic  p,  and  let  V(KG)  be  the normalized  unit  group  of  KG. 
The  pc-presentation  of  the  group  V(KG)  can be computed  using  the  GAP 
package   LAGUNA   (http://www.cs.st-andrews.ac.uk/~alexk/laguna/),   but  for 
groups of orders 64 and more this computation already takes a lot of time.

The UnitLib package  is an extension  of the LAGUNA package  that is aimed on 
this problem.  It contains the library  of normalized unit groups  of modular 
group algebras of  finite p-groups  over the field of p elements. This allows 
the user  to retrieve the  pre-computed group from the library instead of the 
long-time computation.  The group  created  with  UnitLib will  have the same 
properties and attributes as the one computed with LAGUNA.

The current version  of UnitLib  contains normalized  unit groups  V(KG)  for 
all p-groups of order not greater than 243.

Libraries  of  normalized  unit groups  of groups  of all  orders  not  larger 
than 243, except for the order 128, are available in any operating system.  

The library for  groups  of order 128  was compressed using gzip program and, 
therefore,  will be available  only  in  UNIX-type systems  (including  UNIX-
installation in Mac OS X and Cygwin installation in Windows).  

To work  with the library  for groups  of order 243 you will also need the IO
package by Max Neunhöffer to retrieve the data from the UnitLib homepage.

The UnitLib package is redistributed with GAP,  but is not loaded by default. 
Therefore, to use UnitLib, first you need to load it as follows:

    gap> LoadPackage("unitlib");


Alexander Konovalov and Elena Yakimenko