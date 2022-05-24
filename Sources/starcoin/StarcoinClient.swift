//
//  File.swift
//  
//
//  Created by mac on 2022/5/23.
//

import Foundation

import SwiftJSONRPC
import PromiseKit


class StarcoinClient: RPCService {

    public init(url: String) {
        let url = URL(string: url)!
        let client = RPCClient(url: url)
        super.init(client: client)
    }


    func nodeInfo() -> Promise<NodeInfo> {
        invoke("node.info")
    }

//
//    func getEvents(eventFilter: EventFilter) -> Promise<Any> {
//       invoke("chain.get_events",  params: [eventFilter] );
//    }
//
//    func getTransactionProof(blockHash: String, txGlobalIndex: Int, eventIndex: Int) -> Promise<Any> {
//       invoke("chain.get_transaction_proof",params: [blockHash, txGlobalIndex, eventIndex]);
//    }
//
//    func getTransactionByHash(transactionHash: String) -> Promise<Any> {
//       invoke("chain.get_transaction",params: [transactionHash]);
//    }
//
//    func getPendingTransactionByHash(transactionHash: String) -> Promise<Any> {
//       invoke("txpool.pending_txn", [transactionHash]);
//    }
//
//
//    func getTransactionInfoByHash(transactionHash: String) -> Promise<Any> {
//       invoke("chain.get_transaction_info", [transactionHash]);
//    }
//
//    func getTransactionEventByHash(transactionHash: String) -> Promise<Any> {
//       invoke("chain.get_events_by_txn_hash", [transactionHash]);
//
//    }
//
//    func getBlockByHash(blockHash: String) -> Promise<Any> {
//       invoke("chain.get_block_by_hash", [blockHash]);
//    }
//
//
    func getBlockByNumber(number: Int) -> Promise<Block> {
        invoke("chain.get_block_by_number", params: [number]);
    }

//
//
//    func getBlockInfoByNumber(number: Int) -> Promise<Any> {
//       invoke("chain.get_block_info_by_number", [number]);
//
//    }
//
//    func getBlockHeaderAndBlockInfoByNumber(number: Int) -> Promise<Any> {
//        // TODO
//       invoke("chain.get_block_info_by_number", [number]);
//    }
//
//    func headerWithDifficultyInfoByNumber(number: Int) -> Any {
//
//    }
//
//    func headerByNumber(number: Int) -> Promise<Any> {
//       invoke("chain.get_block_by_number", [number])['header'];
//    }
//
//    func getBlocksFromNumber(number: Int, int count = 10) -> Promise<Any> {
//       invoke("chain.get_blocks_by_number", [number, count]);
//    }
//
//    func getBalanceOfStc(address: String) -> Promise<Any> {
//        res = this -> listResource(address);
//
//        stcRaw = res['resources']["0x00000000000000000000000000000001::Account::Balance<0x00000000000000000000000000000001::STC::STC>"];
//
//
//    }
//
//
//    func listResource(address: String) -> Promise<Any> {
//       invoke("state.list_resource", [address]);
//    }
//
//    func getEpochResourceByHeight(height: Int) -> Promise<Any> {
//        h = this -> headerByNumber(height);
//       this -> getEpochResource(h['state_root']);
//    }
//
//    func getEpochResource(stateroot: String) -> Promise<Any> {
//        addr = "0x00000000000000000000000000000001";
//        restype = "0x1::Epoch::Epoch";
//        opt = [
//            "decode" => true,
//            "state_root" => stateroot
//        ];
//
//       this -> getResource(addr, restype, opt);
//
//    }
//
//    func getResource(address: String, string resType, opt) -> Promise<Any> {
//       invoke("state.get_resource", [address, resType, opt]);
//    }


//    func getAccountSequenceNumber(address: String) -> Promise<Any> {
//
//
//    }
//
//    func getState(address: String) -> Promise<Any> {
//
//    }
//
//    func Subscribe() -> Promise<Any> {
//
//    }
//
//    func NewTxnSendRecvEventNotifications() -> Promise<Any> {
//
//    }
//
//    func NewPendingTransactionsNotifications() -> Promise<Any> {
//
//    }
//
//    func SubmitTransaction() -> Promise<Any> {
//
//    }
//
//
//    func SubmitSignedTransaction() -> Promise<Any> {
//
//    }
//
//    func SubmitSignedTransactionBytes() -> Promise<Any> {
//
//    }
//
//    func transferStc() -> Promise<Any> {
//
//    }
//
//
//    func BuildTransferStcTxn() -> Promise<Any> {
//
//    }
//
//    func BuildRawUserTransaction() -> Promise<Any> {
//
//    }
//
////    func getGasUnitPrice() -> Int {
////       invoke("txpool.gas_price");
////    }
////
////    func callContract() -> Promise<Any> {
////       invoke("contract.call_v2");
////    }
//
//    func EstimateGasByDryRunRaw() -> Promise<Any> {
//
//    }
//
//    func DryRunRaw() -> Promise<Any> {
//
//    }
//
//    func EstimateGas() -> Promise<Any> {
//
//    }
//
//    func DryRun() -> Promise<Any> {
//
//    }
//
//    func DeployContract() -> Promise<Any> {
//
//    }


// And other JSON-RPC methods
}
