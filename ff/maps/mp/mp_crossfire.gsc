main()
{
	maps\mp\mp_crossfire_fx::main();
	maps\createart\mp_crossfire_art::main();
	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_crossfire");

	if(level.ex_ambient_track) ambientPlay("ambient_crossfire");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setdvar( "r_specularcolorscale", "1.85" );
	setdvar("compassmaxrange","2100");

	if( getDvar("g_gametype") == "ctf" )
	{	
		addobj("allied_flag", (3506, -552, -26), (0, 0, 0));
		addobj("axis_flag", (5848, -4505, -157), (0, 0, 0));
	}

	if( getDvar("g_gametype") == "ctfb" )
	{	
		addobj("allied_flag", (3506, -552, -26), (0, 0, 0));
		addobj("axis_flag", (5848, -4505, -157), (0, 0, 0));
	}
}

addobj(name, origin, angles)
{
   ent = spawn("trigger_radius", origin, 0, 48, 148);
   ent.targetname = name;
   ent.angles = angles;
}
