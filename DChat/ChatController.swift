//
//  ChatController.swift
//  MChat
//
//  Created by Eduardo Tolmasquim on 10/02/2018.
//  Copyright © 2018 Fullab. All rights reserved.
//

import Foundation

class ChatController {
    var threads: [Thread] = [
        Thread(name: "Atendimento", message: "Oi tudo bem com voce? e ai? beleza?", time: Date()),
        Thread(name: "Atendimento", message: "Me diga qual é o seu problema que resolveremos.", time: Date()),
        Thread(name: "Eu", message: "Meu produto chegou atrasado", time: Date()),
        Thread(name: "Eu", message: "Isso é péssimo porque estou precisando dele", time: Date()),
        Thread(name: "Atendimento", message: "Enviaremos amanhã!", time: Date()),
        Thread(name: "Eu", message: "Show!", time: Date()),
        Thread(name: "Atendimento", message: "Houve um problema, então será depois de amanhã.", time: Date()),
        Thread(name: "Eu", message: "Mas que horas?", time: Date()),
        Thread(name: "Atendimento", message: "No horário comercial.", time: Date()),
        Thread(name: "Eu", message: "Ok, quero ver se vai chegar mesmo...", time: Date()),
        Thread(name: "Atendimento", message: "Pode confiar", time: Date()),
        Thread(name: "Eu", message: "Então beleza", time: Date()),
        Thread(name: "Atendimento", message: "O número do protocolo é 12345678", time: Date()),
        Thread(name: "Eu", message: "👍🏽", time: Date()),
        Thread(name: "Eu", message: "Tchau", time: Date())
    ]
    
    func createMessage(text: String) {
        let thread = Thread(name: "Eu", message: text, time: Date())
        self.threads.append(thread)
    }
}

struct Thread {
    var name: String?
    var message: String
    var time: Date?
}
