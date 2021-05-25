predicates
nondeterm femme(symbol).
nondeterm homme(symbol).
nondeterm progeniteur(symbol,symbol).
nondeterm pere(symbol,symbol).
nondeterm mere(symbol,symbol).
nondeterm grandpere(symbol,symbol).
nondeterm grandmere(symbol,symbol).
nondeterm frere(symbol,symbol).
nondeterm soeur(symbol,symbol).
nondeterm tante(symbol,symbol).
nondeterm oncle(symbol,symbol).
nondeterm cousin(symbol,symbol).
nondeterm antecedant(symbol,symbol).

clauses
/*Les femmes*/
femme(mona).
femme(jackie).
femme(marge).
femme(patty).
femme(selma).
femme(lisa).
femme(maggie).
femme(ling).
/*Les hommes*/
homme(abraham).
homme(clancy).
homme(herb).
homme(homer).
homme(bart).
/*Les progeniteur*/
progeniteur(herb,abraham).
progeniteur(herb,mona).
progeniteur(homer,abraham).
progeniteur(homer,mona).
progeniteur(marge,clancy).
progeniteur(marge,jackie).
progeniteur(patty,clancy).
progeniteur(patty,jackie).
progeniteur(selma,clancy).
progeniteur(selma,jackie).
progeniteur(bart,homer).
progeniteur(bart,marge).
progeniteur(lisa,homer).
progeniteur(lisa,marge).
progeniteur(maggie,homer).
progeniteur(maggie,marge).
progeniteur(ling,selma).

/*Les regles*/
pere(Fils,Pere):-homme(Pere),progeniteur(Fils,Pere).
mere(Fils,Mere):-femme(Mere),progeniteur(Fils,Mere).
grandpere(Fils,Gpere):-pere(Fils,Y),progeniteur(Y,Gpere),homme(Gpere);mere(Fils,Y),progeniteur(Y,Gpere),homme(Gpere).
grandmere(Fils,Gmere):-pere(Fils,Y),progeniteur(Y,Gmere),femme(Gmere);mere(Fils,Y),progeniteur(Y,Gmere),femme(Gmere).
frere(Per,Fr):-pere(Per,X),pere(Fr,X),homme(Fr),mere(Per,X1),mere(Fr,X1),Per><Fr.
soeur(Per,Sr):-pere(Per,X),pere(Sr,X),femme(Sr),mere(Per,X1),mere(Sr,X1),Per><Sr.
tante(Per,Tan):-mere(Per,X),soeur(X,Tan);pere(Per,X1),soeur(X1,Tan).
oncle(Per,Onc):-mere(Per,X),frere(X,Onc);pere(Per,X1),frere(X1,Onc).
cousin(Per,Cou):-tante(Per,X),mere(Cou,X);oncle(Per,X1),pere(Cou,X1).
antecedant(Per,Ant):-progeniteur(Per,Ant);progeniteur(X1,Ant),antecedant(Per,X1).

goal
antecedant(ling,X).
                                                                                                                                                                   
