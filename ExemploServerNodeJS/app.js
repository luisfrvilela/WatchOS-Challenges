var express = require('express');
var app = express();

app.listen(8000,function(){
  console.log('Servidor iniciado com sucesso.');
});

app.get('/meusContatos', function(request,response){
  response.json([
    {
      "nome":"Luis Resende", "Idade":"21"
    },
    {
      "nome":"Huallyd", "Idade":"21"
    }

    ]);
});
