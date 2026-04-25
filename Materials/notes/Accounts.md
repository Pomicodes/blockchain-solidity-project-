Accounts
In Ethereum, accounts are often distinguished into two types: Externally Owned Accounts and Contract Accounts. The differences between these accounts is largely conceptual as the EVM essentially treats them the same!

Every account on the EVM has a public address and a balance. Contract accounts will also store their bytecode as well as their internal storage data.

When making a call from an EOA to a Contract Account it's important to know things like who is making the call, how much ether they are sending and the function they are intending to invoke with which arguments.

The Solidity language handles the wiring up of the transaction data to the function we have defined on the contract. The language also gives us access to the transaction parameters through globals like msg.sender and msg.value.

By providing these utilities for working with accounts we can easily define roles, permissions and track token balances in contracts. Let's learn all about working with accounts in Solidity!
