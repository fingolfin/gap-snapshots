#############################################################################
##
#W  float.g                        GAP library         Steve Linton
##
#H  @(#)$Id: float.g,v 4.2 2002/04/15 10:04:40 sal Exp $
##
#Y  Copyright (C)  1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file deals with floats
##
Revision.float_g :=
  "@(#)$Id: float.g,v 4.2 2002/04/15 10:04:40 sal Exp $";



BIND_GLOBAL( "FloatsFamily", 
        NewFamily( "FloatsFamily", IS_FLOAT ));

BIND_GLOBAL( "TYPE_FLOAT", 
        NewType(FloatsFamily, IS_FLOAT and IsInternalRep and IsScalar
                and IsCommutativeElement));

BIND_GLOBAL( "TYPE_FLOAT0", 
        NewType(FloatsFamily, IS_FLOAT and IsInternalRep and IsZero and IsScalar
                and IsCommutativeElement));

#############################################################################
##
#E

