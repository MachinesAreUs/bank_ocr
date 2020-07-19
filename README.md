# Bank OCR

Solution to the [Bank OCR Kata](https://codingdojo.org/kata/BankOCR/)

## Running

The whole thing can be run fro iex. For example:

```elixir
iex(1)> BankOCR.process("./data/accounts.txt")
123456789 OK
912345678 ERR
891234567 ERR
789123456 ERR
678912345 ERR
000000000 OK
:ok

iex(2)> BankOCR.process("./data/accounts_illegible.txt")
?23456789 ILL
9?2345678 ILL
89?234567 ILL
789?23456 ILL
6789?2345 ILL
:ok
```

There are also lots of tests for individual modules. Coverage is more than 80%.
