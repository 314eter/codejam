val read_value: (string -> 'a) -> unit -> 'a

val read_list: (string -> 'a) -> unit -> 'a list

val read_tuple2: (string -> 'a) -> (string -> 'b) -> unit -> 'a * 'b

val read_tuple3: (string -> 'a) -> (string -> 'b) -> (string -> 'c) -> unit -> 'a * 'b * 'c

val print_value: ('a -> string) -> 'a -> unit

val print_list: ('a -> string) -> 'a list -> unit

val print_tuple2: ('a -> string) -> ('b -> string) -> 'a * 'b -> unit

val print_tuple3: ('a -> string) -> ('b -> string) -> ('c -> string) -> 'a * 'b * 'c -> unit

val print_option: string -> ('a -> unit) -> 'a option -> unit

val run: ?newline:bool -> (unit -> 'a) -> ('a -> 'b) -> ('b -> unit) -> unit
