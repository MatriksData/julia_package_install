#!/bin/bash
if [ -e REQUIRE ]
then
    for pkg in `egrep -v "^julia " REQUIRE` ; do
        if [[ "$pkg" != [0-9]* ]]
        then
            cmd="julia -e 'Pkg.add(\"$pkg\")'"
            eval $cmd
        fi
    done
    
    julia -e 'Pkg.update()'
else
    echo REQUIRE file does not exist
fi
