/*
sde3 is designed to demonstate Experience with Declarative Programming,
Prolog, as well as releasing the software under copyright protection.

Copyright (C) 2017 Curtis John Laurence.

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

You may contact the author for additional copyright information at:
clauren@clemson.edu
*/

/*		Copyright Notice		*/
:- 
write('Welcome to SDE3 (Version 4.1.1)'), nl, 
write('Copyright (C) 2017 Curtis John Laurence.'), nl,
write('SDE3 comes with absolutely no Warranty.'), nl,
write('This is free software and you are free to redistribute it.'), nl, 
write('See LICENSE for details').

/* Mu definition */

mu(((Dl, Dh), Slist)) :-
  domain(Dl,Dh),
  check_list(Slist),
  check_first(Dl,Slist),
  check_last(Dh,Slist),
  check_dl(Dl,Slist),
  check_dh(Dh,Slist).

/* Confirm slist is valid */

check_list([(A,B)]) :- 
  integer(A),
  float(B),
  !.

check_list([(A,B)|T]) :-
  integer(A),
  float(B),
  check_list(T).

/* Ensure valid Domain */

domain(A,B) :-
  integer(A),
  integer(B),
  B @>= A.

/* Ensure Dl == integer of first member */

check_first(Dl, [(A,B)]) :-
  compare(=,Dl,A),
  float(B),
  !.

check_first(Dl, [(A,B)|T]) :-
  compare(=,Dl,A),
  float(B),
  check_list(T).

/* Ensure Dh == integer of Last member */

check_last(Dh, [(A,B)]) :-
  compare(=,Dh,A),
  float(B),
  !.

check_last(Dh, [(A,B)|T]) :-
  integer(A),
  float(B),
  check_last(Dh,T).

/* Ensure tuples are in the domain */

check_dl(Dl, [(A,B)]) :-
  A @>= Dl,
  float(B),
  !.

check_dl(Dl, [(A,B)|T]) :-
  A @>= Dl,
  float(B),
  check_dl(Dl,T).

check_dh(Dh, [(A,B)]) :-
  A @=< Dh,
  float(B),
  !.

check_dh(Dh, [(A,B)|T]) :-
  A @=< Dh,
  float(B),
  check_dh(Dh,T).

