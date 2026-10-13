# cairo-collection

Small Starknet contracts I use to debug tooling. Some are simple, some less so.

## Contracts

| Contract | File | What it does |
| --- | --- | --- |
| `Counter` | `src/counter.cairo` | One global `u64` counter. `increment()` adds 1; `get(address)` returns it (the address is ignored). |
| `UserValues` | `src/user_values.cairo` | One `u64` per caller. `set(amount)` stores a value for the caller; `get(address)` reads any address's value. |

## Build

```sh
scarb build
```

Scarb 2.11.4 is pinned in `.tool-versions`. There are no tests.
