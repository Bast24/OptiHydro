///////////////////////////////////////////////////////////////////////////////
//                                                                           //
//  MONITEUR D'ENCHAINEMENT POUR LE CALCUL DE L'EQUILIBRE D'UN RESEAU D'EAU  //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////

// --------------------------------------
// Dimensionnement de l'espace de travail
// --------------------------------------

//   stacksize(10000000);

// ------------------------------------------
// Fonctions fournies dans le cadre du projet
// ------------------------------------------

   // Donnees du problemes

   exec('Probleme_R.sce');
   exec('Structures_R.sce');
   
   // Affichage des resultats

   exec('Visualg.sci');
   
   // Verification  des resultats

   exec('HydrauliqueP.sci');
   exec('HydrauliqueD.sci');
   exec('Verification.sci');

// ------------------------------------------
// Fonctions a ecrire dans le cadre du projet
// ------------------------------------------

   // ---> Charger les fonctions  associees a l'oracle du probleme,
   //      aux algorithmes d'optimisation et de recherche lineaire.
   //
   // Exemple : la fonction "optim" de Scilab
   //
   exec('Oracle.sce');
   exec('Oracle_D.sce');
   exec('Optim_Scilab.sci');
   titrgr = "";
   exec('Wolfe_Skel.sci');
   exec('Gradient_F.sci');
   exec('BFGS.sci');
   exec('Newton.sci');
   exec('Gradient_V.sci');
   exec('Polak_Ribiere.sci');

// ------------------------------
// Initialisation de l'algorithme
// ------------------------------

   // La dimension (n-md) est celle du probleme primal

   xini = 0.1 * rand(n-md,1);
   lmb_ini = 0.1 * rand(md,1);

// ----------------------------
// Minimisation proprement dite
// ----------------------------

// PROBLEME PRIMAL

//   [fopt,xopt,gopt] = Gradient_F(OraclePG, xini);
//   [fopt,xopt,gopt] = Gradient_V(OraclePG, xini);
//   [fopt,xopt,gopt] = Polak_Ribiere(OraclePG, xini);
//   [fopt,xopt,gopt] = BFGS(OraclePG, xini);
//   [fopt,xopt,gopt] = Newton(OraclePH, xini);
//   [fopt,xopt,gopt] = Optim_Scilab(OraclePH, xini);

// PROBLEME DUAL

//   [fopt,xopt,gopt] = Gradient_F(OracleDG, lmb_ini);
//   [fopt,xopt,gopt] = Gradient_V(OracleDG, lmb_ini);
//   [fopt,xopt,gopt] = Polak_Ribiere(OracleDH, lmb_ini);
//   [fopt,xopt,gopt] = BFGS(OracleDG, lmb_ini);
   [fopt,xopt,gopt] = Newton(OracleDH, lmb_ini);
//   [fopt,xopt,gopt] = Optim_Scilab(OracleDH, lmb_ini);


// --------------------------
// Verification des resultats
// --------------------------

// PROBLEME PRIMAL
   // [q,z,f,p] = HydrauliqueP(xopt);
   
// PROBLEME DUAL
   [q,z,f,p] = HydrauliqueD(xopt)

   Verification(q,z,f,p);

//
