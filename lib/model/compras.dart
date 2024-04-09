class Compras {
  //atributos
  final String nome;
  final String quantidade;

  //construtor
  Compras(this.nome, this.quantidade);

  //geração de dados
  static List<Compras> preencher() {
    List<Compras> lista = [];

    lista.add(Compras('Oleo', '3'));
    lista.add(Compras('Feijao', '1'));
    lista.add(Compras('Leite', '5'));
    lista.add(Compras('Arroz', '2'));

    return lista;
  }
}
