(** Ocaml helper module for {{:https://code.google.com/codejam} Google Codejam}
    @author: Pieter Goetschalckx *)

(** Read problems, solve them and print the solutions with [run read solve print].

    [read ()] should read exactly one problem from stdin. The output of [read]
    is passed to [solve], and the solution is printed with [print].

    The input is expected to be in standard codejam format, starting with a line with the number of problems.
    The output of each solution is prepended with {b "Case #x: "}, with {b x} starting from 1.

    @param newline Print the solution on a new line, after {b "Case #x:"} *)
val run: ?newline:bool -> (unit -> 'a) -> ('a -> 'b) -> ('b -> unit) -> unit

(** [read_value of_string ()] reads one line,
    and converts it to a value with [of_string]. *)
val read_value: (string -> 'a) -> unit -> 'a

(** [read_list of_string ()] reads one line with space-separated strings,
    and converts it to a list with [of_string]. *)
val read_list: (string -> 'a) -> unit -> 'a list

(** [read_tuple2 fst_of_string snd_of_string ()] reads one line with two space-separated strings,
    and converts it to a pair with [fst_of_string] and [snd_of_string]. *)
val read_tuple2: (string -> 'a) -> (string -> 'b) -> unit -> 'a * 'b

(** [read_tuple3 fst_of_string snd_of_string trd_of_string ()] reads one line with three space-separated strings,
    and converts it to a 3-tuple with [fst_of_string], [snd_of_string] and [trd_of_string]. *)
val read_tuple3: (string -> 'a) -> (string -> 'b) -> (string -> 'c) -> unit -> 'a * 'b * 'c

(** [print_value to_string value] converts [value] to a string with [to_string],
    and prints this string. *)
val print_value: ('a -> string) -> 'a -> unit

(** [print_list to_string values] converts [values] to a space-separated string with [to_string],
    and prints this string. *)
val print_list: ('a -> string) -> 'a list -> unit

(** [print_tuple2 fst_to_string snd_to_string (x, y)] converts [x] and [y] to a space-separated string
    with [fst_to_string] and [snd_to_string], and prints this string. *)
val print_tuple2: ('a -> string) -> ('b -> string) -> 'a * 'b -> unit

(** [print_tuple3 fst_to_string snd_to_string trd_to_string (x, y, z)] converts [x], [y] and [z] to a space-separated string
    with [fst_to_string], [snd_to_string] and [trd_to_string], and prints this string. *)
val print_tuple3: ('a -> string) -> ('b -> string) -> ('c -> string) -> 'a * 'b * 'c -> unit

(** [print_option none_string print None] prints none_string.
    [print_option none_string print (Some value)] prints [value] with [print]. *)
val print_option: string -> ('a -> unit) -> 'a option -> unit
