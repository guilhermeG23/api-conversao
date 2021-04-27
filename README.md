### Aula 1 - Intro Docker
#### Guia de passos da primeir aula

#### Requisitos 

* Docker
* Criar uma conta no Hub.Docker

#### Criar um Dockerfile

```
#Imagem e versão
FROM node:14.16.1-alpine3.13
#Diretorio onde sera realizado o trabalho
WORKDIR /app
#Copiar arquivos para dentro do diretorio de trabalho
COPY package*.json ./
#Executar um instalador em tempo de montagem da imagem
RUN npm install
#Copiar demais arquivos que podem ser alterados com maior frequencia 
COPY . . 
#Expor a porta
EXPOSE 8080
#Executar somente quando o container é construido
CMD ["node", "index.js"]
```

#### Ignorar

Usar um arquivo chamado de .dockerignore para listar arquivos que não devem ser utilizados durante o tempo de build para a contrução da imagem

#### Como buildar

```
docker image build -t <nome da pessoa no docker hub ou da organizacao>/<nome da imagem>:<seu esquema de versionamento> .
```
* -t -> Nomear a imagem
* . -> Diretorio atual, se for buildar com mais coisas dentro da imagem, tem que colocar tudo dentro do diretorio que está o Dockerfile

#### Executar

```
docker run -d -p 8080:8080 <imagem alvo>
```

* -d -> Executando como deamon -> Executando sem interagir com o container
* -p -> Redirecionamento da porta do container para o externo

#### Fazer push da imagem para o Hub.Docker

Primeiro tem que se logar com o Docker, Ex:

```
docker login
```

Entre com o usuário e senha.

Confira se tem imagem já pronta no ```docker images```, se não de build nela como está acima.

Faça o upload para o Hub, Ex:
```
docker push <imagem>
```