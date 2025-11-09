# grafo.gd
class_name Grafo

var vertices: Array = []
var matriz_adyacencia: Array = []

func _init() -> void:
	vertices = []
	matriz_adyacencia = []

func agregar_vertice(vertice: Vertice) -> void:
	vertices.append(vertice)

func conectar_vertice(vertice1: Vertice, vertice2: Vertice) -> void:
	if matriz_adyacencia.is_empty():
		var n = vertices.size()
		matriz_adyacencia.resize(n)
		for i in range(n):
			matriz_adyacencia[i] = []
			matriz_adyacencia[i].resize(n)
			for j in range(n):
				matriz_adyacencia[i][j] = 0

	vertice1.agregar_ady(vertice2)
	vertice2.agregar_ady(vertice1)

	matriz_adyacencia[vertice1.get_id()][vertice2.get_id()] = 1
	matriz_adyacencia[vertice2.get_id()][vertice1.get_id()] = 1

func bfs(inicio: int) -> Array:
	var cola: Array = []
	var recorrido: Array = []
	var visitados: Array = []
	visitados.resize(vertices.size())
	for i in range(vertices.size()):
		visitados[i] = false

	visitados[inicio] = true
	cola.append(inicio)

	while cola.size() > 0:
		var actual = cola.pop_front()
		recorrido.append(vertices[actual].get_dato())

		for v in vertices[actual].get_vertices_ady():
			var indice = vertices.find(v)
			if indice != -1 and not visitados[indice]:
				visitados[indice] = true
				cola.append(indice)

	return recorrido

func imprimir() -> void:
	print("=== Lista de vértices ===")
	for vertice in vertices:
		print(vertice._to_string())

	if matriz_adyacencia.is_empty():
		print("\n(No hay matriz de adyacencia inicializada.)")
		return

	print("\n=== Matriz de adyacencia ===")
	for i in range(matriz_adyacencia.size()):
		var fila_str = ""
		for j in range(matriz_adyacencia[i].size()):
			fila_str += str(matriz_adyacencia[i][j]) + "\t"
		print(fila_str)

func camino_mas_corto_bfs(inicio: int, fin: int) -> Array:
	var cola: Array = []
	var visitados: Array = []
	var padre: Array = []
	var n = vertices.size()

	visitados.resize(n)
	padre.resize(n)
	for i in range(n):
		visitados[i] = false
		padre[i] = -1

	visitados[inicio] = true
	cola.append(inicio)

	var encontrado = false
	while cola.size() > 0 and not encontrado:
		var actual = cola.pop_front()

		for v in vertices[actual].get_vertices_ady():
			var indice = vertices.find(v)
			if indice != -1 and not visitados[indice]:
				visitados[indice] = true
				padre[indice] = actual
				cola.append(indice)
				if indice == fin:
					encontrado = true
					break

	if not encontrado:
		return []

	var camino: Array = []
	var at = fin
	while at != -1:
		camino.insert(0, vertices[at].get_dato())
		at = padre[at]

	return camino
