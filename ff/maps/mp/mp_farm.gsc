main()
{
	maps\mp\mp_farm_fx::main();
	maps\createart\mp_farm_art::main();
	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_farm");

	if(level.ex_ambient_track) ambientPlay("ambient_farm");
	
	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	setdvar( "r_specularcolorscale", "5" );
	setdvar("compassmaxrange","2000");

	if( getDvar("g_gametype") == "ctf")
	{	
		addobj("allied_flag", (1123, -880, 132), (0, 0, 0));
		addobj("axis_flag", (360, 3412, 220), (0, 0, 0));
	}

	if( getDvar("g_gametype") == "ctfb" )
	{	
		addobj("allied_flag", (1123, -880, 132), (0, 0, 0));
		addobj("axis_flag", (360, 3412, 220), (0, 0, 0));
	}
}

addobj(name, origin, angles)
{
   ent = spawn("trigger_radius", origin, 0, 48, 148);
   ent.targetname = name;
   ent.angles = angles;
}
