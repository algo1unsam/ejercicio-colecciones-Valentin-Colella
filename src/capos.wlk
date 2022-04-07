object rolando {
	const property artefactos = #{} //A collection represents a group of objects, known as its elements.
	var   property artefactosCantMax = 2
	const property historia = []
	const casa = castillo
	var poderBase = 5
	method agarrar(_artefactos){
		historia.add(_artefactos)
		if (artefactos.size()< artefactosCantMax){
			artefactos.add(_artefactos)			
		}

	}
	
	method poderBase(){
		return poderBase
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
	
	method poder(){
		return self.poderBase() + self.sumatoriaPoderesArtefactos()
	}
	
	method sumatoriaPoderesArtefactos(){
		return artefactos.sum({artefacto => artefacto.poder(self)})
		/*en la línea de arriba, de cada artefacto dentro de la lista artefactos
		 me fijo el poder que tiene y los voy sumando
		
		*/
	}
	
	method batalla(){
		poderBase += 1
		artefactos.forEach({artefacto => artefacto.usar()})
	}
	
	method artefactoMasPoderosoDelCastillo(){
		return casa.artefactoMasPoderoso(self)
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
	/*
	method artefactoMasPoderoso(duenio){
		if (baul.isEmpty()){
			return 0
		}
		else return self.MasPoderoso(duenio).poder()
		// .poder() ya que el método MasPoderoso me devuelve un artefacto
		
	}
	
	method MasPoderoso(duenio){
		return baul.max({artefacto => artefacto.poder(duenio)})
	}
	*/
	
	//forma mas facil para hacer lo comentado de arriba:
	
	method artefactoMasPoderoso(duenio){
		return baul.map({artefacto => artefacto.poder(duenio)}).maxIfEmpty({0})
	}
	
}
//Artefactos
object espada{
	var nueva = true
	
	method poder(duenio){
		return duenio.poderBase() / if(nueva) {1} else {2}
	} 
	
	method usar(){
		nueva = false
	}
	
}
object libro{
	
	var property hechizos = []
	
	method poder(duenio){
		return hechizos.first().poder()
	}
	
	method usar(){
		
	}
	
//	method agregarHechizo(_hechizo){
//		hechizos.add(_hechizo)
//	}
	
}
object collar{
	var cantidadDeBatallas = 0
	const base = 0
	method poder(duenio){
		return base + if (duenio.poderBase() > 6) {cantidadDeBatallas} else {0}
	}
	
	method usar(){
		cantidadDeBatallas += 1
	}
}
object armadura{
	method poder(duenio) = 6
	
	method usar(){
		//no tiene efecto
	}
	
}

object bendicion{
	method poder(duenio){
		return 4
	}
}

object invisibilidad{
	method poder(duenio){
		duenio.poderBase()
		
	}
}

object invocacion{
	method poder(duenio){
		return duenio.artefactoMasPoderosoDelCastillo()
		
	}
}
