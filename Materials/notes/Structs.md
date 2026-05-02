Structs
Structs provide Solidity Developers with a way to build custom data types. These data types can have multiple fields of data types we already have previously discussed.

For example:

struct Account {
uint balance;
bool isActive;
}
This struct is composed of a uint and a bool. If this struct were defined outside of a contract, it can be shared across multiple contracts like so:

struct Account {
uint balance
bool isActive;
}

contract A {
Account owner;
Account recipient;
}

contract B {
mapping (address => Account) accounts;
}
