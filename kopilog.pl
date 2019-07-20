/* before you hit the coffeeshops, ask Kopilog! */

  isADrink(espresso).
  isADrink(coffee).
  isADrink(tea).
  isADrink(milo).
  isADrink(horlicks).

  /* mods */
  sugar(less).
  sugar(more).
  sugar(none).
  sugar(normal).
  milk(evaporated).
  milk(condensed).
  temperature(hot).
  temperature(cold).
  dilution_factor(high).
  dilution_factor(low).
  dilution_factor(normal).

  /* rough translations */
  translate(espresso, tilok).
  translate(coffee, kopi).
  translate(tea, teh).
  translate(milo, takkiu).
  translate(horlicks, daikahou).
  translate(sugar(less), siudai).
  translate(sugar(more), kadai).
  translate(sugar(none), kosong).
  translate(sugar(normal), '').
  translate(milk(evaporated), si).
  translate(milk(condensed), '').
  translate(dilution_factor(low), gao).
  translate(dilution_factor(high), po).
  translate(dilution_factor(normal), '').
  translate(temperature(cold), peng).
  translate(temperature(hot), sio).

  writeTranslated(D, M, F, S, T) :-
    translate(D, Dt),
    translate(milk(M), Mt),
    translate(dilution_factor(F), Ft),
    translate(sugar(S), St),
    translate(temperature(T), Tt),
    /* side effects */
    writeWithSpaces([Dt, Mt, Ft, St, Tt]).

  writeWithSpaces([]) :- nl.
  writeWithSpaces([''|T]) :- writeWithSpaces(T).
  writeWithSpaces([H|T]) :-
    write(H),
    write(' '),
    writeWithSpaces(T).

  /* we want to write out the translated term with the right positional order */
  order(espresso, sugar(none), milk(none), temperature(hot), dilution_factor(none)) :-
    translate(espresso, X),
    writeWithSpaces([X]), !.
  order(D, sugar(S), milk(M), temperature(T), dilution_factor(F)) :-
    D \= espresso,
    isADrink(D),
    writeTranslated(D, M, F, S, T), !.

/*
$ swipl
?- [kopilog].
true.

?- order(tea, sugar(less), milk(condensed), temperature(cold), dilution_factor(low)).
teh gao siudai peng
true .

?- order(coffee, sugar(none), milk(condensed), temperature(hot), dilution_factor(low)).
kopi gao kosong sio
true .

?- translate(sugar(none), S).
S = kosong.
*/
