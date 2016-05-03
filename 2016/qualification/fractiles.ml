open Batteries
open Codejam

let read = read_tuple3 int_of_string int_of_string int_of_string

let to_clean k c =
  int_of_float (ceil ((float_of_int k) /. (float_of_int c)))

let solve (k, c, s) =
  let needed = to_clean k c in
  if needed > s then None
  else
    let rec loop placed tiles =
      if placed = needed then tiles
      else
        let tile = (Enum.sum @@ Enum.init c (fun i -> (placed * c + i) * (Int.pow k i))) mod (Int.pow k c) in
        loop (placed + 1) (tile::tiles) in
    Some (loop 0 [])

let print =
  let print_tiles tiles =
    List.rev_map succ tiles |> print_list string_of_int in
  print_option "IMPOSSIBLE" (print_tiles)

let () = run read solve print
