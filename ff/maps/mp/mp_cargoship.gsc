main()
{
	maps\mp\mp_cargoship_fx::main();
	maps\createart\mp_cargoship_art::main();
	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_cargoship");

	if(level.ex_ambient_track) ambientPlay("ambient_cargoshipmp_ext");

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	setdvar( "r_specularcolorscale", "1" );
	setdvar("compassmaxrange","2100");

	if( getDvar("g_gametype") == "ctf")
	{	
		addobj("allied_flag", (2323, -24, 16), (0, 0, 0));
		addobj("axis_flag", (-1972, -76, 16), (0, 0, 0));
	}

	if( getDvar("g_gametype") == "ctfb" )
	{	
		addobj("allied_flag", (2323, -24, 16), (0, 0, 0));
		addobj("axis_flag", (-1972, -76, 16), (0, 0, 0));
	}
}

addobj(name, origin, angles)
{
   ent = spawn("trigger_radius", origin, 0, 48, 148);
   ent.targetname = name;
   ent.angles = angles;
}
