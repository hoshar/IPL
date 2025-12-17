type token =
  | Number of float
  | String of string
  | Identifier of string
  | If
  | Else
  | Func
  | Return
  | Plus
  | Minus
  | Star
  | Slash
  | Equal
  | LParen
  | RParen
  | LBrace
  | RBrace
  | Lambda
  | EOF