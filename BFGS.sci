function [fopt,xopt,gopt]=BFGS(Oracle,xini)


///////////////////////////////////////////////////////////////////////////////
//                                                                           //
//         RESOLUTION D'UN PROBLEME D'OPTIMISATION SANS CONTRAINTES          //
//                                                                           //
//         Methode de Quasi-Newton                                           //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////


// ------------------------
// Parametres de la methode
// ------------------------

   titre = "Parametres de la méthode Quasi-Newton";
   labels = ["Nombre maximal d''iterations";...
             "Valeur du pas de gradient";...
             "Seuil de convergence sur ||G||"];
   typ = list("vec",1,"vec",1,"vec",1);
   default = ["5000";"0.0005";"0.000001"];
   [ok,iter,alphai,tol] = getvalue(titre,labels,typ,default);

// ----------------------------
// Initialisation des variables
// ----------------------------
   
   logG = [];
   logP = [];
   Cout = [];

   timer();

// -------------------------
// Boucle sur les iterations
// -------------------------
   
   x = xini;
   [F,G] = Oracle(xini,4); // pour récupérer la dimension de W
   W_size = length(G)
   
   W = eye(W_size,W_size);

   kstar = iter;
   for k = 1:iter

//    - valeur du critere et du gradient

      ind = 4;
      [F,G] = Oracle(x,ind);

//    - test de convergence

      if norm(G) <= tol then
         kstar = k;
         break
      end

//    - direction
      D = - W * G

//    - calcul de la longueur du pas de gradient

      alpha = Wolfe(alphai,x,D,Oracle);

//    - mise a jour des variables

      x = x + (alpha*D);

//    - paramètres de la méthode BFGS

      [F2,G2] = Oracle(x,3);
      deltaxk = (alpha*D);
      deltagk = G2 - G;

//    - Approximation de la hessienne

      W = (eye(W_size,W_size) - (deltaxk*deltagk')/(deltagk'*deltaxk)) * W * (eye(W_size,W_size) - (deltaxk*deltagk')/(deltagk'*deltaxk)) + (deltaxk*deltagk')/(deltagk'*deltaxk);

//    - evolution du gradient, du pas et du critere

      logG = [ logG ; log10(norm(G)) ];
      logP = [ logP ; log10(alpha) ];
      Cout = [ Cout ; F ];

   end

// ---------------------------
// Resultats de l'optimisation
// ---------------------------

   fopt = F;
   xopt = x;
   gopt = G;

   tcpu = timer();

   cvge = ['Iteration         : ' string(kstar);...
           'Temps CPU         : ' string(tcpu);...
           'Critere optimal   : ' string(fopt);...
           'Norme du gradient : ' string(norm(gopt))];
   disp('Fin de la methode de gradient a pas fixe')
   disp(cvge)

// - visualisation de la convergence

   Visualg(logG,logP,Cout);

endfunction
