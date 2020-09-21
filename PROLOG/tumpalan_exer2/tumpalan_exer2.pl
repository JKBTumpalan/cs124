course(cs124).
course(cs132).
course(cs170).
course(cs141).
course(cs125).
takehome(cs124_exers).
takehome(cs170_exers).
submit(annabeth, cs132_exers).
submit(annabeth, cs141_exers).
submit(rachel,cs141_exers).
submit(calypso, cs170_exers).
pass(rachel, cs125_exams).
pass(rachel, cs132_exams).
pass(calypso, cs124_exams).
pass(calypso, cs125_exams).
pass(annabeth, cs170_exams).
pass(annabeth, cs141_exams).
finish(X, cs124) :- pass(X, cs124_exams);
                    submit(X,cs124_exers), takehome(cs124_exers).
finish(X, cs125) :- pass(X, cs125_exams);
                    submit(X,cs125_exers), takehome(cs125_exers).
finish(X, cs141) :- pass(X, cs141_exams);
                    submit(X,cs141_exers), takehome(cs141_exers).
finish(X, cs132) :- pass(X, cs132_exams);
                    submit(X,cs132_exers), takehome(cs132_exers).
finish(X, cs170) :- pass(X, cs170_exams);
                    submit(X,cs170_exers), takehome(cs170_exers).
                