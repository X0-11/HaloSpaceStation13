#if !defined(using_map_DATUM)

	#include "innie_base_areas.dm"
	#include "innie_base2.dmm"
	#include "innie_base1.dmm"
	#include "UNSC_staging.dmm"
	#include "insurrection.dm"
	#include "insurrection_jobs.dm"
	#include "insurrection_outfits.dm"
	#include "insurrection_spawns.dm"

	#define using_map_DATUM /datum/map/innie_base

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring InnieBase

#endif
