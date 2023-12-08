Convention de nommage
	•	Utiliser la norme camelCase : chaque mot composant le nom doit commencer par une majuscule. Pour les types et les protocoles,  Ex: NetworkManager. Pour les variables, la première lettre est en minuscule. Ex: let myNetworkManager
	•	Ne conserver que les mots porteurs d'information. Pas de conjonction de coordination, d'adjectifs etc...
	•	Utiliser des noms basés sur le rôle et non pas sur le type
	•	Ne pas utiliser d'abréviations
	•	Mettre les acronymes en minuscule. ^
	◦	Ex: let apiManager
	•	Donner la même base de noms aux méthodes traitant d'un même sujet.
	◦	Ex: addAccount(), removeAccount(), getAccount().
	•	Bien choisir les noms de paramètres afin qu'ils participent à l’auto documentation du code.
	◦	Ex: getProfile(userId: String)
	•	Les noms de variables sont en anglais
	•	Les booléens doivent commencer par le verbe (is, can, should, has...). Exemple : isUserInteractionEnabled plutôt userInteractionIsEnabled
Préfixe de classe
Les types en Swift sont automatiquement namespacés par le module qui les contiennent. Il ne faut donc pas préfixer le nom des types. En cas d'ambiguïté de nom, il faut utiliser le nom du module devant le nom de la classe.

Exemple
import SomeModule
let myClass = MyModuleName.UsefulClass()

Langage (TO BE DEFINED)
	•	Utiliser le français pour écrire les commentaires
	•	Utiliser l'anglais pour écrire les noms des classes et des variables
	•	Utiliser l'anglais pour se conformer aux API Apple. Ex: let color = "red"
Organisation du code
Utiliser les extensions pour organiser le code en blocs de fonctionnalités.
Chaque extension doit être précédée de // MARK: - commentaire pour indiquer la fonctionnalité
On peut par exemple séparer le cycle de vie, l’accès aux propriétés et les actions utilisateurs dans 3 extensions distinctes.
Ne pas dépasser 4 niveaux d'indentations
Ne pas imbriquer les switch.
Implémentation de protocole
Lorsqu'on implémente les méthodes d'un protocol, il faut le faire de préférence dans une extension dédiée. Cela permet de regrouper les méthodes liées au protocole.

Exemple
class: UIViewController {
    // propriétés et tout ce qui est lié au cycle de vie
}
 
// MARK: - MyViewControllerProtocol
extension MyViewController: MyViewControllerProtocol {
    // toutes les méthodes du protocol que la classe doit implémenter
}
 
// MARK: - UITableViewDataSource
extension MyViewController: UITableViewDataSource {
    // méthodes relatives au DataSource de la tableView
}
 
// MARK: - UIScrollViewDelegate
extension MyViewController: UIScrollViewDelegate {
    // méthode du ScrollViewDelegate
}

MVP
Limiter l'utilisation de SwiftUI ou UIKit au sein des presenters
Code mort
Le code mort, ce qui inclus les templates Xcode, doit être supprimé. Par exemple, les viewDidLoad créés par défaut, mais qui restent vide. Il en est de même pour toute méthode qui se contenterait d'appeler la classe parente sans ajouter de traitement.
Limitation des imports
Limiter les imports au strict nécessaire. Par exemple : ne pas importer UIKit si aucun appel à une fonction d'UIKit n'est effectué.
Espacement
	•	L'indentation se fait en utilisant 4 espaces
	•	Les ":" n'ont pas d'espace avant et ont un espace après. Les seules exceptions étant pour l'opérateur ternaire "?:", les dictionnaires vide "[:]" et l'utilisation de  #selector pour la separation des paramètres.
	•	Rappel : utiliser Ctrl + i pour ré-indenter le code
Commentaire
Ecrire des commentaires dans le but d'expliquer le Pourquoi plutôt que le comment. Les commentaires sont en français.
Exemple
// NOTE : j'explique pourquoi plutôt que comment
func myFunction() {
    // traitement spécifique ou algo un peu compliqué
}
Utilisation de Self
Self ne doit être utilisé que pour résoudre l'ambiguïté entre le paramètre d'une méthode et l’accès à une propriété de même nom dans la classe.
Déclaration de fonctions
Pour les fonctions dont la déclaration est courte, on la garde sur une seule ligne en incluant l'accolade :

Exemple
func reticulateSplines(spline: [Double]) -> Bool {
    // reticulate code goes here
}


Pour les fonctions plus longues, on mettra une ligne par paramètre :

Exemple
func reticulateSplines(spline: [Double],
                       adjustmentFactor: Double,
                       translateConstant: Int,
                       comment: String) -> Bool {
    // reticulate code goes here
}
Closure
Utiliser la syntaxe de closure directement à la fin de la liste d'arguments, uniquement s'il existe un seul paramètre de closure. Sinon, donner la liste des paramètres décrivant les paramètres de closure.
Exemple
Exemple :
 
UIView.animate(withDuration: 1.0) {
    self.myView.alpha = 0
}
 
UIView.animate(withDuration: 1.0, animations: {
    self.myView.alpha = 0
}, completion: { finished in
    self.myView.removeFromSuperview()
})
Type
Toujours utiliser les types natifs de Swift lorsqu'ils sont disponibles. Swift propose un bridge vers Objective-C afin de pouvoir utiliser l'ensemble des méthodes si nécessaire.
Optionnel
Déclarer les variables et les retours de fonction comme optionnels avec ? ssi une valeur nulle est acceptable.
N'utiliser les types unwrapped avec ! que pour les instances des variables type @IBOutlet.

Lorsqu'on veut accéder à un optionnel :
Utiliser "l'optional chaining" si on y accède une seule fois ou s'il existe plusieurs optionnel dans la chaîne :
Exemple
self.textContainer?.textLabel?.setNeedsDisplay()

Utilisez "l'optional binding" lorsqu'il est plus pratique d'unwrappée la valeur une seule fois afin d'effectuer plusieurs opérations :

Exemple
if let textContainer = self.textContainer {
    // do many things with textContainer
}

Lorsqu'on nomme des variables ou des propriétés optionnelles, éviter de les nommer comme "optionalString", car la notion d'optional est déjà portée dans la déclaration de type.

Pour l'optional binding, utilisez le nom d'origine quand il est approprié plutôt qu'utiliser des noms tels que unwrappedView ou actualLabel :

Exemple
var subview: UIView?
var volume: Double?
 
// later on...
if let subview, let volume {
    // do something with unwrapped subview and volume
}
Pour unwrap self dans une completion, si on a plus d'une ligne dans la completion on fait le guard sinon on utilise ?

Exemple
...
[weak self] _ in
    guard let self else { return }
    self.action1
    self.action2
    ...
}
 
...
[weak self] _ in
    self?.action
}

Déclaration de tableaux ou de dictionnaires vides
Pour les tableaux vides ou les dictionnaires, utilisez l'annotation de type :
Exemple
var names: [String] = []
var lookup: [String: Int] = [:]
Parenthèses dans les conditions
Les parenthèses  autour des conditions ne sont pas obligatoires, elles ne doivent pas être utilisées pour des conditions "simples" :

Exemple
if name == "Hello" {
    print("World")
}

Pour des expressions plus complexes, on peut les utiliser pour rendre le code plus lisible :
Exemple
let playerMark = (player == current ? "X" : "O")
Golden Path
Lors de l'utilisation de conditions, la partie gauche du code doit être le "golden" ou "happy" path. C'est à dire :
	•	Ne pas imbriquer les if
	•	Les return multiples sont  admis
	•	Le guard est fait pout çà

Exemple
func computeFFT(context: Context?, inputData: InputData?) throws -> Frequencies {
    guard let context else { throw FFTError.noContext }
     
    guard let inputData else { throw FFTError.noInputData }
 
    // use context and input to compute the frequencies
    return frequencies
}

Quand plusieurs optionnels sont unwrapped, que ce soit pour un guard ou un if, minimiser au maximum les imbrications en utilisant la version composée.

Exemple
guard let number1, let number2, let number3 else { fatalError("impossible") }

Syntaxe du guard
Les guards simples (une condition, ou plusieurs conditions pas trop longues) peuvent s'écrire sur une ligne. S'il n'y a qu'une instruction (ou plusieurs pas trop longues), on peut tout écrire sur 1 ligne :
Exemple
guard let self else { return }
S'il y a plusieurs conditions, elles s'écrivent à la ligne : 
Exemple
guard let userIdentifier = sessionManager.userIdentifier,
      biometricsManager.isUserBiometricsEnrolled(identifier: userIdentifier),
      stateManager.shouldUseBiometricsOnNextStep
else { return }
S'il y a plusieurs instructions dans le else, on l'écrit de la manière suivante : 
Exemple
guard let self else {
    Logger.log("mon erreur")
    return
}
Syntaxe des if let...
C'est la même syntaxe qu'un if normal.
Exemple
guard let userIdentifier = sessionManager.userIdentifier,
      biometricsManager.isUserBiometricsEnrolled(identifier: userIdentifier),
      stateManager.shouldUseBiometricsOnNextStep
else { return }
 
if let userIdentifier = sessionManager.userIdentifier,
   biometricsManager.isUserBiometricsEnrolled(identifier: userIdentifier),
   stateManager.shouldUseBiometricsOnNextStep {
    goToNextStep()
} else {
 Logger.log("mon erreur")
}

Utilisation des constantes de couleur
Les couleurs de la charte sont définies dans Common (UIColorConstants). Elle représentent l'exhaustivité des couleurs disponibles dans la charte.
Si vous voulez gérer des couleurs chartes, mais avec un aspect fonctionnel (maCouleurQuiSignifieCela), déclarez votre couleur dans une extension dans votre module, nommez-la pour qu'elle soit compréhensible fonctionnellement, et faites qu'elle utilise une couleur de la charte


Exemple
public static var negativeAmount: UIColor {
    .G1
}
