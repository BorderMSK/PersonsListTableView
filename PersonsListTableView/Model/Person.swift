//
//  Person.swift
//  PersonsListTableView
//
//  Created by Igor Makeev on 09.06.2021.
//

struct Person {
    let name: String
    let surname: String
    let phoneNumber: String
    let email: String
    
    static func getPerson() -> [Person]{
        let data = DataManager()
        var personsArray: [Person] = []
        
        let names = data.name.shuffled()
        let surnames = data.surname.shuffled()
        let phoneNumbers = data.phoneNumber.shuffled()
        let emails = data.email.shuffled()
        
        for index in 0..<names.count{
            let person = Person(name: names[index], surname: surnames[index], phoneNumber: phoneNumbers[index], email: emails[index])
            
            personsArray.append(person)
        }
        return personsArray
    }
}
