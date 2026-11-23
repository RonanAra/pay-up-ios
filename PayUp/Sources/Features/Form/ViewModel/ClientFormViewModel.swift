//
//  ClientFormViewModel.swift
//  PayUp
//
//  Created by Ronan Fernandes on 14/11/26.
//

final class ClientFormViewModel {
    
    private let databaseManager = DatabaseManager.shared
    private let notificationManager = NotificationManager.shared
    
    func saveClient(client: Client) -> Bool {
        let success = databaseManager.saveClient(client)
        
        if success {
            if client.isRecurring {
                notificationManager.scheduleClientReminders(for: client)
            } else {
                print("Cliente não colocou um lembrete")
            }
        }
        
        return success
    }
    
    func getAllClients() -> [Client] {
        databaseManager.getClients()
    }
    
    func getClientById(id: Int) -> Client? {
        databaseManager.getClient(by: id)
    }
    
    func deleteClient(id: Int) -> Bool {
        notificationManager.cancelClientReminders(clientId: id)
        return databaseManager.deleteClient(by: id)
    }
}
