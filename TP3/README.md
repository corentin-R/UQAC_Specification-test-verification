#TP3

Runtime monitoring

La une classe Bank propose un ensemble de méthodes pour effectuer des transactions financières, selon l'interface suivante:

class Bank {
  public void open(int accountNo);
  public void close(int accountNo);
  public boolean isApproved(int accountNo, int amount);
  public void withdraw(int accountNo, int amount);
}

La classe Teller est un programme simple permettant à l'utilisateur d'invoquer ces différentes opérations par le biais d'un menu à la ligne de commande. On doit cependant respecter les contraintes suivantes en utilisant la banque:

    Les opérations isApproved et withdraw ne peuvent être effectuées que si un compte est ouvert.
    On ne peut ouvrir plus d'un compte simultanément.
    Un retrait de plus de 1 000$ ne peut être effectué que si l'appel à isApproved a retourné true.

On suppose que toutes les opérations sont effectuées avec le même numéro de compte.

Écrivez une spécification JavaMOP permettant de monitorer ces contraintes, en utilisant soit le plugin FLTL ou le plugin FSM. Tissez l'aspect résultant aux classes Bank et Teller et constatez en utilisant le programme que les séquences interdites sont bien interceptées par le moniteur.
