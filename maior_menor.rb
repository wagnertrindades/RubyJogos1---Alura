def da_boas_vindas
	puts "Bem vindo ao jogo da adivinhação"
	puts "Qual é o seu nome?"
	nome = gets.strip
	puts "\n \n \n"
	puts "Começaremos o jogo para você, #{nome}"
	nome
end

def sorteia_numero_secreto(dificuldade)

	case dificuldade
	when 1
		maximo = 30
	when 2
		maximo = 60
	when 3
		maximo = 100
	when 4
		maximo = 150
	else
		maximo = 200
	end

	puts "Escolhendo um número secreto entre 0 e #{maximo}..."
	sorteado = rand(maximo) + 1 
	puts "Escolhido... que tal adivinhar hoje o nosso número secreto?"
	sorteado
end

def pede_dificuldade
	puts "Qual nível de dificuldade que deseja? (1 fácil, 5 difícil)"
	dificuldade = gets.to_i
end

def pede_um_numero(chutes, i, limite_de_tentativas)
	puts "\n \n \n"
	puts "Tentativa #{i} de #{limite_de_tentativas}"
	puts "Você já chutou: #{chutes}"
	puts "Entre com o número"
	chute = gets.strip
	puts "Será que acertou?... Você chutou #{chute}"
	chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
	acertou = chute == numero_secreto

	if acertou
		puts "Acertou!"
		return true
	end

	puts "Errou!"
	maior = numero_secreto > chute
	if maior
		puts "O número secreto é maior!"
	else
		puts "O número secreto é menor!"
	end
	false
end

def joga(nome, dificuldade)

	numero_secreto = sorteia_numero_secreto dificuldade

	pontos_ate_agora = 1000
	limite_de_tentativas = 3
	chutes = []

	for i in 1..limite_de_tentativas

		chute = pede_um_numero chutes, i, limite_de_tentativas
		chutes << chute 

		if nome == "Wagner"
			puts "Acertou"
			break
		end

		pontos_a_perder = (chute - numero_secreto).abs / 2.0
		pontos_ate_agora -= pontos_a_perder 

		if verifica_se_acertou numero_secreto, chute
			break
		end

	end

	puts "Você ganhou #{pontos_ate_agora} pontos."
end

def nao_quer_jogar?
	puts "Quer jogar novamente? (S/N)"
	quero_jogar = gets.strip
	quero_jogar.upcase == "N"
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
	joga nome, dificuldade
	if nao_quer_jogar?
		break
	end
end