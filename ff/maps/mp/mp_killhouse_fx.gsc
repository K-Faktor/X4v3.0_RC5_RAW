main()
{
//	level._effect[ "wood" ]				 = loadfx( "explosions/grenadeExp_wood" );
//	level._effect[ "dust" ]				 = loadfx( "explosions/grenadeExp_dirt_1" );
//	level._effect[ "brick" ]			 = loadfx( "explosions/grenadeExp_concrete_1" );

	level._effect[ "paper_falling_burning" ]			= loadfx( "misc/paper_falling_burning" );
	level._effect[ "ground_smoke_launch_a" ]			= loadfx( "smoke/ground_smoke_launch_a" );
	level._effect[ "amb_dust_hangar" ]					= loadfx( "dust/amb_dust_hangar_mp" );
	level._effect[ "light_shaft_dust_large" ]			= loadfx( "dust/light_shaft_dust_large" );
	level._effect[ "light_shaft_dust_med" ]				= loadfx( "dust/light_shaft_dust_med" );

	if(level.ex_ambient_smoke)
	{	
		ent = maps\mp\_utility::createOneshotEffect( "ground_smoke_launch_a" );
     	ent.v[ "origin" ] = ( 496.461, 2137.29, 28.125 );
     	ent.v[ "angles" ] = ( 270, 0, 0 );
     	ent.v[ "fxid" ] = "ground_smoke_launch_a";
     	ent.v[ "delay" ] = -15;
 
     	ent = maps\mp\_utility::createOneshotEffect( "ground_smoke_launch_a" );
     	ent.v[ "origin" ] = ( 532.291, 920.723, 28.125 );
     	ent.v[ "angles" ] = ( 270, 0, 0 );
     	ent.v[ "fxid" ] = "ground_smoke_launch_a";
     	ent.v[ "delay" ] = -15;
 
     	ent = maps\mp\_utility::createOneshotEffect( "ground_smoke_launch_a" );
     	ent.v[ "origin" ] = ( 651.757, 1486.79, 40.125 );
     	ent.v[ "angles" ] = ( 270, 0, 0 );
     	ent.v[ "fxid" ] = "ground_smoke_launch_a";
     	ent.v[ "delay" ] = -15;
	}
	
	if(level.ex_ambient_dirt)
	{
		ent = maps\mp\_utility::createOneshotEffect( "amb_dust_hangar" );
     	ent.v[ "origin" ] = ( 634.754, 919.889, 248.125 );
     	ent.v[ "angles" ] = ( 270, 0, 0 );
     	ent.v[ "fxid" ] = "amb_dust_hangar";
     	ent.v[ "delay" ] = -15;
 
     	ent = maps\mp\_utility::createOneshotEffect( "amb_dust_hangar" );
     	ent.v[ "origin" ] = ( 693.875, 1471.26, 279.095 );
     	ent.v[ "angles" ] = ( 270, 0, 0 );
     	ent.v[ "fxid" ] = "amb_dust_hangar";
     	ent.v[ "delay" ] = -15;
 
     	ent = maps\mp\_utility::createOneshotEffect( "amb_dust_hangar" );
     	ent.v[ "origin" ] = ( 615.771, 2360.61, 303.114 );
     	ent.v[ "angles" ] = ( 270, 0, 0 );
     	ent.v[ "fxid" ] = "amb_dust_hangar";
     	ent.v[ "delay" ] = -15;
 
     	ent = maps\mp\_utility::createOneshotEffect( "amb_dust_hangar" );
     	ent.v[ "origin" ] = ( 546.383, 1868.54, 238.682 );
     	ent.v[ "angles" ] = ( 270, 0, 0 );
     	ent.v[ "fxid" ] = "amb_dust_hangar";
     	ent.v[ "delay" ] = -15;
	}
	
/#		
	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_killhouse_fx::main();
#/

}
