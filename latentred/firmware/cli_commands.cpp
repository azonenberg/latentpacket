/***********************************************************************************************************************
*                                                                                                                      *
* LATENTPACKET v0.1                                                                                                    *
*                                                                                                                      *
* Copyright (c) 2019 Andrew D. Zonenberg                                                                               *
* All rights reserved.                                                                                                 *
*                                                                                                                      *
* Redistribution and use in source and binary forms, with or without modification, are permitted provided that the     *
* following conditions are met:                                                                                        *
*                                                                                                                      *
*    * Redistributions of source code must retain the above copyright notice, this list of conditions, and the         *
*      following disclaimer.                                                                                           *
*                                                                                                                      *
*    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the       *
*      following disclaimer in the documentation and/or other materials provided with the distribution.                *
*                                                                                                                      *
*    * Neither the name of the author nor the names of any contributors may be used to endorse or promote products     *
*      derived from this software without specific prior written permission.                                           *
*                                                                                                                      *
* THIS SOFTWARE IS PROVIDED BY THE AUTHORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   *
* TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL *
* THE AUTHORS BE HELD LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES        *
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR       *
* BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT *
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE       *
* POSSIBILITY OF SUCH DAMAGE.                                                                                          *
*                                                                                                                      *
***********************************************************************************************************************/

#include "latentred.h"

//ALL of these lists MUST be sorted alphabetically or prefix matching will fail!

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Sub commands

//configure ...
const clikeyword_t g_configureCommands[] =
{
	{ "terminal",   CMD_TERMINAL,	NULL },

	//end of list
	{ NULL,			CMD_NULL,		NULL }
};

//copy running-config ...
const clikeyword_t g_copyDestsRun[] =
{
	{ "startup-config",		CMD_STARTUP_CONFIG,	NULL },

	//end of list
	{ NULL,					CMD_NULL,			NULL }
};

//copy startup-config ...
const clikeyword_t g_copyDestsStart[] =
{
	{ "running-config",		CMD_RUNNING_CONFIG,	g_copyDestsRun },

	//end of list
	{ NULL,					CMD_NULL,			NULL }
};

//copy...
const clikeyword_t g_copySources[] =
{
	{ "running-config",		CMD_RUNNING_CONFIG,	g_copyDestsRun },
	{ "startup-config",		CMD_STARTUP_CONFIG,	g_copyDestsStart },

	//end of list
	{ NULL,					CMD_NULL,			NULL }
};

//show interface ...
const clikeyword_t g_showInterfaceCommands[] =
{
	{ "status",  	CMD_STATUS,	NULL },

	//end of list
	{ NULL,			CMD_NULL,		NULL }
};

//show...
const clikeyword_t g_showCommands[] =
{
	{ "interface",			CMD_INTERFACE,		g_showInterfaceCommands },
	{ "hardware",			CMD_HARDWARE,		NULL },
	{ "running-config",		CMD_RUNNING_CONFIG,	NULL },
	{ "startup-config",		CMD_STARTUP_CONFIG,	NULL },
	{ "version",			CMD_VERSION,		NULL },

	//end of list
	{ NULL,					CMD_NULL,			NULL }
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Top level commands

//normal mode, not configuring anything
const clikeyword_t g_topCommands[] =
{
	{ "configure",	CMD_CONFIGURE,	g_configureCommands },
	{ "copy",		CMD_COPY,		g_copySources },
	{ "exit",		CMD_EXIT,		NULL },
	{ "show",		CMD_SHOW,		g_showCommands },

	//end of list
	{ NULL,			CMD_NULL,		NULL }
};
