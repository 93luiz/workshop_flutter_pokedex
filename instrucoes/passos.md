
### Instalação de Software

- Instalar e configurar Android Studio
	- [Site Oficial](https://developer.android.com/studio) para download do instalador
		- Para windows e Mac, o instalador é uma boa opção
		- Em sistemas baseados no GNU/Linux que usem o snap, recomenda-se a instalação usando o mesmo
			- Exemplo usando ubuntu: `snap install android-studio --classic`
		- No MacOS, se você usa o gerenciador de pacotes [Homebrew](https://brew.sh), você pode obter o android studio usando o mesmo (`brew install --cask android-studio`)
	- Abrir o Android Studio e seguir os passos de configuração dele. Você passará por licenças de  software e downloads adicionais
	- Na tela principal do Android Studio, selecionar "more actions" e abrir o "SDK manager"
		- Caso você já tenha projetos recentes, essa opção estará disponível no menu "..." no canto superior direito
		- Se estiver com algum projeto aberto, essa tela pode ser aberta pela tela de configurações do Android Studio
	- Dentro de "Android SDK", selecionar "SDK Tools"
	- Das opções disponíveis, selecionar a "Android SKD Command-line Tools (latest)" e clicar em "OK". A ferramenta será baixada.
- Instalar o Flutter
	- [Instruções oficiais](https://docs.flutter.dev/get-started/install)
	- Em sistemas GNU/Linux que usem o snap, você pode instalar o comando `sudo snap install flutter --classic`
	- No MacOS, se vc utilizar o homebrew, é possível instalar com o comando `brew install --cask flutter`
	- Colocar o comando do Flutter na variável path
		- Nas instruções oficiais do flutter existe um passo explicando como realizar essa alteração no sistema
		- Se você instalar usando snap ou brew nos sistemas compatíveis, o path já será atualizado automaticamente, ou então será exibido um comando para vc rodar que irá atualizar o path
	- Testar o comando `flutter doctor`
	- Caso algum problema aconteça em alguma plataforma que você não pretende atingir usando Flutter, pode ignorar os alertas
	- Provavelmente o flutter doctor irá acusar problemas com o sdkmanager do android
		- Para este problema, você deve primeiramente encontrar onde o Android Studio instalou o sdkmanager
			- Abra a tela "SDK Manager" do Android Studio novamente
			- No topo terá um campo de texto com tal caminho preenchido. Anote-o
				- (Usarei como exemplo o caminho `/home/gustavoluiz/Library/Android/sdk` do sistema Ubuntu que estou usando para testar)
			- Complete o caminho para o instalador do sdkmanager abaixo da seguinte forma:
				- `<caminho>/cmdline-tools/latest/bin/sdkmanager`
				- No caso do meu exemplo acima seria `/Users/gustavoluiz/Library/Android/sdk/cmdline-tools/latest/bin/sdkmanager`
			- Rode a instalação com o comando
				- `<instalador sdkmanager> --install "cmdline-tools;latest"`
				- No caso do meu exemplo ficaria: `/Users/gustavoluiz/Library/Android/sdk/cmdline-tools/latest/bin/sdkmanager --install "cmdline-tools;latest"`
		- Depois de instalado o cmdline-tools, rode o `flutter doctor` novamente para ver se este alerta foi resolvido
		- Ao observar os exemplos acima, lembre-se de que no Windows, as barras que separam as pastas devem ser invertidas
	- Outro caso comum, principalmente se o alerta anterior apareceu pra você é o flutter doctor pedir para você aceitar as licenças de software do Android
		- Ele irá te mostrar o comando que você deve rodar para fazer essa ação
	- Caso o flutter doctor aponte que não tem nenhum dispositivo android conectado, tente abrir um simulador android e rodar o flutter doctor novamente
- Criar um app para se assegurar de que está tudo funcionando
	- `flutter create teste`
	- `cd teste`
	- `flutter run`

### Criar o app e adaptar para uso

- `flutter create -e pokedex`
	- Será criada uma pasta com o nome pokedex para abrigar o seu projeto
	- O parâmetro -e serve para criar um app limpo, ajudando assim na hora de substiruir o código gerado pelo nosso código
	- Caso você esteja estudando flutter, o app gerado por padrão pode ser uma boa opção se vc tiver intenção de ler os comentários e entender o funcionamento do app gerado
- Rodar o app
- Criar um widget chamado `AppPage`
- Mover o conteúdo do método `build()` da main para dentro do build do `AppPage`
- No lugar do conteúdo que antes era retornado direto dentro do build do arquivo main.dart, retornar apenas o AppPage. Ex.: `return AppPage();`

### Criar primeira tela

- Criar um novo widget statefull, colocar um Scaffold e adicionar seu conteúdo inicial para essa tela
- Substituir o parâmetro `home` do widget `MaterialApp` dentro da `AppPage` por uma chamada à sua primeira tela.
	- Ex.: `home: const PokedexPage(),`
- Colocar Scaffold, AppBar e body com um ListView dentro
- Criar um model de pokemon
- Usar ListView.builder para exibir uma lista de pokemon usando o model criado
- Adicionar o Dio no projeto e criar um método para buscar uma lista de pokémon da API
- Colocar a ListView dentro de um FutureBuilder para atualizar a tela de acordo com o retorno da API
- Adicionar a URL do poekémon no model e receber o valor da API

### Criar a tela de detalhes de um Pokémon

- Criar a page com o widget statefull num arquivo separado
- Colocar uma estrutura básica
- Receber como parâmetro a URL do pokémon
- Na tela anterior, adicionar o método onTap e fazer a navegação chamando a tela de detalhar
- Adicionar na tela de detalhes um método de busca pelo pokémon usando a url recebida
- Criar um model para guardar os detalhes do pokémon
- Retornar o model instanciado ao buscar os dados da API
- Adicionar na tela o FutureBuilder e os elementos que irão mostrar os dados do pokémon