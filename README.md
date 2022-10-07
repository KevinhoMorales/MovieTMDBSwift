# eMovie

Este proyecto esta desarrollado con el lenguaje de programación `Swift` con la arquitectura `MVVM (Model View ViewModel)` para sistemas operativos con iOS 14 o superior. Además se utilizó programación reactiva con `RxSwift - v6.5.0` y para la descarga de las imágenes `Kingfisher - v7.3.2`. Las dependecias estan manejadas por `Swift Package Manager`. 

> Este proyecto soporta MODO OSCURO
![Light Mode](https://firebasestorage.googleapis.com/v0/b/meniuz.appspot.com/o/FCMImages%2FeMovie%2FeMovie.png?alt=media&token=07287523-79f0-4bb0-ad52-24ee811f078e)

## Preguntas

### ¿En qué consiste el principio de responsabilidad única? ¿Cuál es su propósito?

Básicamente este principio dice que cada clase debería tener un solo propósito para su funcionamiento, es decir, que si tenemos una clase que obtenga las películas desde un servidor, esta clase únicamente obtendrá las películas para que después otra clase pueda presentar la vista con su respectivos datos obtenidos desde el servidor.

### ¿Qué características tiene, según su opinión, un “buen” código o código limpio?

El proyecto debería ser ordenado, organizarlo por módulos adaptándose a la arquitectura del proyecto. Las clases deberían ser localizadas rápidamente. Las funciones tendrían que tener un nombre que haga relevante el contenido. Variables y constantes bien nombradas según para que se utilicen. Dependiendo la complejidad del feature podría estar comentado con una breve explicación. 

### Detalla cómo harías todo aquello que no hayas llegado a completar.

Una de las cosas que quise completar es el paginado. Este feature lo realizaría en base a los collection, detectando cuando el user llego a la película final y enviando otro request con la siguiente página. Una vez me retorne la siguiente página al arreglo de películas de la primera página que ya mostre le sumaría la segunda página de datos. Por último actualizo la vista. El paginado iría incluido en el "SEE MORE" ya que en la vista HOME esta seteado los 6 primeros datos de cada categoría.

Me hubiera gustado es realizar una lista de todos los trailes y agregar un filtrado por año. Para que el user ingrese a "SEE TRAILER" y pueda seleccionar el que más le llame la atención. También me gustaría agregar un webView en el que el reproductor quede in-app para una vez seleccionado el trailer pueda observarlo desde la app.

Me hubiera gustado agregar una sección de favoritos. Y con mucho más tiempo poder crear una LOGIN para guardar en una base de datos de cada usuario. O si no hacerlo local sin LOGIN pero con local storage.

Me hubiera gustado darle soporte a diferentes lenguajes, ya que la data desde el servidor viene en inglés y por ello tuve que adaptar la app solo al idioma inglés.

Un feature importante que me hubiera gustado agregar es la búsqueda de una película. Hubiera utilizado el endpoint para buscar películas de la API y la programación reactiva con RxSwift.

Por último me hubiera gustado darle soporte a dispositivos como el iPad o Mac con un diseño especializado para ellos.

## Recursos

API utilizada:
[https://developers.themoviedb.org/](https://developers.themoviedb.org/)

Este proyecto fue basado en el siguiente diseño realizado en Figma:
[https://www.figma.com/file/x4r17vtNpB6hQgZhm7F0Tw/Prueba-RappiPay-%C2%B7-
Devp?node-id=0%3A1]()
