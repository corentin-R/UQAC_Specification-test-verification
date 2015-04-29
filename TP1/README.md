#TP1 Ananlyse de logs

Répondez aux questions suivantes, en équipes d'une à trois personnes, et remettez votre travail selon les modalités décrites en fin de document avant le 2 mars 2015.

##Partie 1: analyse de logs

Sur le serveur du cours, dans le dossier /home/stev/TP1, se trouve un fichier log de grande taille appelé Log.xml. Ce log relève les actions effectuées par les utilisateurs (fictifs) d'un système. Consultez les premières lignes de ce fichier pour en comprendre le format assez intuitif.

Dans le langage de votre choix (présent sur le serveur du cours), écrivez un programme qui répond aux questions suivantes:

* 1- Y a-t-il une session qui dure plus d'une heure? (Une session étant ouverte au moyen d'un "login" et fermée au moyen d'un "logout" pour un même utilisateur.)

* 2- Quel est le nom des fichiers dans lesquels on a essayé d'écrire avant de les avoir ouverts (attention: un même fichier peut avoir été ouvert/fermé plusieurs fois, et par plusieurs utilisateurs)?

* 3- Quel est le nom de toutes les applications ayant été utilisées simultanément par au moins deux utilisateurs (i.e. ouvertes par au moins deux utilisateurs dans des sessions parallèles)?

* 4- Quelles sont les extrémités de chaque "ligne"? Une ligne est un patron de trois clics successifs effectués par l'utilisateur dans la même application, et dont les coordonnées x-y se situent sur une même droite.

* 5- Y a-t-il eu des attaques de force brute en ligne contre le système d'authentification? Pour les besoins du travail, une attaque de force brute survient lorsqu'un utilisateur échoue son login plus de trois fois dans la même minute. Pour chaque attaque, on doit retourner le nom de l'utilisateur et l'heure du premier login échoué.

Le programme peut être implémenté de n'importe quelle manière, mais doit chercher à analyser le log le plus rapidement possible.

Peu importe la solution choisie, on doit pouvoir lancer le code répondant à chaque question x par un script Bash appelé question-x.sh.

##Partie 2: duels de code

Le site Pex for Fun propose de résoudre des "duels de code" (coding duels). Un duel est un puzzle interactif où votre tâche consiste à implémenter une méthode (appelée Puzzle) de manière à ce qu'elle se comporte exactement comme une autre méthode qui vous est inconnue. Vous cliquez sur le bouton "Ask Pex!" pour vérifier si la méthode que vous proposez fait la même chose que la méthode secrète; l'outil en ligne Pex vous retourne les différences relevées, le cas échéant. Vous gagnez le duel lorsque Pex ne parvient plus à trouver aucune différence.

Résolvez avec succès les duels suivants:

* [Puzzle 1](http://pexforfun.com/default.aspx?language=CSharp&code=wgGNkM9qwzAMxu9_im_HQcJgaQuDjlJ2KBv0UgJ7As9VGoP%2fBFsmTUfffXHawrbLJl2MJH_ffkpRuwPeh8hkV0J06cNoBWVkjKiDPwRpIT4FxqgqbKTD4BMabQy4JXTpdDIES9z6PdjDSlbt1IqkAjG07QxZcixZe%2fcyKV1dYq4paMeoJ50iP3U5zVw8c3AbfA9HPXaetzc52r8eFXVZtChX0%2fBZnEVV3W0uKdI%2f0LLLyFXTEY0PaJKDNL0c4ri_IcVxQml0iAzlbTaG0Y4exZ8UVwLdoNC4xwLrNWY%2f2cb7pOCgb_t%2fq41%2fHjAvUWGRu7%2fQltvd2%2fPTcvSbzb8A)
* [Puzzle 2](http://pexforfun.com/default.aspx?language=CSharp&code=xwKNkd1qwyAAhe99irO7hGxNWhh0dGEXZYPCKIU_QWpNIxgNUenP6LsvmtqsHYwZiERPzjmfWs3lDuujNqyeEdLYjeAUVBRaY9WqXVvUIF8E3UhTzAuJo7IouRAwFUNjTyfBUDNTqS2MQl0YWvktzWjLDHjdCFYzaQrDlXzzTpcU7dYouDRYeZ9Im9bV0bGX9bFumKpVe0i2x1KZRXBk2%2fcDZY3zjeKZF5%2fJmaTpw7x%2fiP0HnUvp0FbsgFK1KK1EIfbFUXcEglGjPU3JW21AVe2CIbhkI%2fIHyDqAXCHcJlW2e_fIZmGxRKSR55BWiPiK252bbSWeJje60SeTO1M5efZbOw7aS3RfOIcere2mP9coe8Q4DjoHG7lW3DfqpleEjO4rSULGcA2Bym7ujPlP40tdJ8r7GkPbwQv9aSTJ8NuZ3M4XNK9zqrvLnS6WHy%2fP0_7Es8k3)
* [Puzzle 3](http://pexforfun.com/default.aspx?language=CSharp&code=NgOVkdtKw0AQhu%2fzFKOg3RBM1AsRahEpCIKWQntXisR1bLemGdmDtZW_u7O7sQdBQQLZndl%2fjp8zqp7AYGkszttJ8uaeKiVBVqUx0Nc00eUcPhOA5sHY0oZD_7C_W60qFI1l0qAEKAroljUsycFCK4sg6RnBEhiq3vkyRU7nI6%2fhxrxCHz%2fCIyJMacG1yWAILjXmIeGgKUDOQgcOD9vBq2oLxs3ZcxYdL6RBeK9i32mbjysw_T3WEztlK8vSIItNxvgKrUXNcjNSYziBVtlq7zxzwceNRDS3zFdN4QjOL761obOsA12q31HbfEjdaanFTnjmU6cbPbfN8vNor8Nfo3W6Dqm8e52sk6I46MYvcXucovWgpCZDLzbnFea3jAoXpF8ZY1FYNUfO1Lk83Wc6oMpZRfW%2foXKJG8N9Y35nemR7rqqEaQaSPOxoDJKXVOMimt_LH29hzf5GJfdQbTDtFh5qh4IXCVcNseN4sNlabdcrvY_B_UZSIcQWbsogZpHdDySz34D4ieIyhEwbMl8%3d)

Lorsque vous gagnez un duel, Pex vous retourne son winning number, qui est un série de neuf chiffres. Vous devez donc fournir les chiffres pour chacun des duels précédents.
