parent (ratan,rabin).
parent (ratan,addo).

parent(ratna,rabin).
parent(ratna,addo).

parent(rabin,adi).

parent(richi,adi).

parent(addo,bilash).

parent(pakhi,bilash).

parent(adi,akash).

parent(adia,akash).

parent(bilash,ajay).

parent(bijoya,ajay).

parent(akash,matilal).

parent(akashi,matilal).

parent(ajay,nik).

parent(supti,nik).

parent(matilal,manoj).

parent(bela,manoj).

parent(nik,avi).

parent(naika,avi).

parent(manoj,twisha).

parent(rita,twisha).

parent(avi,greehee).

parent(aparna,greehee).


male(ratan).
male(rabin).
male(adi).
male(akash).
male(matilal).
male(manoj).
male(addo).
male(bilash).
male(ajay).
male(nik).
male(avi).



female(ratna).
female(richi).
female(adia).
female(akashi).
female(bela).
female(rita).
female(twisha).
female(pakhi).
female(bijoya).
female(supti).
female(naika).
female(aparna).
female(greehee).


father(X,Y):-
    parent(X,Y),
    male(X).

mother(X,Y):-
    parent(X,Y),
    female(X).

child(X,Y):-
    parent(Y,X).

partner(X,Y):-
    child(Z,X),
    child(Z,Y),
    X\=Y.

sibling(X,Y):-  
    father(Z, Y), 
    father(Z, X), 
    X\=Y.


brother(X,Y):-
    male(X),
    father(Z,X),
    father(Z,Y),
    X \= Y.

sister(X,Y):-
    female(X),
    father(Z,Y), 
    father(Z,X),
    X \= Y.

uncle(X,Y):-
    male(X),
    parent(Z,Y),
    brother(X,Z).

aunt(X,Y):-
    uncle(Z,Y),
    partner(Z,X).
    

grandparent(X,Z):-
    male(X),
    father(X,Y),
    father(Y,Z)|
    female(X),
    mother(X,Y),
    father(Y,Z).
    
greatgrandparent(X,Z):- 
    parent(X,Y),  
    grandparent(Y,Z).

greatgreatgrandparent(X,Z):- 
    parent(X,Y),
    greatgrandparent(Y,Z).

greatgreatgreatgrandparent(X,Z):- 
    parent(X,Y),
    greatgreatgrandparent(Y,Z).

cousin(X,Y):-
    grandparent(Z,X),
    grandparent(Z,Y),
    not(sibling(X,Y)),
    X\=Y.

cousinOnceRemoved(X, Y) :-
    grandparent(Z,X),
    greatgrandparent(Z, Y),
    not(child(Y,X)),
    not(child(X,Y))|
    greatgrandparent(Z, X), 
    grandparent(Z,Y),
    not(child(Y,X)),
    not(child(X,Y)).

cousinTwiceRemoved(X,Y) :-
    grandparent(Z,X), 
    cousin(Z,Y).

secondCousin(X,Y):-
    greatgrandparent(Z,X),
    greatgrandparent(Z,Y),
    not(sibling(X,Y)),
    X\=Y.

secondCousinOnceRemoved(X, Y) :-
    secondCousin(Z,Y), 
    parent(Z,X).

secondCousinTwiceRemoved(X,Y):-
    secondCousin(Z,Y), 
    grandparent(Z,X).

thirdCousin(X,Y):-
    greatgreatgrandparent(Z,X),
    greatgreatgrandparent(Z,Y),
    not(sibling(X,Y)),
    X\=Y.

thirdCousinOnceRemoved(X,Y):-
    thirdCousin(Z,Y), 
    parent(Z,X).
thirdCousinTwiceRemoved(X,Y):-
     thirdCousin(Z,Y), 
     greatgrandparent(Z,X).