/*******************************************************************************
 * File name: 		itoa.c
 * Description:		implementation of the missing itoa newlib function
 * Project: 		_Wzorzec
 * Target: 			LPC2478
 * Compiler: 		arm-none-eabi-gcc
 * Date: 			15-01-2011
 * Author: 			Freddie Chopin
 * Based on: 		---
 *******************************************************************************/

static void __reverse (char* start, char* end);

/*------------------------------------------------------------------------------
 function name:	itoa
 description:		converts signed integer to an char array. Valid 'base' in [2;16].
 						Only base == 10 values are treated as signed.
 parameters:		value for converting, the output buffer, conversion base
 returned value:	pointer to the output buffer
------------------------------------------------------------------------------*/
char* itoa (int value, char* buffer, int base)
{
	static const char digits [] = "0123456789ABCDEF";
	char* tmpBuffer = buffer;
	int sign = 0;
	int quot, rem;

	if ( (base >= 2) && (base <= 16) )					/* check if the base is valid */
	{
		if (base == 10 && (sign = value) <0) 		/* check base & sign of value in the tmp copy */
		{
			value = -value;
		}

		do										/* calculate quotient & reminder */
		{
			quot = value / base;
			rem = value % base;
			*buffer ++ = digits[rem];				/* append the reminder to the string */
		} while ((value = quot));

		if (sign < 0)							/* if negative value add a sign */
		{
			*buffer++ = '-';
		}

		__reverse(tmpBuffer, buffer - 1);		/* reverse the string */
	}

	*buffer = '\0';
	return tmpBuffer;
}

/*------------------------------------------------------------------------------
 function name:	__reverse
 description:		local function reversing order of a string
 parameters:		pointer to the beginning of a string, pointer to the end of a string
 returned value:	none
------------------------------------------------------------------------------*/

static void __reverse (char* start, char* end)
{
	char tmp;

	while (end > start)
	{
		tmp = *end;						/* save end of the string int tmp variable */
		*end-- = *start;				/* write to the end of the string its beginning */
		*start++ = tmp;				/* and write to the beginning stuff from tmp */
	}
}

/******************************************************************************
* END OF FILE
******************************************************************************/

