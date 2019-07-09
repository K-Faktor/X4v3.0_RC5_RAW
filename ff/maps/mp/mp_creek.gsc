#include maps\mp\_utility;
#include common_scripts\utility;

main()
{
	setExpFog(612, 25000, 0.613, 0.671, 0.75, 0);
	VisionSetNaked( "mp_creek", 0 );

	maps\mp\mp_creek_fx::main();

	maps\mp\_load::main();
	if(level.ex_ambient_track) ambientPlay("ambient_creek_ext0");
	
	maps\mp\_compass::setupMiniMap("compass_map_mp_creek");
	
	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	if( getDvar("g_gametype") == "ctf")
	{	
		addobj("allied_flag", (369, 4060, 31), (0, 0, 0));
		addobj("axis_flag", (-5090, 6968, 184), (0, 0, 0));
	}
	
	if(getDvar("g_gametype") == "ctfb")
	{	
		addobj("allied_flag", (369, 4060, 31), (0, 0, 0));
		addobj("axis_flag", (-5090, 6968, 184), (0, 0, 0));
	}
}

addobj(name, origin, angles)
{
   ent = spawn("trigger_radius", origin, 0, 48, 148);
   ent.targetname = name;
   ent.angles = angles;
}