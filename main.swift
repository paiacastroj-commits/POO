import Foundation

let planoMensal = Plano(
    nome: "Mensal",
    valorMensalidade: 99.90,
    incluiPersonal: false,
    limiteAulasColetivas: 5,
    duracaoMeses: 1
)

let planoTrimestral = Plano(
    nome: "Trimestral",
    valorMensalidade: 89.90,
    incluiPersonal: false,
    limiteAulasColetivas: 15,
    duracaoMeses: 3
)

let planoAnual = Plano(
    nome: "Anual",
    valorMensalidade: 69.90,
    incluiPersonal: true,
    limiteAulasColetivas: 999,
    duracaoMeses: 12
)

let academia = Academia()

let instrutor1 = Instrutor(
    nome: "Miguel",
    telefone: "000000000000",
    cpf: "00000000000",
    endereco: "Rua X"
    especialidade: .musculacao
)

let instrutor2 = Instrutor(
    nome: "Pedro",
    telefone: "000000000000",
    cpf: "00000000000",
    endereco: "Rua X"
    especialidade: .yoga
)

academia.cadastrarInstrutor(instrutor1)
academia.cadastrarInstrutor(instrutor2)

let aluno1 = Aluno(
    matricula: "001",
    plano: planoMensal,
    nivel: .iniciante,
    objetivo: .ganharMassa,
    peso: 86,
    altura: 1.88,
    nome: "Lucas",
    telefone: "000000000000",
    cpf: "00000000000",
    endereco: "Rua X"
)

let aluno2 = Aluno(
    matricula: "002",
    plano: planoAnual,
    nivel: .avancado,
    objetivo: .altaPerformance,
    peso: 82,
    altura: 1.80,
    nome: "Jorge",
    telefone: "000000000000",
    cpf: "00000000000",
    endereco: "Rua X"
)

print(academia.cadastrarAluno(aluno1))
print(academia.cadastrarAluno(aluno2))

let alunoDuplicado = Aluno(
    matricula: "001",
    plano: planoMensal,
    nivel: .iniciante,
    objetivo: .perderPeso,
    peso: 90,
    altura: 1.70,
    nome: "Castro",
    telefone: "000000000000",
    cpf: "00000000000",
    endereco: "Rua X"
)

print(academia.cadastrarAluno(alunoDuplicado))

let esteira = Equipamento(
    nomeItem: "Esteira"
)

let bicicleta = Equipamento(
    nomeItem: "Bike",
    funcionando: false
)

academia.adicionarEquipamento(esteira)
academia.adicionarEquipamento(bicicleta)

let turmaYoga = TurmaColetiva(
    nome: "Yoga da Manhã",
    instrutor: instrutor2,
    categoria: .yoga,
    descricao: "Alongamento e respiração",
    capacidadeMinima: 2,
    capacidadeMaxima: 1
)

print(turmaYoga.inscrever(aluno: aluno1))
print(turmaYoga.inscrever(aluno: aluno2))

let treino1 = academia.agendarPersonal(
    nome: "Treino Premium",
    instrutor: instrutor1,
    aluno: aluno1,
    descricao: "Hipertrofia"
)

print(treino1 == nil)

let treino2 = academia.agendarPersonal(
    nome: "Treino Elite",
    instrutor: instrutor1,
    aluno: aluno2,
    descricao: "Força"
)

print(treino2 != nil)

let falhas = academia.manutencaoGlobal()

for equipamento in falhas {
    print("Falha na manutenção: \(equipamento.nomeItem)")
}

var pessoas: [Pessoa] = []

pessoas.append(aluno1)
pessoas.append(aluno2)
pessoas.append(instrutor1)
pessoas.append(instrutor2)

for pessoa in pessoas {
    print(pessoa.getDescricao())
}

var aulas: [Aula] = []

if let personal = academia.agendarPersonal(
    nome: "Treino VIP",
    instrutor: instrutor1,
    aluno: aluno2,
    descricao: "Treino avançado"
) {
    aulas.append(personal)
}

aulas.append(turmaYoga)

for aula in aulas {
    print(aula.nome)
}

let metricas = academia.gerarMetricas()

for (chave, valor) in metricas {
    print("\(chave): \(valor)")
}