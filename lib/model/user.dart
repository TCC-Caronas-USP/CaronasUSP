class User {
  final String imagePath;
  final String name;
  final String email;
  final String cpf;
  final String telefone;
  final String instituto;
  final String veiculo;
  final int caronasUtilizadas;
  final int caronasRealizadas;
  final double ranking;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.cpf,
    required this.telefone,
    required this.instituto,
    required this.veiculo,
    required this.caronasUtilizadas,
    required this.caronasRealizadas,
    required this.ranking,
  });
}