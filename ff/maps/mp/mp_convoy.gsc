main()
{
	maps\mp\mp_convoy_fx::main();
	maps\createart\mp_convoy_art::main();
	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_convoy");

	//setExpFog(800, 20000, 0.583, 0.631569, 0.553078, 0);

	if(level.ex_ambient_track) ambientPlay("ambient_convoy");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setdvar( "r_specularcolorscale", "1" );
	setdvar("compassmaxrange","2000");

	if( getDvar("g_gametype") == "ctf")
	{	
		addobj("allied_flag", (-2027, -432, -66), (0, 0, 0));
		addobj("axis_flag", (2340, 1090, -35), (0, 0, 0));
	}

	if(getDvar("g_gametype") == "ctfb")
	{	
		addobj("allied_flag", (-2027, -432, -66), (0, 0, 0));
		addobj("axis_flag", (2340, 1090, -35), (0, 0, 0));
	}
}

addobj(name, origin, angles)
{
   ent = spawn("trigger_radius", origin, 0, 48, 148);
   ent.targetname = name;
   ent.angles = angles;
}
