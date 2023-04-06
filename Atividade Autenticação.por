programa
{
	inclua biblioteca Arquivos --> a
	
	//Função para imprimir linhas na tela
	funcao imp_Tela(cadeia separa, inteiro qtd) {
    		inteiro contador
    		para(contador=0;contador<qtd;contador++) {
      		escreva(separa)
    		}
  	}

	//Funçãp para verificação de usuário e senha
	funcao logico autenticacao_senha(cadeia usuario_digitado, cadeia usuario_correto, cadeia senha_digitada, cadeia senha_correta) {
		se (usuario_digitado == usuario_correto e senha_digitada == senha_correta) {
			retorne verdadeiro
		} senao {
			retorne falso
		}
	}

	//Função para verificação do token de acesso
	funcao logico autenticacao_token(cadeia token_digitado, cadeia token_correto) {
		se (token_digitado == token_correto) {
			retorne verdadeiro
		} senao {
			retorne falso
		}
	}

	funcao log_login(cadeia nome_arquivo, cadeia texto_log, cadeia status) {
		inteiro arquivo = a.abrir_arquivo(nome_arquivo, a.MODO_ACRESCENTAR)
    		a.escrever_linha(texto_log + status, arquivo)
    		a.fechar_arquivo(arquivo)
	}
	
	funcao menu_principal() {
    		cadeia usuario, senha, usuario_correto = "adm", senha_correta = "BAF", token, token_auth = "164"
    		//usuario: admbanco!mVfdIr09AlssSF*2@s!As%
    		//senha: BAFYTfsdfEAS23#!%%G7Jase%??@#asehkjX
    		//token: 16439272412442760
    		
    		
    		limpa()
    		imp_Tela("#",50)
    		escreva("\n Login Gerente do Banco Inter\n")
    		imp_Tela("-",50)
    		escreva("\nDigite o nome de usuário: ")
    		leia(usuario)
    		escreva("\nDigite a senha: ")
    		leia(senha)
    		imp_Tela("#",50)

		se (autenticacao_senha(usuario, usuario_correto, senha, senha_correta)) {
			escreva("\n\nDigite o token de autenticação: ")
    			leia(token)
    			imp_Tela("#",50)
    			se (autenticacao_token(token, token_auth)) {
    				escreva("Acesso permitido!")

    				log_login("log_login.txt", "Nome de usuário digitado: " + usuario + " | " + "Senha Digitada: " + senha + " | " + "Token digitado: " + token, " - Login Permitido")
    			} senao {
    				escreva("Acesso negado!")

				log_login("log_login.txt", "Nome de usuário digitado: " + usuario + " | " + "Senha Digitada: " + senha + " | " + "Token digitado: " + token, " - Token Negado")
    				
    				menu_principal()
    			}
		} senao {
			escreva("Acesso negado!")

			log_login("log_login.txt", "Nome de usuário digitado: " + usuario + " | " + "Senha Digitada: " + senha, " - Usuário e Senha negados")
			
			menu_principal()
		}
}
		
	funcao inicio()
	{
		menu_principal()
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1406; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */