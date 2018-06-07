#ifndef __BUTTONS_H__
#define __BUTTONS_H__

extern void init_buttons(void);

/*	KEYA/BTNA	PC13
 *	KEYB/BTNB	PB2
 */

int btna_hit(void);
void btna_wait(void);
int btnb_hit(void);
void btnb_wait(void); 

#endif  // __BUTTONS_H__


