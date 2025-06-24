use starknet::ContractAddress;

#[starknet::interface]
pub trait IUserValues<TContractState> {
    fn set(ref self: TContractState, amount: u64);
    fn get(self: @TContractState, address: ContractAddress) -> u64;
}

#[starknet::contract]
mod UserValues {
    use starknet::storage::{
        StoragePointerReadAccess, StoragePointerWriteAccess, StoragePathEntry, Map,
    };
    use starknet::{ContractAddress, get_caller_address};

    #[storage]
    struct Storage {
        user_values: Map<ContractAddress, u64>,
    }

    #[abi(embed_v0)]
    impl UserValuesImpl of super::IUserValues<ContractState> {
        fn set(ref self: ContractState, amount: u64) {
            let caller = get_caller_address();
            self.user_values.entry(caller).write(amount);
        }

        fn get(self: @ContractState, address: ContractAddress) -> u64 {
            self.user_values.entry(address).read()
        }
    }
}
