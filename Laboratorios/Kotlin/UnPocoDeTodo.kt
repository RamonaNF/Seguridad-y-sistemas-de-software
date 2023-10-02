
fun main(/*args: Array<String>*/) {
    println("UN POCO DE TODOOO");

    for(i in 3 downTo 1) {
        print("  $i...");
    }
    println("  ¡Arrancamooos!\n");



    println("LISTAS");
    val listas = listOf("Colecciones", "ordenadas", "de elementos"); // Inmutable
    print("  ");
    println(listas);
    print("\n");

    var listasMutables = mutableListOf("Con mutables modifica ", "lo que quieras");
    print(listasMutables);
    print("   --->   ");

    listasMutables += "a tu antojo :)";
    listasMutables.remove("lo que quieras");
    println(listasMutables);



    println("\nARRAYS");

    val vocales = arrayOf(1, "a", 2, "e", 3, "i", 4, "o", 5, "u"); // Tipos mixtos
    val nums = (1..5).toList().toIntArray(); // Tipos simples

    println("  Ojito al imprimirlos");
    println("    Referencia: " + vocales + "  vs  " + nums);
    println("    Contenido: " + java.util.Arrays.toString(vocales) + "  vs  " + java.util.Arrays.toString(nums) + "\n");
    
    var mensaje: String = "";
    for((index, elem) in vocales.withIndex()) {
        when(elem) {
            is Int -> {
                println("Removing $elem from nums...");
                nums[elem - 1] = -1;
            }
            is String -> mensaje += elem + " ";
        }
    }
    println("\n" + mensaje + "el burro ríe más que túúú");

    println("\nnums? Nah... " + java.util.Arrays.toString(nums));
    println("      Welp, it was an array tho :P\n");



    var increase: Int = 0;
    repeat(11) {
        for(letter in 'a'..('a' + increase)) { // Operador range to
            print(letter + " ");
        }
        println("");
        increase++;
    }
}
