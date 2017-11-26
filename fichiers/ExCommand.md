# Exemple

**Mettre le modelio**

#Première étape

On crée nos objets _receiver_ :

- Console :
```java
public class Console {

	public void on(){
		System.out.println("La console est allumée");
	}
	
	public void off(){
		System.out.println("La console est eteinte");
	}
	
	public void startGame(){
		System.out.println("Jeu lancé");
	}
	
	public void stopGame(){
		System.out.println("Jeu arrété");
	}
}
```

- Radio : 
```java
public class Radio {
	
	private int volume = 0;
	
	public void on(){
		System.out.println("La radio est allumée");
	}
	
	public void off(){
		System.out.println("La radio est eteinte");
	}
	
	public void volumeUp(){
		this.volume++;
		System.out.println("Le volume est de : " + this.volume);
	}
	
	public void volumeDown(){
		this.volume--;
		System.out.println("Le volume est de : " + this.volume);
	}
}
```

# Deuxieme étape

On crée l'interface _Icommande_ qui sera implémentée pour chaque nouvelle commande
```java
public interface Icommande {

	public void execute();
	public void undo();
}
```

# Troisième étape
On va créer des commandes destinées à chaque objet (_a dire toutes les commandes n'apparaissent pas ici, ce serait bc trop long..._

Commande permettant d'allumer la console :
```java
public class Commande_ConsoleOn implements Icommande{

	private Console console;
	
	public Commande_ConsoleOn(Console theConsole) {
		this.console = theConsole;
	}
	
	@Override
	public void execute() {
		this.console.on();		
	}

	@Override
	public void undo() {
		this.console.off();
	}
}
```
Commande permettant de monter le son de la radio
```java
public class Commande_RadioVolumeUp implements Icommande{
	
	private Radio radio;
	
	public Commande_RadioVolumeUp(Radio theRadio) {
		this.radio = theRadio;
	}
	
	@Override
	public void execute() {
		this.radio.volumeUp();		
	}

	@Override
	public void undo() {
		this.radio.volumeDown();
	}
}
```
# Quatrième étape

Création de la télécommande
```java
public class Telecommande {
	private Icommande bouton1;
	private Icommande bouton2;
	private Icommande bouton3;
	private Icommande bouton4;
	
	public Telecommande(Icommande btn1, Icommande btn2, Icommande btn3, Icommande btn4){
		this.bouton1 = btn1;
		this.bouton2 = btn2;
		this.bouton3 = btn3;
		this.bouton4 = btn4;
	}
	
	public Telecommande(Icommande btn1, Icommande btn2){
		this.bouton1 = btn1;
		this.bouton2 = btn2;
	}
	
	public void pressBtn1(){
		this.bouton1.execute();
	}
	
	public void pressBtn2(){
		this.bouton2.execute();
	}
	
	public void pressBtn3(){
		this.bouton3.execute();
	}
	
	public void pressBtn4(){
		this.bouton4.execute();
	}
}
```

Nous avons ici fait le choix d'utiliser une télécommande à 4 boutons, comme vous pouvez le remarquer, aucune commande n'a été implémenté pour les boutons, ces commandes seront implémentées directement lors de la creation de celle ci.

# Cinquième et dernière étape 

```java runnable
// Class Console { autofold 
public class Console {

	public void on(){
		System.out.println("La console est allumée");
	}
	
	public void off(){
		System.out.println("La console est eteinte");
	}
	
	public void startGame(){
		System.out.println("Jeu lancé");
	}
	
	public void stopGame(){
		System.out.println("Jeu arrété");
	}
}
// }
// Class Radio { autofold
public class Radio {
	
	private int volume = 0;
	
	public void on(){
		System.out.println("La radio est allumée");
	}
	
	public void off(){
		System.out.println("La radio est eteinte");
	}
	
	public void volumeUp(){
		this.volume++;
		System.out.println("Le volume est de : " + this.volume);
	}
	
	public void volumeDown(){
		this.volume--;
		System.out.println("Le volume est de : " + this.volume);
	}
}
// }
// Interface Icommande { autofold
public interface Icommande {

	public void execute();
	public void undo();
}
// }
// class Commande_ConsoleOff implements Icommande { autofold
public class Commande_ConsoleOff implements Icommande{

	private Console console;
	
	public Commande_ConsoleOff(Console theConsole) {
		this.console = theConsole;
	}
	
	@Override
	public void execute() {
		this.console.off();		
	}

	@Override
	public void undo() {
		this.console.on();
	}
}
// }
// class Commande_ConsoleOn implements Icommande { autofold
public class Commande_ConsoleOn implements Icommande{

	private Console console;
	
	public Commande_ConsoleOn(Console theConsole) {
		this.console = theConsole;
	}
	
	@Override
	public void execute() {
		this.console.on();		
	}

	@Override
	public void undo() {
		this.console.off();
	}
}
// }
// class Commande_ConsoleStopGame implements Icommande { autofold
public class Commande_ConsoleStopGame implements Icommande{

	private Console console;
	
	public Commande_ConsoleStopGame(Console theConsole) {
		this.console = theConsole;
	}
	
	@Override
	public void execute() {
		this.console.stopGame();		
	}

	@Override
	public void undo() {
		this.console.startGame();
	}
}
// }
// class Commande_ConsoleStartGame implements Icommande { autofold
public class Commande_ConsoleStartGame implements Icommande {
	
	private Console console;
	
	public Commande_ConsoleStartGame(Console theConsole) {
		this.console = theConsole;
	}
	
	@Override
	public void execute() {
		this.console.startGame();		
	}

	@Override
	public void undo() {
		this.console.stopGame();
	}
}
// }
// class Commande_ConsoleStartGame implements Icommande { autofold
public class Commande_ConsoleStartGame implements Icommande {
	
	private Console console;
	
	public Commande_ConsoleStartGame(Console theConsole) {
		this.console = theConsole;
	}
	
	@Override
	public void execute() {
		this.console.startGame();		
	}

	@Override
	public void undo() {
		this.console.stopGame();
	}
}
// }
// class Commande_RadioOn implements Icommande { autofold
public class Commande_RadioOn implements Icommande{
	
	private Radio radio;
	
	public Commande_RadioOn(Radio theRadio) {
		this.radio = theRadio;
	}
	
	@Override
	public void execute() {
		this.radio.on();		
	}

	@Override
	public void undo() {
		this.radio.off();
	}
}
// }
// class Commande_RadioOff implements Icommande { autofold
public class Commande_RadioOff implements Icommande{
	
	private Radio radio;
	
	public Commande_RadioOff(Radio theRadio) {
		this.radio = theRadio;
	}
	
	@Override
	public void execute() {
		this.radio.off();		
	}

	@Override
	public void undo() {
		this.radio.on();
	}
}
// }
// class Commande_RadioVolumeUp implements Icommande { autofold
public class Commande_RadioVolumeUp implements Icommande{
	
	private Radio radio;
	
	public Commande_RadioVolumeUp(Radio theRadio) {
		this.radio = theRadio;
	}
	
	@Override
	public void execute() {
		this.radio.volumeUp();		
	}

	@Override
	public void undo() {
		this.radio.volumeDown();
	}
}
// }
// class Commande_RadioVolumeDown implements Icommande { autofold
public class Commande_RadioVolumeDown implements Icommande{

	private Radio radio;
	
	public Commande_RadioVolumeDown(Radio theRadio) {
		this.radio = theRadio;
	}
	
	@Override
	public void execute() {
		this.radio.volumeDown();		
	}

	@Override
	public void undo() {
		this.radio.volumeUp();
	}
}
// }
// class Commande_OnAll implements Icommande { autofold
public class Commande_OnAll implements Icommande{
	
	private Console console;
	private Radio radio;
	
	public Commande_OnAll(Console theConsole, Radio theRadio) {
		this.console = theConsole;
		this.radio = theRadio;
	}
	
	@Override
	public void execute() {
		this.console.on();
		this.radio.on();
	}

	@Override
	public void undo() {
		this.console.off();
		this.radio.off();
	}

}
// }
// class Telecommande { autofold
public class Telecommande {
	private Icommande bouton1;
	private Icommande bouton2;
	private Icommande bouton3;
	private Icommande bouton4;
	
	public Telecommande(Icommande btn1, Icommande btn2, Icommande btn3, Icommande btn4){
		this.bouton1 = btn1;
		this.bouton2 = btn2;
		this.bouton3 = btn3;
		this.bouton4 = btn4;
	}
	
	public Telecommande(Icommande btn1, Icommande btn2){
		this.bouton1 = btn1;
		this.bouton2 = btn2;
	}
	
	public void pressBtn1(){
		this.bouton1.execute();
	}
	
	public void pressBtn2(){
		this.bouton2.execute();
	}
	
	public void pressBtn3(){
		this.bouton3.execute();
	}
	
	public void pressBtn4(){
		this.bouton4.execute();
	}
}
// }

public class Main {

	public static void main(String[] args) {
		// Creation telecommande Radio
		Radio radio = new Radio();
		Telecommande telecommandeRadio = new Telecommande(new Commande_RadioOn(radio), new Commande_RadioOff(radio),
				new Commande_RadioVolumeUp(radio), new Commande_RadioVolumeDown(radio));
		
		//Creation telecommande Console
		Console console = new Console();
		Telecommande telecommandeConsole = new Telecommande(new Commande_ConsoleOn(console), new Commande_ConsoleOff(console),
				new Commande_ConsoleStartGame(console), new Commande_ConsoleStopGame(console));
		
		//Test télécommande radio
		telecommandeRadio.pressBtn1(); //On allume la radio
		telecommandeRadio.pressBtn3(); //VolumeUp
		telecommandeRadio.pressBtn3(); //VolumeUp
		telecommandeRadio.pressBtn4(); //VolumeDown
		telecommandeRadio.pressBtn2(); //On eteint la radio
		
		
		//Test télécommande console
		telecommandeConsole.pressBtn1(); //On allume la console
		telecommandeConsole.pressBtn3(); //StartGame
		telecommandeConsole.pressBtn4(); //StopGame
		telecommandeConsole.pressBtn2(); //on eteint la console
		
		//Et si on faisait une telecommande pour gerer l'etat de chaque device...
		Telecommande telecommandeMultiple = new Telecommande(new Commande_OnAll(console, radio), new Commande_OffAll(console, radio));
		
		telecommandeMultiple.pressBtn1();
		telecommandeMultiple.pressBtn2();
	}
}
```
