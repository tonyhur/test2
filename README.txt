Dieser Ordner demonstriert verschiedene Implementationen eines "Taschenrechners".
Implementiert in Delphi.

1) Die Funktionalit�t des Stacks wird in einem Modul (ADT) ausgelagert 
   (StackA.pas und StackAp.pas)
2) Die Funktionalit�t der Infix to Postfix und die Evaluation eines Ausdrucks ist spezifiziert
   im Modul Eval.pas

3) Calculator.dpr ist primitiver Console Client, welcher diese Funktionalit�t braucht.
4) Calculator1.dpr and Calc1.pas ist Event-Loop Console Client, welcher diese 
   Funktionalit�t braucht.
5) Calculator2.dpr and Calc2.pas (Calc2.dfm) ist Event-Loop visual Interface Client, welcher diese 
   Funktionalit�t (API) braucht.

6) Aller weitere Dateien sind weitere Klineten (Testbeispiele Project1.dpr usw.)

Tony H�rlimann, Feb 2015
