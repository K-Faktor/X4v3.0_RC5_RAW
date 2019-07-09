main()
{
	maps\mp\mp_countdown_fx::main();
	maps\createart\mp_countdown_art::main();
	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_countdown");

	if(level.ex_ambient_track) ambientPlay("ambient_crossfire");

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	setdvar( "r_specularcolorscale", "1.5" );
	setdvar("compassmaxrange","2000");

	if( getDvar("g_gametype") == "ctf")
	{	
		addobj("allied_flag", (2236, 713, -8), (0, 0, 0));
		addobj("axis_flag", (-2158, 264, -16), (0, 0, 0));
	}
	
	if(getDvar("g_gametype") == "ctfb")
	{	
		addobj("allied_flag", (2236, 713, -8), (0, 0, 0));
		addobj("axis_flag", (-2158, 264, -16), (0, 0, 0));
	}
}

addobj(name, origin, angles)
{
   ent = spawn("trigger_radius", origin, 0, 48, 148);
   ent.targetname = name;
   ent.angles = angles;
}
