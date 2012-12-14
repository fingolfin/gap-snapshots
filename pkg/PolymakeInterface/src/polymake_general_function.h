// The usual Header.
#include "loadgap.h"
#include "polymake_data.h"

#include <polymake/Main.h>
#include <polymake/Matrix.h>
#include <polymake/Rational.h>
//#include <polymake/common/lattice_tools.h>

#include <iostream>
#include <map>
#include <utility>

using std::cerr;
using std::endl;
using std::string;
using std::map;
using std::pair;

Obj REAL_TAKE_PROPERTY( Polymake_Data*, Obj, );
