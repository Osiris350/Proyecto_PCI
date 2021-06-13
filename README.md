# Proyecto_PCIE
### Integrantes:
### Luis Alonso Rodríguez B76547 
### Jafet Gutiérrez B73558
### Gabriel Araya Mora B80525
### Andrés Arias Campos B80661

### Resumen del proyecto
El proyecto consiste en un diseño de RTL en verilog de la etapa física de un sistema PCI el cual tiene en su interior un dos módulos, un phy transmisor, y un phy receptor. Estos dos por su parte cuentan con, recirculador y lógica de muxes y demuxes encargados de enrutrar la información en los canales, separando o juntando las entradas según sea necesario para las siguientes etapas. Además, ambos cuentan con módulos serial paralelo y paralelo serial para cumplir con dicha función.  El paralelo serial es el encargado de enviar los datos de un módulo a otro. Estos, como su nombre lo indica pasan los datos en serie o en paralelo a su contraparte, con una codificación que indica si es válida o no la información enviada, evitando tener lecturas no deseadas en momentos donde se indica, por ejemplo, un reset. \\

El objetivo del sistema es precisamente recibir y transmitir la información. Es por esto que como pruebas, se verifica que los valores de entrada aparezcan a la salida también, asegurandose así que, si coninciden, el proceso se realizó de manera satisfactoria pese a las transformaciones internas. Se obtiene un resultado satisfactorio debido a que tanto la descripción conductual en verilog como la estructural procesada por yosys entregan la salida esperada. Para un diseño posterior se recomienda siempre verificar que las entradas y salidas tienen un valor, y no son condiciones no importa y cubrir todas las posibilidades de valores condicionales.


### Instrucciones para la ejecución del Makefile
Para ejecutar las distintas pruebas solo es necesario correr el comando $make$ $Prueba\_\#$, donde \# es el resto del nombre de la prueba como se muestra en el $Makefile$. $Prueba\_PHYTX/RX$ ejecuta las pruebas de los módulos $Phy\_Tx.v$ y $Phy\_Rx.v$, mientras que $Prueba\_PHY$ ejecuta la simulación del módulo $Phy.v$. En términos generales cada prueba realiza lo siguiente:

