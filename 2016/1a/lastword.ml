open Batteries
open Codejam

let read = read_line

let max_pos s =
  let comp (pos, max) i c =
    if c >= max then (i, c)
    else (pos, max) in
  String.fold_lefti comp (0, String.get s 0) s

let rec solve s =
  if String.is_empty s then ""
  else
    let maxpos, max = max_pos s in
    let s1 = String.left s maxpos in
    let s2 = String.tail s (maxpos + 1) in
    (String.of_char max) ^ (solve s1) ^ s2

let () = run read solve print_endline
