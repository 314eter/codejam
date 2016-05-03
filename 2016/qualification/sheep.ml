open Batteries
open Codejam

let read = read_int


let digits n =
  let rec loop aux n =
    if n == 0 then aux
    else loop ((n mod 10) :: aux) (n / 10) in
  loop [] n

let solve n =
  if n == 0 then None
  else
    let set = Array.create 10 false in
    let rec loop i found =
      let ni = n * i in
      let ds = digits ni in
      let check found d =
        if set.(d) then found
        else (set.(d) <- true; found + 1) in
      let found = List.fold_left check found ds in
      if found = 10 then ni else loop (i + 1) found in
    Some (loop 1 0)

let print = print_option "INSOMNIA" (print_value string_of_int)

let () = run read solve print
