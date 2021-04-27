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