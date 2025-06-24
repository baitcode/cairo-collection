use starknet::ContractAddress;

#[starknet::interface]
pub trait ICounter<TContractState> {
    fn increment(ref self: TContractState);
    fn get(self: @TContractState, address: ContractAddress) -> u64;
}

#[starknet::contract]
mod Counter {
    use starknet::storage::{StoragePointerReadAccess, StoragePointerWriteAccess};
    use starknet::{ContractAddress};

    #[storage]
    struct Storage {
        counter: u64,
    }

    #[abi(embed_v0)]
    impl CounterImpl of super::ICounter<ContractState> {
        fn increment(ref self: ContractState) {
            self.counter.write(self.counter.read() + 1);
        }

        fn get(self: @ContractState, address: ContractAddress) -> u64 {
            self.counter.read()
        }
    }
}
