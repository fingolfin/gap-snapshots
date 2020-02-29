//****************************************************************************//
// File        : HPCombi-config.h
// Description : Configuration of HPCombi
//
// 
//****************************************************************************//

#ifndef HPCOMBI_CONFIG_HPP
#define HPCOMBI_CONFIG_HPP

// Whether the compiler provide the "experimental/numeric" include file
#define HPCOMBI_HAVE_EXPERIMENTAL_NUMERIC

// Whether std::experimental::lcm function works
/* #undef HPCOMBI_HAVE_EXPERIMENTAL_NUMERIC_LCM */

// Google sparse hash map
/* #undef HPCOMBI_HAVE_DENSEHASHMAP */

// Google sparse hash set
/* #undef HPCOMBI_HAVE_DENSEHASHSET */

// GCC-4.8 constexpr function argument bug
#define HPCOMBI_CONSTEXPR_FUN_ARGS

#endif  // HPCOMBI_CONFIG_HPP
