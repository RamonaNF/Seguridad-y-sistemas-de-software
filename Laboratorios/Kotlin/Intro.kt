
// kotlinc Intro.kt -include-runtime -d Intro.jar
// java -jar Intro.jar  

fun main(/*args: Array<String>*/) {
    val greet: String = "World"; // Constante
    //greet = "Ramona" // ERROR: No se puede reasignar el valor de una variable inmutable

    println("Hello " + greet + "!!");



    println("INTRODUCCIÓN A KOTLIN...\n");

    println("""Kotlin es un lenguaje de programación
    - De tipado estático
    - Código abierto
    - Y que admite la programación funcional y orientada a objetos """); // """ """ No acepta '\n' :O



    var num1 = 30; // Inferencia de tipo: no se definió, pero sabe que es kotlin.Int 
    val num2: Int = 2;

    println("\n1) String templates");
    println("    Se usa el '$' para desplegar valores o resultados de expresiones");
    println("    \"num1 = \" + num1     \"num1 = \$num1\"");
    println("        num1 = " + num1 + "          num1 = $num1");

    num1 = 1;
    //num1 = 1.2; // ERROR: El tipo asignado por ti o el compilador ya no puede cambiar

    println("\n2) Casting");
    println("    $num1/$num2 = ${num1/num2}"); 
    println("    Nope, $num1/$num2 = ${num1/num2.toFloat()}");

    // ¡Puedes usar el '_' para hacer los números más legibles!
    num1 = 1_000_000_000;
    val hexBytes = 0x00_00_00_0A;
    val bytes = 0b00000000_00000000_00000000_00001011;

    println("\n3) Números");
    println("    num1 = " + num1);
    println("    bytes = $bytes");
    println("    hexBytes = $hexBytes");
}
