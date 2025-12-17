{
    (* Part of IPL *)

    open Token

    let keyword_table = [
        "if", If;
        "else", Else;
        "func", Func;
        "return", Return;
    ]

    let is_keyword s =
        try Some (List.assoc s keyword_table)
        with Not_found -> None
}

rule token = parse
  | [' ' '\t' '\n'] { token lexbuf }
  | ['0'-'9']+ ('.' ['0'-'9']+)? as l { Number (float_of_string l) }
  | ['a'-'z' 'A'-'Z' '_']['a'-'z' 'A'-'Z' '0'-'9' '_']* as l
    {
      match is_keyword l with
      | Some kw -> kw
      | None -> Identifier l
    }
  | '+' { Plus }
  | '-' { Minus }
  | '*' { Star }
  | '/' { Slash }
  | '=' { Equal }
  | '(' { LParen }
  | ')' { RParen }
  | '{' { LBrace }
  | '}' { RBrace }
  | '\\' { Lambda }
  | eof { EOF }
  | _ as c { failwith ("Unexpected character: " ^ String.make 1 c) }