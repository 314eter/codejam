open Batteries
open Codejam

let primes = List.map Big_int.of_int [2; 3; 5; 7]


let read = read_tuple2 int_of_string int_of_string

let next coin =
  let rec loop = function
    | [] -> []
    | c :: cs ->
      if c = 0 then 1 :: cs
      else 0 :: loop cs in
  1 :: loop (List.tl coin)

let divisor n =
  let open Big_int in
  let open Big_int.Infix in
  let open Big_int.Compare in
  let rec loop = function
    | p :: ps ->
      if modulo n p = zero then p
      else loop ps
    | [] -> zero in
  loop primes

let number coin base =
  let open Big_int in
  let value i c = if c = 0 then zero else base ** (of_int i) in
  List.reduce add @@ List.mapi value coin

let check coin =
  let open Big_int in
  let open Big_int.Compare in
  let rec loop base proof =
    let nb = number coin base in
    let div = divisor nb in
    if div = zero then (false, proof)
    else if base = (of_int 10) then (true, div :: proof)
    else loop (succ base) (div :: proof) in
  loop (succ one) []

let startcoin n =
  let rec loop i aux =
    if i > 1 then loop (i - 1) (0 :: aux)
    else 1 :: aux in
  loop (n - 1) [1]

let solve (n, j) =
  let rec loop coin foundcoins found =
    match check coin with
    | (false, _) -> loop (next coin) foundcoins found
    | (true, proof) ->
      let foundcoins = (coin, proof) :: foundcoins in
      let found = succ found in
      if found < j then loop (next coin) foundcoins found
      else foundcoins in
  loop (startcoin n) [] 0

let string_of_coin coin =
  String.of_list @@ List.rev_map (fun c -> if c = 0 then '0' else '1') coin

let string_of_proof proof =
  String.concat " " @@ List.rev_map string_of_int proof

let string_of_foundcoin (coin, proof) =
  (string_of_coin coin) ^ " " ^ (string_of_proof proof)

let print2 foundcoins =
  print_endline @@ String.concat "\n" @@ List.rev_map string_of_foundcoin foundcoins

let print foundcoins =
  let print_foundcoin (coin, proof) =
    let () =
      List.rev_map (fun c -> if c = 0 then '0' else '1') coin
      |> String.of_list
      |> print_string in
    let () = print_string " " in
    let () = List.rev_map Big_int.to_string proof
      |> String.concat " "
      |> print_string in
    print_newline () in
  List.iter print_foundcoin foundcoins

let () = run ~newline:true read solve print
