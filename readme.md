**Convention de nommage**

- Utiliser la norme camelCase : chaque mot composant le nom doit
  commencer par une majuscule. Pour les types et les protocoles,  Ex:
  NetworkManager. Pour les variables, la première lettre est en
  minuscule. Ex: let myNetworkManager

- Ne conserver que les mots porteurs d'information. Pas de conjonction
  de coordination, d'adjectifs etc...

- Utiliser des noms basés sur le rôle et non pas sur le type

- Ne pas utiliser d'abréviations

- Mettre les acronymes en minuscule. ^

  - Ex: let apiManager

<!-- -->

- Donner la même base de noms aux méthodes traitant d'un même sujet.

  - Ex: addAccount(), removeAccount(), getAccount().

<!-- -->

- Bien choisir les noms de paramètres afin qu'ils participent à l’auto
  documentation du code.

  - Ex: getProfile(userId: String)

<table>
<tbody>
<tr class="odd">
</tr>
</tbody>
</table>

<table>
<tbody>
<tr class="odd">
<td><ul>
<li><p>Les noms de variables sont en anglais</p></li>
<li><p>Les booléens doivent commencer par le verbe (is, can, should,
has...). Exemple : isUserInteractionEnabled plutôt
userInteractionIsEnabled<br />
<strong>Préfixe de classe</strong><br />
Les types en Swift sont automatiquement namespacés par le module qui les
contiennent. Il ne faut donc pas préfixer le nom des types. En cas
d'ambiguïté de nom, il faut utiliser le nom du module devant le nom de
la classe.<br />
<br />
<strong>Exemple</strong></p></li>
</ul>
<p><strong><code>import</code></strong><code> SomeModule</code><br />
<code>let myClass = MyModuleName.UsefulClass()</code></p></td>
</tr>
</tbody>
</table>

  
**Langage (TO BE DEFINED)**

<table>
<tbody>
<tr class="odd">
</tr>
</tbody>
</table>

<table>
<tbody>
<tr class="odd">
<td><ul>
<li><p>Utiliser le français pour écrire les commentaires</p></li>
<li><p>Utiliser l'anglais pour écrire les noms des classes et des
variables</p></li>
<li><p>Utiliser l'anglais pour se conformer aux API Apple. Ex: let color
= "red"<br />
<strong>Organisation du code</strong><br />
Utiliser les extensions pour organiser le code en blocs de
fonctionnalités.<br />
Chaque extension doit être précédée de // MARK: - commentaire pour
indiquer la fonctionnalité<br />
On peut par exemple séparer le cycle de vie, l’accès aux propriétés et
les actions utilisateurs dans 3 extensions distinctes.<br />
Ne pas dépasser 4 niveaux d'indentations<br />
Ne pas imbriquer les switch.<br />
<strong>Implémentation de protocole</strong><br />
Lorsqu'on implémente les méthodes d'un protocol, il faut le faire de
préférence dans une extension dédiée. Cela permet de regrouper les
méthodes liées au protocole.<br />
<br />
<strong>Exemple</strong></p></li>
</ul>
<p><strong><code>class</code></strong><code>: UIViewController </code><code>{</code></p>
<p>    // propriétés et tout ce qui est lié au cycle de vie</p>
<p>}</p>
<p> <br />
// MARK: - MyViewControllerProtocol</p>
<p>extension MyViewController: MyViewControllerProtocol {</p>
<p>    // toutes les méthodes du protocol que la classe doit
implémenter</p>
<p>}</p>
<p> <br />
// MARK: - UITableViewDataSource</p>
<p>extension MyViewController: UITableViewDataSource {</p>
<p>    // méthodes relatives au DataSource de la tableView</p>
<p>}</p>
<p> <br />
// MARK: - UIScrollViewDelegate</p>
<p>extension MyViewController: UIScrollViewDelegate {</p>
<p>    // méthode du ScrollViewDelegate</p>
<p>}</p></td>
</tr>
</tbody>
</table>

  
**MVP**  
Limiter l'utilisation de SwiftUI ou UIKit au sein des presenters  
**Code mort**  
Le code mort, ce qui inclus les templates Xcode, doit être supprimé. Par
exemple, les viewDidLoad créés par défaut, mais qui restent vide. Il en
est de même pour toute méthode qui se contenterait d'appeler la classe
parente sans ajouter de traitement.  
**Limitation des imports**  
Limiter les imports au strict nécessaire. Par exemple : ne pas importer
UIKit si aucun appel à une fonction d'UIKit n'est effectué.  
**Espacement**

<table>
<tbody>
<tr class="odd">
</tr>
</tbody>
</table>

<table>
<tbody>
<tr class="odd">
<td><ul>
<li><p>L'indentation se fait en utilisant 4 espaces</p></li>
<li><p>Les ":" n'ont pas d'espace avant et ont un espace après. Les
seules exceptions étant pour l'opérateur ternaire "?:", les
dictionnaires vide "[:]" et l'utilisation de  #selector pour la
separation des paramètres.</p></li>
<li><p>Rappel : utiliser Ctrl + i pour ré-indenter le code<br />
<strong>Commentaire</strong><br />
Ecrire des commentaires dans le but d'expliquer le
<strong>Pourquoi</strong> plutôt que le comment. Les commentaires sont
en français.<br />
<strong>Exemple</strong></p></li>
</ul>
<p><code>// NOTE : j'explique pourquoi plut</code><code>ô</code><code>t que comment</code></p>
<p>func myFunction() {</p>
<p>    // traitement spécifique ou algo un peu compliqué</p>
<p>}</p></td>
</tr>
<tr class="even">
<td></td>
</tr>
</tbody>
</table>

**Utilisation de Self**  
Self ne doit être utilisé que pour résoudre l'ambiguïté entre le
paramètre d'une méthode et l’accès à une propriété de même nom dans la
classe.  
**Déclaration de fonctions**  
Pour les fonctions dont la déclaration est courte, on la garde sur une
seule ligne en incluant l'accolade :  
  
**Exemple**

<table>
<tbody>
<tr class="odd">
<td><p><code>func reticulateSplines(spline: [Double]) -&gt; Bool </code><code>{</code></p>
<p>    // reticulate code goes here</p>
<p>}</p></td>
</tr>
<tr class="even">
<td></td>
</tr>
</tbody>
</table>

  
  
Pour les fonctions plus longues, on mettra une ligne par paramètre :  
  
**Exemple**

<table>
<tbody>
<tr class="odd">
<td><p><code>func reticulateSplines(spline: [Double],</code></p>
<p>                       adjustmentFactor: Double,<br />
                       translateConstant: Int,<br />
                       comment: String) -&gt; Bool {<br />
    // reticulate code goes here</p>
<p>}</p></td>
</tr>
<tr class="even">
<td></td>
</tr>
</tbody>
</table>

**Closure**  
Utiliser la syntaxe de closure directement à la fin de la liste
d'arguments, uniquement s'il existe un seul paramètre de closure. Sinon,
donner la liste des paramètres décrivant les paramètres de closure.  
**Exemple**

<table>
<tbody>
<tr class="odd">
<td><p><code>Exemple :</code></p>
<p>UIView.animate(withDuration: 1.0) {</p>
<p>    self.myView.alpha = 0</p>
<p>}</p>
<p>UIView.animate(withDuration: 1.0, animations: {</p>
<p>    self.myView.alpha = 0</p>
<p>}, completion: { finished in</p>
<p>    self.myView.removeFromSuperview()</p>
<p>})</p></td>
</tr>
<tr class="even">
<td></td>
</tr>
</tbody>
</table>

**Type**  
Toujours utiliser les types natifs de Swift lorsqu'ils sont disponibles.
Swift propose un bridge vers Objective-C afin de pouvoir utiliser
l'ensemble des méthodes si nécessaire.  
**Optionnel**  
Déclarer les variables et les retours de fonction comme optionnels avec
? ssi une valeur nulle est acceptable.  
N'utiliser les types unwrapped avec ! que pour les instances des
variables type @IBOutlet.  
  
Lorsqu'on veut accéder à un optionnel :  
Utiliser "l'optional chaining" si on y accède une seule fois ou s'il
existe plusieurs optionnel dans la chaîne :  
**Exemple**

<table>
<tbody>
<tr class="odd">
<td><p><code>self.textContainer?.textLabel?.setNeedsDisplay()</code></p></td>
</tr>
<tr class="even">
<td></td>
</tr>
</tbody>
</table>

  
Utilisez "l'optional binding" lorsqu'il est plus pratique d'unwrappée la
valeur une seule fois afin d'effectuer plusieurs opérations :  
  
**Exemple**

<table>
<tbody>
<tr class="odd">
<td><p><strong><code>if</code></strong><code> let textContainer = self.textContainer </code><code>{</code><br />
<code> </code><code> </code><code> </code><code> </code><code>// do many things with textContainer</code><br />
<code>}</code></p></td>
</tr>
<tr class="even">
<td></td>
</tr>
</tbody>
</table>

  
Lorsqu'on nomme des variables ou des propriétés optionnelles, éviter de
les nommer comme "optionalString", car la notion d'optional est déjà
portée dans la déclaration de type.  
  
Pour l'optional binding, utilisez le nom d'origine quand il est
approprié plutôt qu'utiliser des noms tels que unwrappedView ou
actualLabel :  
  
**Exemple**

<table>
<tbody>
<tr class="odd">
<td><p><code>var subview: UIView?</code><br />
<code>var volume: Double?</code></p>
<p>// later on...</p>
<p><strong><code>if</code></strong><code> let subview, let volume </code><code>{</code></p>
<p>    // do something with unwrapped subview and volume</p>
<p>}</p></td>
</tr>
<tr class="even">
<td></td>
</tr>
</tbody>
</table>

Pour unwrap self dans une completion, si on a plus d'une ligne dans la
completion on fait le guard sinon on utilise ?  
  
**Exemple**

<table>
<tbody>
<tr class="odd">
<td><p><code>...</code><br />
<code>[weak self] _ in</code></p>
<p>    guard let self
<strong><code>else</code></strong><code> </code><code>{</code><code> </code><strong><code>return</code></strong><code> </code><code>}</code><br />
<code> </code><code> </code><code> </code><code> </code><code>self.action1</code><br />
<code> </code><code> </code><code> </code><code> </code><code>self.action2</code><br />
<code> </code><code> </code><code> </code><code> </code><code>...</code></p>
<p>}</p>
<p>...<br />
[weak self] _ in</p>
<p>    self?.action</p>
<p>}</p></td>
</tr>
<tr class="even">
<td></td>
</tr>
</tbody>
</table>

  
**Déclaration de tableaux ou de dictionnaires vides**  
Pour les tableaux vides ou les dictionnaires, utilisez l'annotation de
type :  
**Exemple**

<table>
<tbody>
<tr class="odd">
<td><p><code>var names: [String] = []</code><br />
<code>var lookup: [String: Int] = [:]</code></p></td>
</tr>
<tr class="even">
<td></td>
</tr>
</tbody>
</table>

**Parenthèses dans les conditions**  
Les parenthèses  autour des conditions ne sont pas obligatoires, elles
ne doivent pas être utilisées pour des conditions "simples" :  
  
**Exemple**

<table>
<tbody>
<tr class="odd">
<td><p><strong><code>if</code></strong><code> name == </code><code>"Hello"</code><code> </code><code>{</code><br />
<code> </code><code> </code><code> </code><code> </code><code>print(</code><code>"World"</code><code>)</code><br />
<code>}</code></p></td>
</tr>
<tr class="even">
<td></td>
</tr>
</tbody>
</table>

  
Pour des expressions plus complexes, on peut les utiliser pour rendre le
code plus lisible :  
**Exemple**

<table>
<tbody>
<tr class="odd">
<td><p><code>let playerMark = (player == current ? </code><code>"X"</code><code> : </code><code>"O"</code><code>)</code></p></td>
</tr>
</tbody>
</table>

**Golden Path**  
Lors de l'utilisation de conditions, la partie gauche du code doit être
le "golden" ou "happy" path. C'est à dire :

<table>
<tbody>
<tr class="odd">
</tr>
</tbody>
</table>

<table>
<tbody>
<tr class="odd">
<td><ul>
<li><p>Ne pas imbriquer les if</p></li>
<li><p>Les return multiples sont  admis</p></li>
<li><p>Le guard est fait pout çà<br />
<br />
<strong>Exemple</strong></p></li>
</ul>
<p><code>func computeFFT(context: Context?, inputData: InputData?) </code><strong><code>throws</code></strong><code> -&gt; Frequencies </code><code>{</code><br />
<code> </code><code> </code><code> </code><code> </code><code>guard let context </code><strong><code>else</code></strong><code> </code><code>{</code><code> </code><strong><code>throw</code></strong><code> FFTError.noContext </code><code>}</code><br />
<code> </code><code> </code><code> </code><code> </code><code> </code><br />
<code> </code><code> </code><code> </code><code> </code><code>guard let inputData </code><strong><code>else</code></strong><code> </code><code>{</code><code> </code><strong><code>throw</code></strong><code> FFTError.noInputData </code><code>}</code><br />
<code> </code><br />
<code> </code><code> </code><code> </code><code> </code><code>// use context and input to compute the frequencies</code><br />
<code> </code><code> </code><code> </code><code> </code><strong><code>return</code></strong><code> frequencies</code><br />
<code>}</code></p></td>
</tr>
<tr class="even">
<td></td>
</tr>
</tbody>
</table>

  
Quand plusieurs optionnels sont unwrapped, que ce soit pour un guard ou
un if, minimiser au maximum les imbrications en utilisant la version
composée.  
  
**Exemple**

<table>
<tbody>
<tr class="odd">
<td><p><code>guard let number1, let number2, let number3 </code><strong><code>else</code></strong><code> </code><code>{</code><code> fatalError(</code><code>"impossible"</code><code>) </code><code>}</code></p></td>
</tr>
<tr class="even">
<td></td>
</tr>
</tbody>
</table>

  
**Syntaxe du guard**  
Les guards simples (une condition, ou plusieurs conditions pas trop
longues) peuvent s'écrire sur une ligne. S'il n'y a qu'une instruction
(ou plusieurs pas trop longues), on peut tout écrire sur 1 ligne :  
**Exemple**

<table>
<tbody>
<tr class="odd">
<td><p><code>guard let self </code><strong><code>else</code></strong><code> </code><code>{</code><code> </code><strong><code>return</code></strong><code> </code><code>}</code></p></td>
</tr>
<tr class="even">
<td></td>
</tr>
</tbody>
</table>

S'il y a plusieurs conditions, elles s'écrivent à la ligne :   
**Exemple**

<table>
<tbody>
<tr class="odd">
<td><p><code>guard let userIdentifier = sessionManager.userIdentifier,</code></p>
<p>      biometricsManager.isUserBiometricsEnrolled(identifier:
userIdentifier),<br />
      stateManager.shouldUseBiometricsOnNextStep</p>
<p><strong><code>else</code></strong><code> </code><code>{</code><code> </code><strong><code>return</code></strong><code> </code><code>}</code></p></td>
</tr>
<tr class="even">
<td></td>
</tr>
</tbody>
</table>

S'il y a plusieurs instructions dans le else, on l'écrit de la manière
suivante :   
**Exemple**

<table>
<tbody>
<tr class="odd">
<td><p><code>guard let self </code><strong><code>else</code></strong><code> </code><code>{</code><br />
<code> </code><code> </code><code> </code><code> </code><code>Logger.log(</code><code>"mon erreur"</code><code>)</code><br />
<code> </code><code> </code><code> </code><code> </code><strong><code>return</code></strong><br />
<code>}</code></p></td>
</tr>
<tr class="even">
<td></td>
</tr>
</tbody>
</table>

**Syntaxe des if let...**  
C'est la même syntaxe qu'un if normal.  
**Exemple**

<table>
<tbody>
<tr class="odd">
<td><p><code>guard let userIdentifier = sessionManager.userIdentifier,</code></p>
<p>      biometricsManager.isUserBiometricsEnrolled(identifier:
userIdentifier),<br />
      stateManager.shouldUseBiometricsOnNextStep</p>
<p><strong><code>else</code></strong><code> </code><code>{</code><code> </code><strong><code>return</code></strong><code> </code><code>}</code></p>
<p><strong><code>if</code></strong><code> let userIdentifier = sessionManager.userIdentifier,</code></p>
<p>   biometricsManager.isUserBiometricsEnrolled(identifier:
userIdentifier),<br />
   stateManager.shouldUseBiometricsOnNextStep {<br />
    goToNextStep()</p>
<p>} <strong><code>else</code></strong><code> </code><code>{</code></p>
<p> Logger.log("mon erreur")</p>
<p>}</p></td>
</tr>
<tr class="even">
<td></td>
</tr>
</tbody>
</table>

  
**Utilisation des constantes de couleur**  
Les couleurs de la charte sont définies dans Common (UIColorConstants).
Elle représentent l'exhaustivité des couleurs disponibles dans la
charte.  
Si vous voulez gérer des couleurs chartes, mais avec un aspect
fonctionnel (maCouleurQuiSignifieCela), déclarez votre couleur dans une
extension dans votre module, nommez-la pour qu'elle soit compréhensible
fonctionnellement, et faites qu'elle utilise une couleur de la charte  
  
  
**Exemple**

<table>
<tbody>
<tr class="odd">
<td><p><strong><code>public</code></strong><code> </code><strong><code>static</code></strong><code> var negativeAmount: UIColor </code><code>{</code><br />
<code> </code><code> </code><code> </code><code> </code><code>.G1</code><br />
<code>}</code></p></td>
</tr>
</tbody>
</table>
