object rolando {
	const property artefactos = #{} //A collection represents a group of objects, known as its elements.
	var   property artefactosCantMax = 2
	const property historia = []
	const casa = castillo
	method agarrar(_artefactos){
		historia.add(_artefactos)
		if (artefactos.size()< artefactosCantMax){
			artefactos.add(_artefactos)			
		}

	}
	method aCasa(){
		casa.guardar(artefactos)
		artefactos.clear()
	}
	method MostrarInventario(){
		return self.artefactos() + casa.mostrarBaul()
	}
	method buscarArtefacto(_artefacto){
		return self.MostrarInventario().contains(_artefacto)
	}
}
//Casa
object castillo{
	const property baul = #{}
	
	method guardar(objetos){
		baul.addAll(objetos)
	}
	method mostrarBaul(){
		return baul
	}
}
//Artefactos
object espada{
}
object libro{
}
object collar{
}
object armadura{
}