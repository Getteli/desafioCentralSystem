# desafioCentralSystem
LEIA-ME:
Eu Criei o servidor Laravel (que será o responsavel pelo CRUD das noticias, usuarios)
O appCliente é o aplicativo em React Native
e o ClienteClient é o backend do aplicativo, para gerir.

Algumas observações:
  altere o dominio na pasta services/UrlService.js no appCliente
    altere os hosts para o ip da maquina
  altere o host na pages Home
  
  no teste local:
  O host é o ip da maquina e a porta é:
  8000 - servidorLaravel
  8001 - backend do aplicativo
  
  Tive problemas ao fazer o Oauth2 apenas no react, pois o deep link nao esta indo localmente, entao eu fiz usando um backend para o aplicativo para gerir/receber o e autenticar (e tambem salvar em seu proprio banco).
