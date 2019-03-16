/* simple ADS7843 driver for STM32F103
 *
 *
 */

#include <string.h>
#include <stdio.h>
#include "ssd1289.h"
#include "FreeRTOS.h"
#include "task.h"

static void ads7843_calibration_draw_target(int x, int y, uint16_t color, uint16_t color_center);
#ifndef MINI_CALIB
static int draw_button(int x, int y, int size_x, int size_y, uint16_t fg, uint16_t bg, uint16_t textcolor, char *text);
static int ckeck_btn(int x, int y);
#endif // MINI_CALIB

#ifdef MINI_CALIB
int ads7843_calibration(void) {
    int tsx, tsy, calpt = 0, pressed;
    int cal_points[3][2] = { {40, 40},
                             {280, 120},
                             {320/2-1, 200} };
    int cal_data[3][2] =   { {-1, -1}, {-1, -1}, {-1, -1} };

    for(;;) {
        ads7843_calibration_draw_target(cal_points[calpt][0], cal_points[calpt][1], RGB_COL_MAGENTA, RGB_COL_WHITE);        
        pressed = ads7843_is_pressed();
        if(pressed) {
            tsx = ads7843_read_x();
            tsy = ads7843_read_y();
            ads7843_calibration_draw_target(cal_points[calpt][0], cal_points[calpt][1], RGB_COL_GREEN, RGB_COL_WHITE);
            cal_data[calpt][0] = tsx;
            cal_data[calpt][1] = tsy;
            calpt++;
            if(calpt == 3)
                break;
//             systick_delay(500);
            vTaskDelay(500/portTICK_RATE_MS); 
        } else {
//             systick_delay(50);
            vTaskDelay(50/portTICK_RATE_MS); 
        }
    }
    ads7843_set_caldata(cal_data, cal_points);

    for(calpt = 0; calpt < 3; calpt++)
        ads7843_calibration_draw_target(cal_points[calpt][0], cal_points[calpt][1], RGB_COL_BLACK, RGB_COL_BLACK);

    return 0;
}
#endif // MINI_CALIB

#ifndef MINI_CALIB
int ads7843_calibration(void) {
start_again:
    ssd1289_clear();

    int i;
    char str[41];
    int tsx;
    int tsy;
    uint32_t dx, dy;
    int pressed = 0;
    int calpt = 0;
    int dist_from_border = 40;
    int cal_points[3][2] = { {0+dist_from_border, 0+dist_from_border},
                             {319-dist_from_border, 120},
                             {320/2-1, 239-dist_from_border} };
    int cal_data[3][2] = { {-2, -2}, {-2, -2}, {-2, -2} };

    ssd1289_set_font(FONT_XGA_8x14);

    ssd1289_set_font_color(RGB_COL_YELLOW, RGB_COL_BLACK);
    ssd1289_set_transparency(FALSE);

    ssd1289_set_text_cursor(0, 0);
    ssd1289_putc(0xC9);     // top left corner
    for(i = 0; i < 38; i++)
        ssd1289_putc(0xCD); // top border
    ssd1289_putc(0xBB);     // top right corner

    ssd1289_set_text_cursor(0, 16);
    ssd1289_putc(0xC8);     // bottom left corner
    for(i = 0; i < 38; i++)
        ssd1289_putc(0xCD); // bottom border
    ssd1289_putc(0xBC); // bottom right corner

    ssd1289_set_text_cursor(7, 0);
    ssd1289_set_font_color(RGB_COL_CYAN, RGB_COL_BLACK);
    ssd1289_puts(" touchscreen  calibration ");

    ssd1289_set_font_color(RGB_COL_YELLOW, RGB_COL_BLACK);
    ssd1289_set_text_cursor(6, 0);
    ssd1289_putc('[');
    ssd1289_set_text_cursor(33, 0);
    ssd1289_putc(']');

    for(i = 1; i < 16; i++) {
        ssd1289_set_text_cursor(0, i);
        ssd1289_putc(0xBA);
        ssd1289_set_text_cursor(39, i);
        ssd1289_putc(0xBA);
    }

    ssd1289_set_font_color(RGB_COL_WHITE, RGB_COL_BLACK);
    ssd1289_set_text_cursor(4, 5);
    ssd1289_puts("press the middle of each target!");

    ssd1289_set_font_color(RGB_COL_GREY, RGB_COL_BLACK);
    ssd1289_set_text_cursor(5, 8);
    snprintf(str, 41, "TOP LEFT    %d/%d", cal_points[0][0], cal_points[0][1]);
    ssd1289_puts(str);
    ssd1289_set_text_cursor(5, 9);
    snprintf(str, 41, "TOP RIGHT  %d/%d", cal_points[1][0], cal_points[1][1]);
    ssd1289_puts(str);
    ssd1289_set_text_cursor(5, 10);
    snprintf(str, 41, "BOT MID.  %d/%d", cal_points[2][0], cal_points[2][1]);
    ssd1289_puts(str);

    ssd1289_set_font_color(RGB_COL_RED, RGB_COL_BLACK);
    ssd1289_set_text_cursor(24, 8);
    ssd1289_puts("[ ---/--- ]");
    ssd1289_set_text_cursor(24, 9);
    ssd1289_puts("[ ---/--- ]");
    ssd1289_set_text_cursor(24, 10);
    ssd1289_puts("[ ---/--- ]");

    for(;;) {
        ads7843_calibration_draw_target(cal_points[calpt][0], cal_points[calpt][1], RGB_COL_MAGENTA, RGB_COL_WHITE);        
        pressed = ads7843_is_pressed();
        if(pressed) {
            tsx = ads7843_read_x();
            tsy = ads7843_read_y();
            sprintf(str, "RAW X%03x  Y%03x", tsx, tsy);
            ssd1289_set_font_color(RGB_COL_GREEN, RGB_COL_BLACK);
            ssd1289_set_text_cursor(13, 3);
            ssd1289_puts(str);

            ssd1289_set_font_color(RGB_COL_GREEN, RGB_COL_BLACK);
            ssd1289_set_text_cursor(24, 8+calpt);
            snprintf(str, 41, "[ %03x/%03x ]", tsx, tsy);
            ssd1289_puts(str);

            ads7843_calibration_draw_target(cal_points[calpt][0], cal_points[calpt][1], RGB_COL_GREEN, RGB_COL_WHITE);
            cal_data[calpt][0] = tsx;
            cal_data[calpt][1] = tsy;
            calpt++;
            if(calpt == 3)
                break;
            vTaskDelay(500/portTICK_RATE_MS);  //systick_delay(500);
        } else {
            sprintf(str, "RAW X---  Y---");
            ssd1289_set_font_color(RGB_COL_RED, RGB_COL_BLACK);
            ssd1289_set_text_cursor(13, 3);
            ssd1289_puts(str);
            vTaskDelay(500/portTICK_RATE_MS); //systick_delay(50);

        }

    }

    ads7843_set_caldata(cal_data, cal_points);

    ssd1289_set_font_color(RGB_COL_WHITE, RGB_COL_BLACK);
    ssd1289_set_text_cursor(3, 5);
    ssd1289_puts("                                  ");

    ssd1289_set_font_color(RGB_COL_RED, RGB_COL_BLACK);
    ssd1289_set_text_cursor(13, 3);
    ssd1289_puts("              ");

    for(calpt = 0; calpt < 3; calpt++)
        ads7843_calibration_draw_target(cal_points[calpt][0], cal_points[calpt][1], RGB_COL_BLACK, RGB_COL_BLACK);

    ssd1289_set_font(FONT_XGA_8x16);
    ssd1289_set_font_color(RGB_COL_BLACK, RGB_COL_RED);
    ssd1289_set_text_cursor(3, 3);
    ssd1289_puts(" IF NO BUTTON TOUCHED IN 30 SECS, ");
    ssd1289_set_text_cursor(4, 4);
    ssd1289_puts(" CALIBRATION WILL BE RESTARTED. ");

    ssd1289_set_font_color(RGB_COL_BLACK, RGB_COL_MAGENTA);
    ssd1289_set_text_cursor(28, 3);

    vTaskDelay(750/portTICK_RATE_MS); 
//     systick_delay(750);
    ssd1289_puts("30");

    ssd1289_set_font(FONT_XGA_8x14);
    draw_button(4, 12, 10, 3, RGB_COL_CYAN, RGB_COL_BLUE, RGB_COL_WHITE, "   OK   ");
    draw_button(16, 12, 20, 3, RGB_COL_CYAN, RGB_COL_BLUE, RGB_COL_WHITE, " TEST TOUCHSCREEN ");

    int cnt = 3000; // 3000 = 30 secs
    ssd1289_set_font(FONT_XGA_8x16);
    ssd1289_set_font_color(RGB_COL_BLACK, RGB_COL_MAGENTA);
    for(;;) {
        ssd1289_set_text_cursor(28, 3);
        sprintf(str, "%02d", cnt/100);
        ssd1289_puts(str);

        if(ads7843_is_pressed()) {
            tsx = ads7843_read_x();
            tsy = ads7843_read_y();
            dx = ads7843_get_disp_x(tsx,tsy);
            dy = ads7843_get_disp_y(tsx,tsy);
            switch(ckeck_btn(dx, dy)) {
                case 0:
                    ssd1289_clear();
                    return 0;
                    break;
                case 1:
                    ssd1289_clear();
                    ads7843_calibration_test_paint();
                    return 0;
                    break;
            }
        }
        vTaskDelay(10/portTICK_RATE_MS); 
//         systick_delay(10);

        if(cnt == 0) {
            goto start_again;
            break;
        }
        cnt--;
    }
    ssd1289_set_font(FONT_XGA_8x14);
    return 0;
}
#endif // MINI_CALIB

int ads7843_calibration_test_paint() {
    uint16_t tsx, tsy, dx, dy, c;
#ifndef MINI_CALIB_TEST
    ssd1289_set_text_cursor(5, 3);
    ssd1289_puts("Draw something.....");
#endif // MINI_CALIB
    for(;;) {
        if(ads7843_is_pressed()) {
            tsx = ads7843_read_x();
            tsy = ads7843_read_y();
            dx = ads7843_get_disp_x(tsx,tsy);
            dy = ads7843_get_disp_y(tsx,tsy);
            c = 0x1234;
            ssd1289_setpx(dx, dy, c);
        }
    }
    return 0;
}

#ifndef MINI_CALIB
static int ckeck_btn(int x, int y) {
    int button_geom[2][4] = {
        { 4*8, 12*14, 14*8, 15*14 },    // ok button
        { 16*8, 12*14, 36*8, 15*14 }    // test button
    };

    if( x >= button_geom[0][0] && x <= button_geom [0][2] && y >= button_geom[0][1] && y <= button_geom[0][3] )
        return 0;
    if( x >= button_geom[1][0] && x <= button_geom [1][2] && y >= button_geom[1][1] && y <= button_geom[1][3] )
        return 1;

    return -1;
}
#endif // MINI_CALIB

#ifndef MINI_CALIB
static int draw_button(int x, int y, int size_x, int size_y, uint16_t fg, uint16_t bg, uint16_t textcolor, char *text) {
    int i;

    ssd1289_fill_rect((x*8)+4, (y*14)+4, (x*8)+(size_x*8), (y*14)+(size_y*14)-7, bg);
    ssd1289_set_transparency(1);
    ssd1289_set_font_color(fg, RGB_COL_BLACK);
    ssd1289_set_text_cursor(x, y);        // 14, 12
    ssd1289_putc(0xC9);     // top left corner
    for(i = 0; i < (size_x-2); i++) {
        ssd1289_putc(0xCD); // top border
    }
    ssd1289_putc(0xBB);     // top right corner

    ssd1289_set_text_cursor(x, y+size_y-1);
    ssd1289_putc(0xC8);     // bottom left corner
    for(i = 0; i < size_x-2; i++)
        ssd1289_putc(0xCD); // bottom border
    ssd1289_putc(0xBC); // bottom right corner

    for(i = y+1; i < (y+size_y-1); i++) {
            ssd1289_set_text_cursor(x, i);
            ssd1289_putc(0xBA);
            ssd1289_set_text_cursor(x+size_x-1, i);
            ssd1289_putc(0xBA);
    }
    ssd1289_set_transparency(0);
    ssd1289_set_text_cursor(x+1, y+1);
    ssd1289_set_font_color(textcolor, bg);
    ssd1289_puts(text);

    return 0;

}
#endif // MINI_CALIB


static void ads7843_calibration_draw_target(int x, int y, uint16_t color, uint16_t color_center) {
    ssd1289_circle(x, y, 17, color);
    ssd1289_circle(x, y, 16, color);
    ssd1289_circle(x, y, 10, color);
    ssd1289_circle(x, y, 9, color);

    ssd1289_line(x-21, y, x-2, y, color);
    ssd1289_line(x+3, y, x+22, y, color);
    ssd1289_line(x, y-21, x, y-2, color);
    ssd1289_line(x, y+3, x, y+22, color);

    ssd1289_setpx(x, y, color_center);
    return;
}
