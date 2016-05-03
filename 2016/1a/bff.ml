open Batteries
open Codejam

let read () =
  let n = read_int () in
  let bffs = read_list int_of_string () in
  (n, bffs)

type kind = Cycle | Ended | Nothing

let solve (n, bffs) =
  let bffs = List.enum bffs |> Array.of_enum in
  let bff i = bffs.(i - 1) in
  let runs = Array.make n (Nothing, []) in
  let run start =
    let used = Array.make n false in
    let rec loop last i =
      let next = bff i in
      if next = start then (Cycle, [])
      else if next = last then (Ended, [])
      else if used.(next - 1) then (Nothing, [])
      else
        let () = used.(next - 1) <- true in
        let kind, l = loop i next in
        (kind, next :: l) in
    loop (-1) start in
  let () = for i = 1 to n do
      runs.(i - 1) <- run i
    done in
  ()
