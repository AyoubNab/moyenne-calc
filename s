def calculer_moyennes_matiere(notes: list):
    #calcule la moyenne de la liste de notes (notes doit contenir des tuple (notre, coef))
    somme: float = 0
    for i in notes:
        somme += i[0] * i[1]
    return somme / sum(i[1] for i in notes)

def inserer_notes():
    #menu principale de l'application
    #variables pour la boucle principale
    running = True
    s_running = True
    notes_matiere: dict[str, list] = {}
    while running:
        reponse = input("Introduit le nom de la matiere :")
        
        #verification de l'entre de l'utilisateur si ce n'est pas un int ou float la boucle est arrete
        if type(reponse) != str or reponse == 'exit':
            running = False
            break
        
        s_running = True
        while s_running:
                #si la conversion en float n'est pas reussi alors il arrete la boucle
                try :
                    note = float(input("Introduit la note :"))
                    coef = float(input("Introduit le coefficient :"))
                except:
                     s_running = False
                     break
                #si la matiere n'est pas dans la liste alors on l'ajoute puis on append le tuple (note, coef)
                if reponse not in notes_matiere:
                    notes_matiere[reponse] = []
                notes_matiere[reponse].append((note, coef))
    somme = 0
    for i in notes_matiere:
         somme += calculer_moyennes_matiere(notes_matiere[i])
         print(f"La moyenne de {i} est de {calculer_moyennes_matiere(notes_matiere[i])}")
    print(f"La moyenne globale est de {somme / len(notes_matiere)}")

inserer_notes()
