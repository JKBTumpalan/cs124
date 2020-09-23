takehome(cs124).
takehome(cs170).
submit(annabeth, cs132).
submit(annabeth, cs141).
submit(rachel,cs141).
submit(calypso, cs170).
pass(rachel, cs125).
pass(rachel, cs132).
pass(calypso, cs124).
pass(calypso, cs125).
pass(annabeth, cs170).
pass(annabeth, cs141).
finish(X, Z) :- pass(X, Z);
                submit(X,Z), takehome(Z).