# ArbolBinario.gd
class_name ArbolBinario
extends Node

var raiz: Nodo = null

# Agregar un nuevo nodo al árbol
func agregar_nodo(dato: Dictionary) -> void:
	var nuevo_nodo = Nodo.new(dato)
	if raiz == null:
		raiz = nuevo_nodo
		
	else:
		agregar_recursivo(raiz, nuevo_nodo)

# Función recursiva para insertar el nodo
func agregar_recursivo(nodo: Nodo, nuevo_nodo: Nodo) -> void:
	if not ("valor" in nuevo_nodo.dato) or not ("valor" in nodo.dato):
		push_error("El nodo no contiene la clave 'valor'")
		return

	if nuevo_nodo.dato["valor"] < nodo.dato["valor"]:
		if nodo.izq == null:
			nodo.izq = nuevo_nodo
		else:
			agregar_recursivo(nodo.izq, nuevo_nodo)
	else:
		if nodo.der == null:
			nodo.der = nuevo_nodo
		else:
			agregar_recursivo(nodo.der, nuevo_nodo)
