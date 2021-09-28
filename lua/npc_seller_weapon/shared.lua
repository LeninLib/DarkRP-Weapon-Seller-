
ENT.Base = "base_ai"
ENT.Type = "ai"
ENT.PrintName = "NPC Weapon Seller"
ENT.Author = "Lenin_lib"
ENT.Spawnable = true
ENT.Category = "Lenin_lib"

PESW = {} -- weapon 
PESWCAT = {} -- category weapon
PESWCAT[1] = {
	Name = "Пистолеты",
	Color = Color(0,0,0, 255 )
}
PESWCAT[2] = {
	Name = "ПП",
	Color = Color(0,0,0, 255 )
}

PESWCAT[3] = {
	Name = "Автоматы",
	Color = Color(0,0,0, 255 )
}
PESWCAT[4] = {
	Name = "Дробовики",
	Color = Color(0,0,0, 255 )
}

PESWCAT[5] = {
	Name = "Винтовки",
	Color = Color(0,0,0, 255 )
}


PESW["fas2_glock20"] = {
	Name = "Glock 20",
	Category = "Пистолеты",
	Cost = 1500,
	SpawnFunction =	function( ply, self )
			ply:Give( "fas2_glock20" )
	end
}
PESW["fas2_ots33"] = {
	Name = "ОТС 33 Пернач",
	Category = "Пистолеты",
	Cost = 2250,

	SpawnFunction =	function( ply, self )
			ply:Give( "fas2_ots33" )
	end
}
PESW["fas2_pmm"] = {
	Name = "ПММ",
	Category = "Пистолеты",
	Cost = 1750,

	SpawnFunction =	function( ply, self )
			ply:Give( "fas2_pmm" )
	end
}
 

 PESW["fas2_mp5a5"] = {
	Name = "mp5a5",
	Category = "ПП",
	Cost = 15000,

	SpawnFunction =	function( ply, self )
			ply:Give( "fas2_mp5a5" )
	end
}

PESW["fas2_pp19"] = {
	Name = "ПП 19 БИЗОН",
	Category = "ПП",
	Cost = 15500,

	SpawnFunction =	function( ply, self )
			ply:Give( "fas2_pp19" )
	end
}



 PESW["fas2_ak47"] = {
	Name = "АК47",
	Category = "Автоматы",
	Cost = 35000,

	SpawnFunction =	function( ply, self )
			ply:Give( "fas2_ak47" )
	end
}

PESW["fas2_vz58"] = {
	Name = "Vz 58",
	Category = "Автоматы",
	Cost = 35750,

	SpawnFunction =	function( ply, self )
			ply:Give( "fas2_vz58" )
	end
}

PESW["fas2_ak74u"] = {
	Name = "АК 74У",
	Category = "Автоматы",
	Cost = 36500,

	SpawnFunction =	function( ply, self )
			ply:Give( "fas2_ak74u" )
	end
}


PESW["fas2_rem870"] = {
	Name = "Remington 870",
	Category = "Дробовики",
	Cost = 8500,

	SpawnFunction =	function( ply, self )
			ply:Give( "fas2_rem870" )
	end
}


PESW["fas2_saiga12k"] = {
	Name = "Сайга 12К",
	Category = "Дробовики",
	Cost = 27500,

	SpawnFunction =	function( ply, self )
			ply:Give( "fas2_saiga12k" )
	end
}


PESW["fas2_m24"] = {
	Name = "М24",
	Category = "Винтовки",
	Cost = 27500,

	SpawnFunction =	function( ply, self )
			ply:Give( "fas2_m24" )
	end
}