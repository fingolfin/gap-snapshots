ReadPackage( "ExamplesForHomalg", "examples/Mixed.g" );

filt := PurityFiltration( V );

II_E := SpectralSequence( filt );

m := IsomorphismOfFiltration( filt );

