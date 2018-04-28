# Comparaison de plusieurs méthodes d'optimisation
Par Bastien Déchamps et Mathieu Orhan, étudiants à l'ENPC, département IMI.

## Introduction

Dans le cadre du cours d'[optimisation et contrôle](http://cermics.enpc.fr/~jpc/optimisation.html) à l'ENPC, nous avons implémenté et testé plusieurs méthodes d'optimisation dnas un objectif pédagogique (descentes de gradient à pas fixe et variable, Polak Ribiere, BFGS, Newton) sur un problème d'optimisation dont vous pouvez consulter le sujet en PDF [ici](http://cermics.enpc.fr/~jpc/optimisation-tp/TP_OC.pdf).
Vous pourrez très prochainement accèder à notre rapport complet.

## Dépendances

Vous n'avez besoin que de Scilab (gratuit et multiplateforme).

## Comment utiliser ce programme

Pour changer d'algorithme ou d'oracle, il suffit de changer la ligne 63  de `Moniteur_Skel.sci`. En lançant ce dernier script dans Scilab, on peut choisir le pas et d'autres paramètres, puis visualiser la convergence et d'autres données comme le temps de calcul CPU.
