import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String _escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var _escolhaApp = opcoes[numero];

    switch (_escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("imagens/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("imagens/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("imagens/tesoura.png");
        });
        break;
    }

    //Ver quem ganhou
    //Usuario Ganhador
    if ((_escolhaUsuario == "pedra" && _escolhaApp == "tesoura") ||
        (_escolhaUsuario == "tesoura" && _escolhaApp == "papel") ||
        (_escolhaUsuario == "papel" && _escolhaApp == "pedra")) {
      setState(() {
        _mensagem = "Você ganhou :)";
      });
    }
    //App Ganhador
    else if ((_escolhaApp == "pedra" && _escolhaUsuario == "tesoura") ||
        (_escolhaApp == "tesoura" && _escolhaUsuario == "papel") ||
        (_escolhaApp == "papel" && _escolhaUsuario == "pedra")) {
      setState(() {
        _mensagem = "Você Perdeu :< ";
      });
    }
    //Empate
    else {
      setState(() {
        _mensagem = "Empatamos :|";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 32,
              bottom: 16,
            ),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(
            image: this._imagemApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                  "imagens/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                  "imagens/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "imagens/tesoura.png",
                  height: 100,
                ),
              ),

              /* Image.asset(
                "imagens/pedra.png",
                height: 100,
              ),
              Image.asset(
                "imagens/papel.png",
                height: 100,
              ),
              Image.asset(
                "imagens/tesoura.png",
                height: 100,
              ), */
            ],
          )
        ],
      ),
    );
  }
}
