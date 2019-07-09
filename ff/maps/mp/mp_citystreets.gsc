main()
{
	maps\mp\mp_citystreets_fx::main();
	maps\createart\mp_citystreets_art::main();
	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_citystreets");

	if(level.ex_ambient_track) ambientPlay("ambient_citystreets_day");
	VisionSetNaked( "mp_citystreets" );

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setdvar( "r_specularcolorscale", "1" );
	setdvar("compassmaxrange","2000");

	maps\mp\_explosive_barrels::main();

	if( getDvar("g_gametype") == "ctf")
	{	
		addobj("allied_flag", (5547, -865, 0), (0, 0, 0));
		addobj("axis_flag", (3167, 689, -16), (0, 0, 0));
	}

	if( getDvar("g_gametype") == "ctfb" )
	{	
		addobj("allied_flag", (5547, -865, 0), (0, 0, 0));
		addobj("axis_flag", (3167, 689, -16), (0, 0, 0));
	}
}

addobj(name, origin, angles)
{
   ent = spawn("trigger_radius", origin, 0, 48, 148);
   ent.targetname = name;
   ent.angles = angles;
}
