/*
 Write a prolog Program that matches the family tree of Greek gods.
 The program will tell us who the mother, father, sister, brother,
 aunt, uncle, grandmother, grandfather, brother in law, sister in
 law, mother in law, father in law, ancestor,
 and descendent of someone is based on the family tree here .
*/

 /*1. Parent-Child relationship */

 % Primordial Gods
parent(chaos, nyx).
parent(nyx, erebus).
parent(nyx, aether).
parent(nyx, hemera).

% Titans and Gods
parent(uranus, cronus).
parent(uranus, rhea).
parent(uranus, oceanus).
parent(uranus, tethys).
parent(uranus, mnemosyne).
parent(uranus, themis).
parent(uranus, coeus).
parent(uranus, phoebe).
parent(uranus, hyperion).
parent(uranus, theia).
parent(uranus, iapetus).
parent(uranus, clymene).

parent(gaia, cronus).
parent(gaia, rhea).
parent(gaia, oceanus).
parent(gaia, tethys).
parent(gaia, mnemosyne).
parent(gaia, themis).
parent(gaia, coeus).
parent(gaia, phoebe).
parent(gaia, hyperion).
parent(gaia, theia).
parent(gaia, iapetus).
parent(gaia, clymene).

% Olympians
parent(cronus, hestia).
parent(cronus, poseidon).
parent(cronus, hades).
parent(cronus, demeter).
parent(cronus, hera).
parent(cronus, zeus).

parent(rhea, hestia).
parent(rhea, poseidon).
parent(rhea, hades).
parent(rhea, demeter).
parent(rhea, hera).
parent(rhea, zeus).

% Zeus children
parent(zeus, athena).
parent(zeus, ares).
parent(zeus, hebe).
parent(zeus, hephaestus).
parent(zeus, artemis).
parent(zeus, apollo).
parent(zeus, hermes).
parent(zeus, persephone).
parent(zeus, dionysus).
parent(zeus, aphrodite).

parent(hera, ares).
parent(hera, hebe).
parent(hera, hephaestus).

parent(demeter, persephone).

parent(leto, artemis).
parent(leto, apollo).

parent(maia, hermes).

parent(dione, aphrodite).

parent(semale, dionysus).

/* 2. Defining gender*/

% Males
male(chaos).
male(erebus).
male(aether).
male(uranus).
male(cronus).
male(oceanus).
male(coeus).
male(hyperion).
male(iapetus).
male(zeus).
male(poseidon).
male(hades).
male(apollo).
male(ares).
male(hermes).
male(hephaestus).
male(dionysus).
male(atlas).
male(prometheus).
male(epimetheus).

% Females
female(nyx).
female(hemera).
female(gaia).
female(rhea).
female(tethys).
female(mnemosyne).
female(themis).
female(phoebe).
female(theia).
female(clymene).
female(hera).
female(hestia).
female(demeter).
female(persephone).
female(artemis).
female(athena).
female(aphrodite).
female(leto).
female(maia).
female(dione).
female(semale).
female(eos).
female(selene).

/* 3. Relationship Rules */

% Mother
mother(M, C) :- parent(M, C), female(M).

% Father
father(F, C) :- parent(F, C), male(F).

% Sibling (Brother/Sister)
sibling(A, B) :- parent(P, A), parent(P, B), A \= B.

% Brother
brother(B, S) :- sibling(B, S), male(B).

% Sister
sister(S, B) :- sibling(S, B), female(S).

% Grandparent
grandparent(GP, C) :- parent(GP, P), parent(P, C).

% Grandmother
grandmother(GM, C) :- grandparent(GM, C), female(GM).

% Grandfather
grandfather(GF, C) :- grandparent(GF, C), male(GF).

% Uncle (Brother of Parent)
uncle(U, C) :- parent(P, C), brother(U, P).

% Aunt (Sister of Parent)
aunt(A, C) :- parent(P, C), sister(A, P).

% Ancestor (Recursive)
ancestor(A, D) :- parent(A, D).
ancestor(A, D) :- parent(A, X), ancestor(X, D).

% Descendant (Recursive)
descendant(D, A) :- ancestor(A, D).

/* 4. Extended Family Relationships */

% Brother-in-law (Husband of Sibling OR Brother of Spouse)
brother_in_law(BIL, P) :- brother(BIL, S), married(S, P).
brother_in_law(BIL, P) :- husband(BIL, S), sibling(S, P).

% Sister-in-law (Wife of Sibling OR Sister of Spouse)
sister_in_law(SIL, P) :- sister(SIL, S), married(S, P).
sister_in_law(SIL, P) :- wife(SIL, S), sibling(S, P).

% Mother-in-law (Mother of Spouse)
mother_in_law(MIL, P) :- mother(MIL, S), married(S, P).

% Father-in-law (Father of Spouse)
father_in_law(FIL, P) :- father(FIL, S), married(S, P).

/* 5. Marriages */

married(zeus, hera).
married(cronus, rhea).
married(oceanus, tethys).
married(hyperion, theia).
married(iapetus, clymene).
married(coeus, phoebe).
married(leto, zeus).
married(maia, zeus).
married(demeter, zeus).
married(dione, zeus).
