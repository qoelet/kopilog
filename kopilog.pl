
  isADrink(coffee).
  isADrink(tea).
  isADrink(milo).

  isAModifier(less_sugar).
  isAModifier(more_sugar).
  isAModifier(with_evaporated_milk).
  isAModifier(no_sugar).
  isAModifier(concentrated).
  isAModifier(diluted).
  isAModifier(cold).

  areModifiers([], []).
  areModifiers([H|T], [H|L]) :- isAModifier(H), areModifiers(T, L).

  translate(coffee, kopi).
  translate(tea, teh).
  translate(less_sugar, siudai).
  translate(more_sugar, kadai).
  translate(no_sugar, kosong).
  translate(with_evaporated_milk, si).
  translate(concentrated, gao).
  translate(diluted, po).
  translate(cold, peng).

  mapTranslate([], []).
  mapTranslate([H|T], [Ht|L]) :- translate(H, Ht), mapTranslate(T, L).

  list_to_string(L,S):- string_to_list(S,L).

  order(X, Y, O) :-
    isADrink(X),
    isAModifier(Y),
    translate(X, Xt),
    translate(Y, Yt),

    write(Xt), write(' '), write(Yt), nl.

  order(X, Yl, O) :-
    isADrink(X),
    areModifiers(Yl, Ym),
    translate(X, Xt),
    mapTranslate(Yl, Yt),

    write(Xt), write(' '), write(Yt), nl.

/*
?- order(coffee, [concentrated, less_sugar, with_evaporated_milk, cold], O).
kopi [gao,siudai,si,peng]
?- translate(X, siudai).
X = less_sugar.
*/
