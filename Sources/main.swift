import Foundation

// Dicionário principal: Chave = Nome (String), Valor = Array de Strings [email, telefone, idade]
var pessoas: [String: [String]] = [:]

// 1. Função para Incluir dados de uma pessoa
func incluirPessoa() {
    print("Digite o nome da pessoa:")
    guard let nome = readLine(), !nome.isEmpty else { return }
    
    // Verifica se o nome já existe no dicionário (não permite repetição)
    if pessoas[nome] != nil {
        print("Já existe uma pessoa com esse nome.")
    } else {
        print("Digite o email da pessoa:")
        let email = readLine() ?? ""
        
        print("Digite o telefone da pessoa:")
        let telefone = readLine() ?? ""
        
        print("Digite a idade da pessoa:")
        let idade = readLine() ?? ""
        
        pessoas[nome] = [email, telefone, idade]
        print("Pessoa adicionada com sucesso!")
    }
    print(pessoas)
    print()
}

// 2. Função para Alterar dados de uma pessoa
func alterarPessoa() {
    print("Digite o nome da pessoa que deseja alterar:")
    guard let nome = readLine(), !nome.isEmpty else { return }
    
    if pessoas[nome] != nil {
        print("Digite o novo email da pessoa:")
        let email = readLine() ?? ""
        
        print("Digite o novo telefone da pessoa:")
        let telefone = readLine() ?? ""
        
        print("Digite a nova idade da pessoa:")
        let idade = readLine() ?? ""
        
        pessoas[nome] = [email, telefone, idade]
        print("Dados da pessoa alterados com sucesso!")
    } else {
        print("Pessoa não encontrada.")
    }
    print(pessoas)
    print()
}

// 3. Função para Apagar dados de uma pessoa
func apagarPessoa() {
    print("Digite o nome da pessoa que deseja apagar:")
    guard let nome = readLine(), !nome.isEmpty else { return }
    
    if pessoas.removeValue(forKey: nome) != nil {
        print("Pessoa removida com sucesso!")
    } else {
        print("Pessoa não encontrada.")
    }
    print(pessoas)
    print()
}

// 4. Função para Exibir dados de uma pessoa específica
func exibirPessoa() {
    print("Digite o nome da pessoa que deseja exibir:")
    guard let nome = readLine(), !nome.isEmpty else { return }
    
    if let dados = pessoas[nome], dados.count >= 3 {
        print("\nDados de \(nome):")
        print("Email: \(dados[0])")
        print("Telefone: \(dados[1])")
        print("Idade: \(dados[2])")
    } else {
        print("Pessoa não encontrada.")
    }
    print(pessoas)
    print()
}

// 5. Função para Exibir dados de todas as pessoas
func exibirTodasPessoas() {
    print("\nDados de todas as pessoas cadastradas:")
    for (nome, dados) in pessoas {
        if dados.count >= 3 {
            print("Nome: \(nome)")
            print("Email: \(dados[0])")
            print("Telefone: \(dados[1])")
            print("Idade: \(dados[2])\n")
        }
    }
    print(pessoas)
    print()
}

// Função para exibir o menu principal
func exibirMenu() {
    print("Escolha uma opção:")
    print("1. Incluir dados de uma pessoa")
    print("2. Alterar dados de uma pessoa")
    print("3. Apagar dados de uma pessoa")
    print("4. Exibir dados de uma pessoa")
    print("5. Exibir dados de todas as pessoas")
    print("6. Finalizar o programa")
}

// Loop principal do programa
var executando = true

while executando {
    exibirMenu()
    
    if let opcao = readLine() {
        switch opcao {
        case "1":
            incluirPessoa()
        case "2":
            alterarPessoa()
        case "3":
            apagarPessoa()
        case "4":
            exibirPessoa()
        case "5":
            exibirTodasPessoas()
        case "6":
            print("Programa finalizado.")
            executando = false
        default:
            print("Opção inválida. Tente novamente.\n")
        }
    }
}
