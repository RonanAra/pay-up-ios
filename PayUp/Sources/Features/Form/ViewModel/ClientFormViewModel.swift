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
        if let savedClientId = databaseManager.saveClientAndReturnId(client) {
            
            if client.isRecurring {
                let clientWithId = Client(
                    id: savedClientId,
                    name: client.name,
                    contact: client.contact,
                    phone: client.phone,
                    cnpj: client.cnpj,
                    address: client.address,
                    value: client.value,
                    dueDate: client.dueDate,
                    isRecurring: client.isRecurring,
                    frequency: client.frequency
                )
                notificationManager.scheduleClientReminders(for: clientWithId)
            } else {
                print("Cliente não colocou um lembrete")
            }
            return true
        }
        return false
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
