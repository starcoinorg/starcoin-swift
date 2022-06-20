

import Foundation


protocol TransactionAuthenticator {
    func isTransactionAuthenticator()
    func Serialize()
    func BcsSerialize()
}

struct SignedUserTransaction {
    var rawTxn: RawUserTransaction
    var authenticator: TransactionAuthenticator

    func serialize() {

    }

    func bcsSerialize() {

    }
}
