//
//  ClientFormViewModel.swift
//  PayUp
//
//  Created by Ronan Fernandes on 14/11/26.
//

final class ClientFormViewModel {
    
    private let databaseManager = DatabaseManager.shared
    
    func saveClient(client: Client) {
        databaseManager.saveClient(client)
    }
    
    func getAllClients() -> [Client] {
        databaseManager.getClients()
    }
    
    func getClientById(id: Int) -> Client? {
        databaseManager.getClient(by: id)
    }
    
    func deleteClient(id: Int) -> Bool {
        databaseManager.deleteClient(by: id)
    }
}
