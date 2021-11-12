//
//  Person.swift
//  contactsApp
//
//  Created by Станислав Буйновский on 08.11.2021.
//

struct Person {
    let firstName: String
    let lastName: String
    let phone: String
    let email: String
    
    var fullName: String {
        firstName + " " + lastName
    }
}

extension Person {
    static func getPersons() -> [Person] {
        
        let dataManager = DataManager.shared
        var resultData: [Person] = []
        
        let firstNames = dataManager.firstNames.shuffled()
        let lastNames = dataManager.lastNames.shuffled()
        let phones = dataManager.phones.shuffled()
        let emails = dataManager.emails.shuffled()
        
        for index in 0 ... firstNames.count - 1 {
            let person = Person(firstName: firstNames[index],
                                lastName: lastNames[index],
                                phone: phones[index],
                                email: emails[index])
            resultData.append(person)
        }
        
        return resultData
    }
}
