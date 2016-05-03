open Batteries
open Codejam

let read () =
  let convert c = (c = '+') in
  List.map convert (String.to_list (read_line ()))

let solve = function
  | [] -> 0
  | pancake :: pancakes ->
    let rec loop pancakes cur found =
      match pancakes with
      | [] -> if cur then found else found + 1
      | p :: ps ->
        if cur = p then loop ps p found
        else loop ps p (found + 1) in
    loop pancakes pancake 0

let () = run read solve (print_value string_of_int)
