open Batteries

let read_value of_string () =
  read_line () |> of_string

let read_list of_string () =
  read_line () |> String.nsplit ~by:" " |> List.map of_string

let read_tuple2 fst_of_string snd_of_string () =
  let s1, s2 = String.split ~by:" " (read_line ()) in
  (fst_of_string s1, snd_of_string s2)

let read_tuple3 fst_of_string snd_of_string trd_of_string () =
  let s1, s = String.split ~by:" " (read_line ()) in
  let s2, s3 = String.split ~by:" " s in
  (fst_of_string s1, snd_of_string s2, trd_of_string s3)

let print_value to_string x =
  to_string x |> print_endline

let print_list to_string xs =
  List.map to_string xs |> String.concat " " |> print_endline

let print_tuple2 fst_to_string snd_to_string (x, y) =
  print_endline @@ (fst_to_string x) ^ " " ^ (snd_to_string y)

let print_tuple3 fst_to_string snd_to_string trd_to_string (x, y, z) =
  print_endline @@ (fst_to_string x) ^ " " ^ (snd_to_string y) ^ " " ^ (trd_to_string z)

let print_option none_string print = function
  | None -> print_endline none_string
  | Some x -> print x

let run ?(newline=false) read solve print =
  let cases = read_int () in
  let rec solve_case n =
    let problem = read () in
    let solution = solve problem in
    let () = Printf.printf "Case #%d:%s" n (if newline then "\n" else " ") in
    let () = print solution in
    if n < cases then solve_case (n + 1) in
  solve_case 1
