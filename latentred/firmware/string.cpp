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

/**
	@brief Returns the length of a null terminated string
 */
int strlen(const char* str)
{
	int i=0;
	while(str[i] != 0)
		i++;
	return i;
}

/**
	@brief Copies a null terminated string to another one

	@return dst
 */
char* strncpy(char* dst, const char* src, size_t n)
{
	size_t i = 0;
	for(; i<n-1; i++)
	{
		dst[i] = src[i];
		if(src[i] == '\0')
			break;
	}
	for(; i<n; i++)
		dst[i] = '\0';
	return dst;
}

/**
	@brief Reverses a string in-place (K&R implementation)

	@param s Input
	@return s after reversing
 */
char* reverse(char* s)
{
	int i, j;
	char c;

	for (i = 0, j = strlen(s)-1; i<j; i++, j--)
	{
		c = s[i];
		s[i] = s[j];
		s[j] = c;
	}
	return s;
}

/**
	@brief Compares two null terminated strings

	@brief a string #1
	@brief b string #2

	@return >0 if a>b, <0 if a<b, 0 if a==b
 */
int strcmp(const char* a, const char* b)
{
	while(*a || *b)
	{
		if( (*a == 0) || (*a > *b) )
			return 1;
		if( (*b == 0) || (*a < *b) )
			return -1;
		a++;
		b++;
	}
	return 0;
}
