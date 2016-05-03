open Batteries
open Codejam

let read () =
  let n = read_int () in
  let read_paper = read_list int_of_string in
  let papers = List.of_enum (Enum.init (2 * n - 1) (fun _ -> read_paper ())) in
  (n, papers)

let solve (n, papers) =
  let heightcounts = Array.make 2500 0 in
  let addone height =
    heightcounts.(height - 1) <- heightcounts.(height - 1) + 1 in
  let countpaper paper =
    List.iter addone paper in
  let () = List.iter countpaper papers in
  let selectodds odds i count =
    if count mod 2 = 0 then odds else i :: odds in
  let odds = Array.fold_lefti selectodds [] heightcounts in
  List.sort compare odds

let print = print_list string_of_int

let () = run read solve print
