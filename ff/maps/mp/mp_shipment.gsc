main()
{
	maps\mp\mp_shipment_fx::main();
	maps\createart\mp_shipment_art::main();
	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_shipment");

	if(level.ex_ambient_track) ambientPlay("ambient_middleeast_ext");

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setdvar("compassmaxrange","1400");
	
	if( getDvar("g_gametype") == "ctf")
	{	
		addobj("allied_flag", (-657, 291, 200), (0, 0, 0));
		addobj("axis_flag", (626, -111, 192), (0, 0, 0));
	}

	if(getDvar("g_gametype") == "ctfb")
	{	
		addobj("allied_flag", (-657, 291, 200), (0, 0, 0));
		addobj("axis_flag", (626, -111, 192), (0, 0, 0));
	}

}

addobj(name, origin, angles)
{
   ent = spawn("trigger_radius", origin, 0, 48, 148);
   ent.targetname = name;
   ent.angles = angles;
}