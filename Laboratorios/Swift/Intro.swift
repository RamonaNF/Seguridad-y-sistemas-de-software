
print("Hello World!!", terminator: "🌎");

var mutable: String = "Mis primeros pasos en swift... ";
let 🤩 = "awesome";

let cte: Float = 100;
// OJO: Nunca se convierte de manera implícita a otro tipo
//print(cte); // Descomentar para ver el error
print("\n" + mutable + String(cte) + "% " + 🤩);

print("""
\nString templates
  Podemos usar \\() para desplegar valores o resultados de expresiones
  \\(cte) = \(cte)
  \\(cte + 0.00001) = \(cte + 0.00001)\n
""");

if(mutable == "Mis primeros pasos en swift... ") {
   sendMsg("Qué tal ese hack ehh", nombre: "Ramona");
}



var dias = ["Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"];
dias.append("Dimanche");
dias.insert("Lundi", at: 0);
print(dias);

var significado = [String]();
for i in 0..<dias.count {
    switch i { 
        case 0,1:
            if i == 1 {
                significado.append("x2");
                break;
            }
	        significado.append("Inicio de semanaa...");
        case 2: 
	        significado.append("¡Ombligo de la semana!");
        case 3: 
	        significado.append("Casi fin de la semana");
        default: // "Vendredi", "Samedi", "Dimanche"
	        if i > 4 {
                significado.append("x" + String(i%4 + 1));
                break;
            }
            significado.append("Descansitooo :)");
    }
}
print(significado, terminator: "\n\n");



var interestingNumsDict: [String: [Int]] = [:]; // Colecciones desordenadas
interestingNumsDict = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25, 36]
];

var sum: Int = 0;
for (key, val) in interestingNumsDict { // '_' si se quiere indicar que no se usa una variable
    sum = 0;
    for num in val {
        sum += num;
    }
    print("\(key): \(sum)");
}



let http200Status = (code: 200, description: "OK"); // .0 -> .statusCode   .1 -> .description
let http = [/*(200, "OK"),*/(400, "Bad request"), (401, "Unauthorized"), (403, "Forbidden"), (404, "Not Found"), (408, "Request Timeout"), (500, "Internal Server Error"), (502, "Bad Gateway"), (503, "Service Unavailable"), (504, "Gateway Timeout")];

print("\nHTTP status codes");
print("  \(http200Status.code): \(http200Status.description)");
for (statusCode, statusMsg) in http {
    print("  \(statusCode): \(statusMsg)");
}



// '_' para evitar el uso del nombre de los parámetros
func sendMsg(_ mensaje: String, nombre: String) -> Void {
    print("\(mensaje) \(nombre)\n");
}
