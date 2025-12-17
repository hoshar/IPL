<div align="center">
<h1>IPL</h1>
<img src="https://img.shields.io/github/actions/workflow/status/hoshar/ipl/blank.yml">
<img src="https://img.shields.io/github/contributors/hoshar/IPL
">
<img src="https://img.shields.io/github/languages/count/hoshar/ipl
">
<img src="https://img.shields.io/github/languages/top/hoshar/ipl
">
</div>

<br>

IPL (**I**nterpreted **P**rogramming **L**anguage), is a small programming language that is in development. For now, the first prototype is implemented inside of the [Luau](https://github.com/luau-lang), which is unsandboxed via [Lune](https://github.com/lune-org). The next prototype will be implemented inside of [OCaml](https://github.com/ocaml). The last, and final interpreter will be implemented inside of Rust, to maximize the safety and performance of the language.

## Getting Started

The **Luau** version is currently the only stable version, that can be tested. Even thought it is 'stable', we still have some things to implement. We hope to have this development done by the next 3 months.

### Running with Lune

```bash
lune run proto/luau/eval.luau <file-name.ipl>
```

## Syntax

```ebnf
program = { statement }, EOF ;

statement =
    assignment
  | if_statement
  | function_definition
  | return_statement
  | expression
  ;

assignment =
    IDENTIFIER, "=", expression ;

if_statement =
    "if", expression, block, [ "else", block ] ;

function_definition =
    "func", IDENTIFIER, "(", [ parameter_list ], ")", block ;

return_statement =
    "return", expression ;

block =
    "{", { statement }, "}" ;

expression =
    additive ;

additive =
    multiplicative, { ( "+" | "-" ), multiplicative } ;

multiplicative =
    unary, { ( "*" | "/" ), unary } ;

unary =
    primary ;

primary =
      NUMBER
    | IDENTIFIER
    | function_call
    | lambda
    | "(", expression, ")" ;

function_call =
    IDENTIFIER, "(", [ argument_list ], ")" ;

argument_list =
    { expression } ;

parameter_list =
    { IDENTIFIER } ;

lambda =
    "λ", "(", [ parameter_list ], ")", block ;
```