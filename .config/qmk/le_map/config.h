#pragma once


// #define WS2812_RGBW
#define SPLIT_LAYER_STATE_ENABLE
#define SPLIT_WPM_ENABLE


// backlight related
#if BACKLIGHT_ENABLE
#undef WS2812_LED_COUNT
#define WS2812_LED_COUNT 28
#define BACKLIGHT_ON_STATE 0
#undef BACKLIGHT_PIN
#define BACKLIGHT_PIN 1
#endif


#define ENABLE_COMPILE_KEYCODE
/* Enables these : 
 * KEY                Alias     Description
 * QK_BOOTLOADER      QK_BOOT   Put the keyboard into bootloader mode for flashing
 * QK_DEBUG_TOGGLE    DB_TOGG   Toggle debug mode
 * QK_CLEAR_EEPROM    EE_CLR    Reinitializes the keyboard's EEPROM (persistent memory)
 * QK_MAKE                      Sends qmk compile -kb (keyboard) -km (keymap), or qmk flash if shift is held. Puts keyboard into bootloader mode if shift & control are held
 * QK_REBOOT          QK_RBT    Resets the keyboard. Does not load the bootloader
 */
