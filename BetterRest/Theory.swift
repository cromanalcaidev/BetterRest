//
//  Theory.swift
//  BetterRest
//
//  Created by Carlos Román Alcaide on 19/3/24.
//

import SwiftUI


struct Theory: View {
    var body: some View {
        VStack {
            Text("Hello")
        }
        .padding()
    }
}

#Preview {
    Theory()
}




// Batch 3

// Para que un usuario pueda añadir fechas solo hay que crear una @State y linkarla con un picker. Pero las fechas son complicadas pq a veces hay cambios (cambios de hora, años bisiestos...)

/*
 
 func exampleDateS() {
     let now = Date.now
     let tomorrow = Date.now.addingTimeInterval(86400)
     let range = now...tomorrow
 }
 
 */

//¿Significa esto que es imposible trabajar con fechas? No, pero sí que hay que confiar en Apple y sus frameworks para evitarnos dolores de cabeza.

// Date.now nos permite trabajar con todo lo necesario para las fechas (horas, días, etc.).


/*
struct Theory: View {
    var body: some View {
        VStack {
 */
 
            // El tercer reto es cómo formatear fechas y horas, y tenemos 2 opciones. La primera es usar el parámetro "format"
/*

Text(Date.now, format: .dateTime.hour().minute())

*/
            //también podemos pedir el mes, el día, el año y lo que queramos.
            //También podemos usar el método "formatted()" directamente:

/*

            Text(Date.now.formatted(date: .long, time: .shortened))
        }
        .padding()
    }
*/

/*
    
    func exampleDateS() {
        
        */
        // Aparte Swift tiene un objeto llamado DateComponentes que nos permite trabajar (leer/escribir) con partes de una fecha
       
        /*
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
       */
         
        // let date = Calendar.current.date(from: components)
        // Debido a las complejidades de las fechas, método "date(from:)" devuelve una opcional, así que es buena idea hacer nil coalescing para evitar problemas:
       /*
        let date = Calendar.current.date(from: components) ?? .now
        */
        
        //Si la hora no existe, nos curamos en salud pidiendo la hora actual y ya está. De esta manera, resolvemos el primer reto: establecer que las 8 de la mañana sea la hora establecida.
        
        //Ahora, a por el segundo reto: cómo podemos leer la hora a la que el usuario se quiere despertar. DatePicker está vinculado a una fecha, así que hay que encontrar un modo de extraer solo los componentes hora y minuto. Pero con iOS y Datecomponentes podemos extraer componentes específicos de una fecha y leerlos.
        
        //Aquí de nuevo, al pedir la hora y el minuto, obtendremos una instacia de DateComponentes con valores opcionales para su spropiedades. Sabemos que los valores están ahí, pero aún así tenemos que desenvolver las opcionales de esta manera:
 /*
        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        
        
    }
    
}

*/



// Batch 2

/*
struct Theory: View {
  */
    //SwiftUI tiene un picker dedicado específicamente para las fechas (DatePicker), que está linkado a ellas. Y tiene un tipo específico para trabajar con ellas: "Date"

/*
    @State private var wakeUp = Date.now
  
 */
/*
    var body: some View {
        DatePicker("Please enter a date", selection: $wakeUp,
 
 */
                   //displayedComponents: .hourAndMinute

/*
                   in: Date.now...)
 
 */
        //Esto último es un rango unilateral, en el que especificamos un principio o un final, pero no los dos valores. Esto sirve para limitar.

/*
            .labelsHidden()
 */
 
 //Esto esconde la label y centra el picker, pero a la vez permite que la label sea leída por un lector de pantallas aunque no sea visible
        //El parámetro displayedComponentes nos permite elegir qué tipo de datos mostramos, si año, día y mes, solo horas y minutos o segundos...
   /* }
    
    func exampleDates() {
        let tomorrow = Date.now.addingTimeInterval(86400)
    
    */
        //Aquí estamos añadiendo un intervalo de tiempo para determinar qué significa "tomorrow" en términos de programación. En este caso, añadimos 24 horas en segundos (aprox)

/*
        let range = Date.now...tomorrow
    }
}
*/












// Batch 1

// SwiftUI tiene 2 formas de permitir que los usuarios añadan números: Slider y Stepper.

// Los stepper permiten trabajar con números de tipo Int y Double, pero no mezclarlos.


/*
struct Theory: View {
    @State private var sleepAmount = 8.0
    
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
  
 */
        // Hay 4 parámetros -> el label; el valor (value), que actualiza la variable; el rango (in: min...max), que determina un mínimo y un máximo; step, que determina cuánto crece o decrece
//    }
//}
