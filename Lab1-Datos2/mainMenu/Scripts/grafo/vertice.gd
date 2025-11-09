# vertice.gd
class_name Vertice

var dato: String
var vertices_ady: Array = []
var id: int
static var cid: int = 0

func _init(dato: String) -> void:
	self.dato = dato
	self.vertices_ady = []
	self.id = cid
	cid += 1

func get_dato() -> String:
	return dato

func set_dato(nuevo_dato: String) -> void:
	dato = nuevo_dato

func get_vertices_ady() -> Array:
	return vertices_ady

func set_vertices_ady(nuevos_vertices: Array) -> void:
	vertices_ady = nuevos_vertices

func get_id() -> int:
	return id

func set_id(nuevo_id: int) -> void:
	id = nuevo_id

static func get_cid() -> int:
	return cid

static func set_cid(nuevo_cid: int) -> void:
	cid = nuevo_cid

func agregar_ady(vertice: Vertice) -> void:
	vertices_ady.append(vertice)

func _to_string() -> String:
	var nombres_ady = []
	for v in vertices_ady:
		nombres_ady.append(v.get_dato())
	return "Vertice{nombre='%s', adyacentes=%s}" % [dato, ", ".join(nombres_ady)]
