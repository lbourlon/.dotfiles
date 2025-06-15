#include QMK_KEYBOARD_H
#include <ws2812.h>
#include <sendstring_french.h>
#include "gpio.h"
#include "images.h"

/*  LAYOUT
* const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
*  [L0] = LAYOUT(
*         KC_1, KC_1, KC_1, KC_1, KC_1, KC_1,       |       KC_1, KC_1, KC_1, KC_1, KC_1, KC_1,
*         KC_1, KC_1, KC_1, KC_1, KC_1, KC_1,       |       KC_1, KC_1, KC_1, KC_1, KC_1, KC_1,
*         KC_1, KC_1, KC_1, KC_1, KC_1, KC_1,       |       KC_1, KC_1, KC_1, KC_1, KC_1, KC_1,
*         KC_1, KC_1, KC_1, KC_1, KC_1, KC_1, KC_1, | KC_1, KC_1, KC_1, KC_1, KC_1, KC_1, KC_1,
*                     KC_1, KC_1, KC_1, KC_1, KC_1, | KC_1, KC_1, KC_1, KC_1, KC_1),
* }; */

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [0] = LAYOUT(MO(3), KC_1, KC_2, KC_3, KC_4, KC_5, KC_6, KC_7, KC_8, KC_9, KC_0, KC_DEL, KC_TAB, KC_Q, KC_W, KC_E, KC_R, KC_T, KC_Y, KC_U, KC_I, KC_O, KC_P, KC_RBRC, KC_ESC, KC_A, KC_S, KC_D, KC_F, KC_G, KC_H, KC_J, KC_K, KC_L, KC_SCLN, KC_QUOT, KC_LSFT, KC_Z, KC_X, KC_C, KC_V, KC_B, KC_MUTE, KC_PSCR, KC_N, KC_M, KC_COMM, KC_DOT, KC_SLSH, KC_RSFT, KC_LGUI, KC_LCTL, KC_LALT, MO(1), SC_SENT, KC_SPC, MO(2), KC_BSPC, KC_RCTL, KC_APP),
    [1] = LAYOUT(KC_TRNS, KC_F1, KC_F2, KC_F3, KC_F4, KC_F5, KC_F6, KC_F7, KC_F8, KC_F9, KC_F10, KC_F11, KC_TRNS, KC_NO, RALT(KC_2), RALT(KC_6), KC_NO, KC_NO, KC_3, RALT(KC_4), RALT(KC_EQL), RALT(KC_5), RALT(KC_MINS), KC_NO, KC_TRNS, KC_8, RALT(KC_3), RALT(KC_8), KC_RBRC, KC_NO, KC_4, KC_5, KC_MINS, KC_NUBS, LSFT(KC_NUBS), KC_LBRC, KC_CAPS, KC_NO, RALT(KC_9), RALT(KC_0), KC_NO, KC_NO, QK_BOOT, KC_TRNS, RALT(KC_7), LSFT(KC_EQL), KC_6, KC_EQL, KC_BSLS, KC_TRNS, KC_TRNS, OSM(MOD_LCTL), OSM(MOD_LCTL|MOD_LSFT), KC_NO, KC_TRNS, KC_TRNS, OSM(MOD_RALT), KC_DEL, KC_TRNS, KC_TRNS),
    [2] = LAYOUT(KC_NO, KC_NO, KC_NO, RGB_M_B, RGB_MOD, RGB_TOG, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, LCTL(KC_Z), KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_PGUP, KC_NO, KC_TRNS, KC_LALT, KC_LCTL, KC_LSFT, KC_NO, KC_CAPS, KC_LEFT, KC_DOWN, KC_UP, KC_RGHT, KC_PGDN, KC_NO, KC_TRNS, KC_NO, LCTL(KC_X), LCTL(KC_C), LCTL(KC_V), KC_NO, KC_TRNS, QK_BOOT, KC_NO, KC_HOME, KC_NO, KC_END, KC_NO, CW_TOGG, KC_TRNS, KC_TRNS, KC_TRNS, KC_NO, KC_TRNS, KC_TRNS, KC_NO, KC_TRNS, KC_TRNS, KC_TRNS),
    [3] = LAYOUT(KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, MS_LEFT, MS_DOWN, MS_UP, MS_RGHT, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, MS_BTN1, MS_BTN2, MS_BTN3, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO)
};

// set key to rgb color of the liatris
void housekeeping_task_user(void) {
    // rgblight_setrgb_at(RGB_BLACK, 0); // left
}

void set_backlight(void) {
#if BACKLIGHT_ENABLE
    ws2812_init(); // do not remove
    backlight_level_noeeprom(120);
    // backlight_enable();
    ws2812_set_color(0, 0, 0, 255);
    // ws2812_set_color_all(255, 255, 255);
    for (int i = 1; i < 22; ++i) {
        ws2812_set_color(i, 0, 255, 0);
    }
    // ws2812_set_color(1, 100, 211, 255);
    ws2812_flush();
#endif
}

void keyboard_pre_init_user(void) {
    // disable power LED power pin
    gpio_set_pin_output(24);
    gpio_write_pin_high(24);
}

void keyboard_post_init_user(void) {
    // Initialize onboard RGB to static white
}

