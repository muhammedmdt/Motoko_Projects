import Icrc1Ledger "canister:icrc1_ledger_canister";
import Error "mo:base/Error";
import Blob "mo:base/Blob";
import Option "mo:base/Option";
import Result "mo:base/Result";
import Debug "mo:base/Debug";

actor{

type Account ={
 owner : Principal;
 subaccount : ?[Nat8]
};

type TransferArgs = {
  amount : Nat;
  toAccaunt : Account;
};

public shared ({caller}) func transfer(args:TransferArgs) : async Result.Result<Icrc1Ledger.BlockIndex, Text>{

  Debug.print(
    "Transfering" 
    # debug_show(args.amount)
    # " token to account"
    #  debug_show(args.toAccaunt)
  );
};

let transferArg : Icrc1Ledger.TransferArgs = {
  memo = null;
  amount = args.amount;
  from_subaccount = null;
  fee = null;
  to = args.toAccaunt;
  created_at_time = null;
};

try{
  let transferResult = await Icrc1Ledger.icrc1_transfer(transferArgs);
  switch(trasferResult){
    case(#Err(transferError)){
      #err("Couldn't transfer funds\n" # debug_show(transferError))
    };
    case (#Ok(blockIndex)){return #ok blockIndex}
  };
} catch(error:Error){
  #err("Reject message: " #Error.message(error))
};


};