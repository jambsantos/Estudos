##### ESCREVER A FUNÇAO ABAIXO
def operations(a,b):
  #### Escrever abaixo
  def operations(a, b):
    # Adição
    addition = a + b
    print("Adição:", addition)

    # Subtração
    subtraction = a - b
    print("Subtração:", subtraction)

    # Multiplicação
    multiplication = a * b
    print("Multiplicação:", multiplication)

    # Divisão
    division = a / b
    print("Divisão:", division)

# Exemplo de uso:
a = int(input("Digite o primeiro número: "))
b = int(input("Digite o segundo número: "))

operations(a, b)

#### RODAR A FUNÇAO
def operations(a, b):
    # Adição
    addition = a + b
    print("Adição:", addition)

    # Subtração
    subtraction = a - b
    print("Subtração:", subtraction)

    # Multiplicação
    multiplication = a * b
    print("Multiplicação:", multiplication)

    # Divisão
    division = a / b
    print("Divisão:", division)

# Exemplo de uso:
a = int(input("Digite o primeiro número: "))
b = int(input("Digite o segundo número: "))

operations(a, b)
4
4

a = 1+ 2

"""### Desafio 2
Escreva uma função em python que leia como input uma idade e retorne a classificaçao da ideade do individuo da seguinte forma em:

*  Criança – 0 a 12 anos
*  Adolescente – 13 a 17 anos
*  Adulto – acima de 18 anos


Se a idade for um número negativo, mostrar a mensagem que a "idade inválida"


"""

##### ESCREVER A FUNCAO ABAIXO
def classifica_idade(idade):
  #### escrever abaixo
  def classifica_idade(idade):
    if idade < 0:
        return "Idade inválida"
    elif idade <= 12:
        return "Criança"
    elif idade <= 17:
        return "Adolescente"
    else:
        return "Adulto"

# Exemplo de uso:
idade = int(input("Digite a idade: "))
classificacao = classifica_idade(idade)
print("Classificação:", classificacao)

#### RODAR A FUNCAO
def classifica_idade(idade):
    if idade < 0:
        return "Idade inválida"
    elif idade <= 12:
        return "Criança"
    elif idade <= 17:
        return "Adolescente"
    else:
        return "Adulto"

# Exemplo de uso:
idade = int(input("Digite a idade: "))
classificacao = classifica_idade(idade)
print("Classificação:", classificacao)

"""### Desafio 3
Crie uma função em python que receba como input um determinado horário em horas e retorne a conversao deste horário para segundos

"""

##### ESCREVER A FUNCAO ABAIXO

def time_converter(t):
    segundos = t * 3600  # 1 hora possui 3600 segundos
    return segundos

##### RODAR A FUNCAO

horario = 4.9 # Horário de 3 horas e 30 minutos
segundos_convertidos = time_converter(horario)
print(f"{horario} horas é igual a {segundos_convertidos} segundos.")

"""### Desafio 4
Crie uma função em python que calcule a média artimética de uma aluna que cursou a disciplina de Programação I. A funcao deve receber como input as notas M1, M2 e M3 e calcular a média. Após a média calculada, a funcao deve anunciar se a aluna foi aprovado, reprovado ou pegou exame de acordo conm a seguinte classificacao:

* Se a média estiver entre 0.0 e 4.0, o aluno está reprovado
* Se a média estiver entre 4.1 e 6.0, o aluno pegou exame
* Se a média for maior do que 6.0, o aluno está aprovado
* Se o aluno pegou exame, deve ser lida a nota do exame. Se a nota do exame for maior do que 6.0, está aprovado, senão; está reprovado

"""

##### ESCREVER A FUNCAO ABAIXO
def calcula_media(M1,M2,M3):
    media = (M1 + M2 + M3) / 3

    if media >= 0.0 and media <= 4.0:
        resultado = "Reprovado"
    elif media > 4.0 and media <= 6.0:
        resultado = "Exame"
        nota_exame = float(input("Digite a nota do exame: "))
        if nota_exame > 6.0:
            resultado = "Aprovado"
        else:
            resultado = "Reprovado"
    elif media > 6.0:
        resultado = "Aprovado"

    return resultado

##### RODAR A FUNCAO

nota1 = 7.5
nota2 = 6.8
nota3 = 5.2

resultado_aluna = calcula_media(nota1, nota2, nota3)
print(f"A aluna está {resultado_aluna}.")

"""### Desafio 5
Dado a seguinte lista:
* equipes_bootcamp_dados = [BerthaLutz, GraceHopper, JaquelineGoes, SarahGilbert]

1. Crie uma função em python que conte quantas vezes aparece a letra a em cada elemento da lista. Seu resultado deve ser uma lista . exemplo: [4,0,1,2]

2. Leia a lista de alunas: ['Maria', 'Ana','Camila','Mariana','Elaine','Patricia','Marina','Erica','Larissa','Luiza', 'Nicole','Bruna']

3. Crie uma função que atribua cada uma das alunas em uma das equipes da lista equipes_bootcamp_dados, de modo que cada equipe pode ter 3 alunas no máximo.

 Para isso ordene em alfabética. O seu resultado deve ser um dicionário python. exemplo {'BerthaLutz': ['Ana', 'Bruna', 'Camila'], 'GraceHopper': ['Elaine','Erika','Luiza'],... }

"""

##### ESCREVER A FUNCAO DA ETAPA 1
def contar_a(lista):
    resultados = []
    for elemento in lista:
        count = elemento.lower().count('a')
        resultados.append(count)
    return resultados

###### RODAR A ETAPA 1
equipes_bootcamp_dados = ['BerthaLutz', 'GraceHopper', 'JaquelineGoes', 'SarahGilbert']
resultado_contagem = contar_a(equipes_bootcamp_dados)
print(resultado_contagem)

##### LER A ETAPA 2
alunas = ['Maria', 'Ana', 'Camila', 'Mariana', 'Elaine', 'Patricia', 'Marina', 'Erica', 'Larissa', 'Luiza', 'Nicole', 'Bruna']

##### ESCREVER A FUNCAO DA ETAPA 3
def ordenacao(lista_alunas, equipes_bootcamp_dados):
    alunas_ordenadas = sorted(lista_alunas)
    equipes_alunas = {}

    for equipe in equipes_bootcamp_dados:
        equipes_alunas[equipe] = []

    equipe_atual = 0
    for aluna in alunas_ordenadas:
        if len(equipes_alunas[equipes_bootcamp_dados[equipe_atual]]) < 3:
            equipes_alunas[equipes_bootcamp_dados[equipe_atual]].append(aluna)
        else:
            equipe_atual += 1
            if equipe_atual >= len(equipes_bootcamp_dados):
                equipe_atual = 0

    return equipes_alunas

##### RODAR A FUNCAO DA ETAPA 3
lista_alunas = ["Ana", "Bruna", "Camila", "Elaine", "Erika", "Luiza"]
equipes_bootcamp_dados = ["BerthaLutz", "GraceHopper"]

equipes_alunas = ordenacao(lista_alunas, equipes_bootcamp_dados)

# Exibir as equipes e suas respectivas alunas
for equipe, alunas in equipes_alunas.items():
    print(f"{equipe}: {alunas}")

"""### Desafio 6
Escreva uma função em python que leia uma temperatura em graus Celsius e retorne a conversao dela em graus Fahrenheit.

A fórmula de conversão é F = (9 * C + 160) / 5, na qual F é a temperatura em Fahrenheit e C é a temperatura em graus Celsius



"""

##### ESCREVER A FUNCAO
def conversor_temperatura(temperatura):
    temp_fahrenheit = (9 * temperatura + 160) / 5
    return temp_fahrenheit

##### RODAR A FUNCAO
temperatura_celsius = 20
temperatura_fahrenheit = conversor_temperatura(temperatura_celsius)
print(f"{temperatura_celsius} graus Celsius é igual a {temperatura_fahrenheit} graus Fahrenheit.")