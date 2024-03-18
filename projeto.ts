class Funcionario {
    constructor(
        public nome: string,
        protected email: string,
        protected telefone: string,
        private cargo: string,
        protected data_nascimento: Date,
        protected matricula: string,
        private cpf: string,
        private rg: string,
        private endereco: string[]) {
    }
    mostrarDados() {
        console.log('Dados do funcionário:')
        console.log(`Nome: ${this.nome}`)
        console.log(`Cargo: ${this.cargo}`)
        console.log(`Matrícula: ${this.matricula}`)
        console.log(`Endereço: ${this.endereco}`)
        console.log(`CPF: ${this.cpf}`)
        console.log(`RG: ${this.rg}`)
        console.log(`Data de nascimento: ${this.data_nascimento.toLocaleDateString('pt-BR')}`)
        console.log(`E-mail: ${this.email}`)
        console.log(`Telefone: ${this.telefone}`)
    }
}
const funcionario1 = new Funcionario('Pedro Arthur',
    'pedro_nogueira@gmail.com',
    '84888514566',
    'Gerente da equipe de dev',
    new Date('1995-1-22'),
    '7854162',
    '506.831.284-34',
    '5062628',
    ['rua Enfereira Carmelita', ' Lagoa Azul'])
const funcionario2 = new Funcionario('Cauã Fábio',
    'cauFab@gmail.com',
    '84985632144',
    'desenvolvedor frontend',
    new Date('1987-7-25'),
    '1234162',
    '693.314.184-50',
    '2515788',
    ['rua Cosme Damião', ' bairro Lagoa Seca'])
const funcionario3 = new Funcionario('Gael Sérgio',
    'DaPazG43l@gmail.com',
    '84984851446',
    'desenvolvedor backend',
    new Date('1986-3-7'),
    '8564162',
    '715.108.644-07',
    '3515789',
    ['Vila Familiar', ' bairro Igapó'])
const funcionario4 = new Funcionario('Manoel Gomes',
'canetazul@gmail.com',
'84998877665',
'Gerente dos Testadores',
new Date('1967-3-18'),
'5478526',
'640.816.274-60',
'4624565',
['Rua Joaquin Lourival', 'Bairro Quintas'])
const funcionario5 = new Funcionario('Benedito Luiz',
'benEsantoos@gmail.com',
'84975485261',
'Testador',
new Date ('1992-5-31'),
'1874653',
'176.074.794-73',
'1172384',
['Travessa Gameleira', 'Bairro Redinha'])
const funcionario6 = new Funcionario('Fábio Paulo',
'FBcavalcantii@gmail.com',
'84975485321',
'Testador',
new Date ('1989-7-14'),
'4566211',
'765.730..194-58',
'7300014',
['Rua José Seabra', 'Bairro Capim Macio'])

funcionario1.mostrarDados()
console.log('===================================================================')
funcionario2.mostrarDados()
console.log('===================================================================')
funcionario3.mostrarDados()
console.log('===================================================================')
funcionario4.mostrarDados()
console.log('===================================================================')
funcionario5.mostrarDados()
console.log('===================================================================')
funcionario6.mostrarDados()
console.log('===================================================================')


class Equipe {
    constructor(
        protected nome: string,
        protected funcao: string,
        protected lider: Funcionario,
        protected membros: Funcionario[]) {
    }
    mostrarDados() {
        console.log('Dados da equipe:')
        console.log(`Nome da equipe: ${this.nome}`)
        console.log(`Função: ${this.funcao}`)
        console.log(`Líder: ${funcionario1.nome}`)
        console.log(`Membros: ${funcionario2.nome}, ${funcionario3.nome}`)
    }
}
const equipe1 = new Equipe('Desenvolvedores',
    'Desenvolver e corrigir o app',
    funcionario1,
    [funcionario2, funcionario3])
equipe1.mostrarDados()
console.log('===================================================================')
const equipe2 = new Equipe('Testadores',
'Testar o projeto para identificar erros',
funcionario4,
[funcionario5, funcionario6])
equipe2.mostrarDados()
class Projeto {
    constructor(
        protected nome: string,
        protected descricao: string,
        protected tecnologias: string,
        protected data_inicio: Date,
        protected data_fim: Date,
        protected status: string) {
    }
    mostrarDados() {
        console.log('Dados do projeto:')
        console.log(`Nome: ${this.nome}`)
        console.log(`Descrição: ${this.descricao}`)
        console.log(`Tecnologias utilizadas: ${this.tecnologias}`)
        console.log(`Data de início: ${this.data_inicio.toLocaleDateString('pt-BR')}`)
        console.log(`Data de término: ${this.data_fim.toLocaleDateString('pt-BR')}`)
        console.log(`Status: ${this.status}`)
    }
}

const projeto1 = new Projeto(
    'Ultra Spam Blocker',
    'Bloqueia todas as chamadas indesejadas pelo usuário.',
    'qTest e TestLink',
    new Date('2024-3-18'),
    new Date('2025-5-20'),
    'Em andamento')
projeto1.mostrarDados()

console.log('===================================================================')

class Tarefa {
    constructor(
        protected nome: string,
        protected descricao: string,
        protected responsavel: Funcionario,
        protected status: string) {
    }
    mostrarDados() {
        console.log("Dados das tarefas:")
        console.log(`Nome da tarefa: ${this.nome}`)
        console.log(`Descrição: ${this.descricao}`)
        console.log(`Dev responsável: ${funcionario1.nome}`)
        console.log(`Status da tarefa: ${this.status}`)
    }
}
const tarefa1 = new Tarefa(
    'DEV',
    'irá permitir a capacidade do usuário interagir',
    funcionario1,
    'pendente')
const tarefa2 = new Tarefa(
    'Teste',
    'irão testar o projeto',
    funcionario4,
    'em andamento'
)
tarefa1.mostrarDados()
console.log('===================================================================')
tarefa2.mostrarDados()

