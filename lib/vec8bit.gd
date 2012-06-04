#############################################################################
##
#W  vec8bit.gd                   GAP Library                     Steve Linton
##
##
#Y  Copyright (C)  1997,  Lehrstuhl D für Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file should possibly be called vec8bit.g  (see also vecmat.gd)
##  It provides some things that the kernel needs from the library 
##

#############################################################################
##
#R  Is8BitVectorRep( <obj> ) . . . compressed vector over GFQ (3 <= q <= 256)
##
DeclareRepresentation( "Is8BitVectorRep", 
        IsDataObjectRep and IsRowVectorObj,[],
        IsRowVector and IsSmallList );

#############################################################################
##
#v  TYPES_VEC8BIT . . . . . . . . prepared types for compressed GF(q) vectors
##
##  A length 3 list of length 257 lists. TYPES_VEC8BIT[1][q] will be the type
##  of mutable vectors over GF(q), TYPES_VEC8BIT[2][q] is the type of 
##  immutable vectors. TYPES_VEc8BIT[3][q] is the type of locked vectors.
##  The 257th position is bound to 1 to stop the lists
##  shrinking.
##
##  It is accessed directly by the kernel, so the format cannot be changed
##  without changing the kernel.
##
DeclareGlobalVariable( "TYPES_VEC8BIT" );

#############################################################################
##
#F  TYPE_VEC8BIT( <q>, <mut> ) . .  computes type of compressed GF(q) vectors
##
##  Normally called by the kernel, caches results in TYPES_VEC8BIT
##
DeclareGlobalFunction( "TYPE_VEC8BIT" );
DeclareGlobalFunction( "TYPE_VEC8BIT_LOCKED" );

#############################################################################
##
#V  TYPE_FIELDINFO_8BIT . . . . . . . . . . . . .  type of the fieldinfo bags
##
##  These bags are created by the kernel and accessed by the kernel. The type
##  doesn't really say anything, because there are no applicable operations.
##
DeclareGlobalVariable( "TYPE_FIELDINFO_8BIT" );

#############################################################################
##
#M  IsConstantTimeAccessList( <obj> )
#M  IsSmallList( <obj> )
#M  IsListDefault( <obj> )
##
##  All compressed GF(q) vectors are small and constant-time access,
##  and support the default list arithmetic (multiplication and addition).
##

InstallTrueMethod( IsConstantTimeAccessList, IsList and Is8BitVectorRep );
InstallTrueMethod( IsSmallList, IsList and Is8BitVectorRep );
InstallTrueMethod( IsListDefault, IsList and Is8BitVectorRep );


#############################################################################
##
#E

