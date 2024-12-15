; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  _   _   ___    _____  _   _  _____  _   _  ____   _____
; | \ | | / _ \  |  ___|| | | ||_   _|| | | ||  _ \ | ____|
; |  \| || | | | | |_   | | | |  | |  | | | || |_) ||  _|
; | |\  || |_| | |  _|  | |_| |  | |  | |_| ||  _ < | |___
; |_| \_| \___/  |_|     \___/   |_|   \___/ |_| \_\|_____|

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; .______        ___      .__   __.  __  ___
; |   _  \      /   \     |  \ |  | |  |/  /
; |  |_)  |    /  ^  \    |   \|  | |  '  /        _
; |   _  <    /  /_\  \   |  . `  | |    <       / _ \
; |  |_)  |  /  _____  \  |  |\   | |  .  \     | (_) |
; |______/  /__/     \__\ |__| \__| |__|\__\     \___/
;(C) 2024 By Steve Broad unless stated anywhere else in code


                        org 49152                       ; Build the code to run at $C000
                        dispto zeuspage(0)              ; But displace it
                        ;  dispto $10000
Addrs0:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Display instructions
DISPLAY_INSTRUCTIONS_0:
                        LD IX,START_MESSAGEA1_0         ;
                        CALL DISPLAY_STRING             ;
                        LD IX,SBCFAX_CONTROLS_TOP_0     ;
                        CALL DISPLAY_LARGE_TELETEXT_COMPRESSED_0 ; Display data
                        LD IX,SBCFAX_CONTROLS_BOTTOM_0  ;
                        CALL DISPLAY_LARGE_TELETEXT_COMPRESSED_0 ; Display data


                        LD A,(CONTROL)                  ; Get Keyboard/Joystick
                        CP 1                            ; Is it joystick selected?
                        JR Z,SKIP_DISPLAY_KEYBOARD_INSTRUCTIONS_0;
                        CP 2                            ; Is it joystick selected?
                        JR Z,SKIP_DISPLAY_KEYBOARD_INSTRUCTIONS_0;

                        LD IX,DISPLAY_INSTRUCTIONS_DATA1C_0 ;
                        CALL DISPLAY_STRING             ;
                        LD IX,DISPLAY_INSTRUCTIONS_DATA1C1_0 ;
                        CALL DISPLAY_STRING             ;
                        LD IX,DISPLAY_INSTRUCTIONS_DATA1C2_0 ;
                        CALL DISPLAY_STRING             ;
                        LD IX,DISPLAY_INSTRUCTIONS_DATA1C3_0 ;
                        CALL DISPLAY_STRING             ;
                        LD IX,DISPLAY_INSTRUCTIONS_DATA1C4_0 ;
                        CALL DISPLAY_STRING             ;
                        LD IX,DISPLAY_INSTRUCTIONS_DATA1C5_0 ;
                        CALL DISPLAY_STRING             ;



                        CALL DISPLAY_START_NEWS         ;
                        JP DISPLAY_WRITER_INSTRUCTIONS_0 ;



SKIP_DISPLAY_KEYBOARD_INSTRUCTIONS_0:

                        LD IX,DISPLAY_INSTRUCTIONS_DATA1B_0 ;
                        CALL DISPLAY_STRING             ;
                        LD IX,DISPLAY_INSTRUCTIONS_DATA1B1 ;
                        CALL DISPLAY_STRING             ;
                        CALL DISPLAY_START_NEWS         ;

DISPLAY_WRITER_INSTRUCTIONS_0:

                        LD IX,DISPLAY_INSTRUCTIONS_DATA2_0;
                        CALL DISPLAY_STRING             ;

                        LD B,4                          ; Time for Hi instructions to be displayed
C36326B_0:
                        PUSH BC                         ;
                       ; CALL CHANGE_HI_SCORE_SCREEN_COLOUR ; Change the table colours so they flash
                        POP BC                          ;
                        DJNZ C36326B_0                  ;
                        RET                             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Display Cockpit
DISPLAY_COCKPIT_0:


                        LD IX,COCKPIT_TOP_DATA_0        ; Cockpit graphic data
                        CALL DISPLAY_LARGE_GRAPHIC      ; Display data

                        LD IX,COCKPIT_BOTTOM_DATA_0     ;
                        CALL DISPLAY_LARGE_GRAPHIC      ; Display data

                        LD IX,COCKPIT_LEFT_DATA_0       ;
                        CALL DISPLAY_LARGE_GRAPHIC      ; Display data

                        LD IX,COCKPIT_LEFT_DATAB_0      ;
                        CALL DISPLAY_LARGE_GRAPHIC      ; Display data

                        LD IX,COCKPIT_LEFT_DATAC_0      ;
                        CALL DISPLAY_LARGE_GRAPHIC      ; Display data

                        LD IX,COCKPIT_RIGHT_DATA_0      ;
                        CALL DISPLAY_LARGE_GRAPHIC      ; Display data

                        LD IX,COCKPIT_RIGHT_DATAB_0     ;
                        CALL DISPLAY_LARGE_GRAPHIC      ; Display data

                        LD IX,COCKPIT_RIGHT_DATAC_0     ;
                        CALL DISPLAY_LARGE_GRAPHIC      ; Display data

                        LD DE,COCKPIT_TOP_ATTR_0        ;
                        LD HL,22528                     ; Start ATTR address for top left of screen
                        LD A,3*32                       ; 3 lines of ATTR
                        CALL COLOUR_COCKPIT_0           ;

                        LD DE,COCKPIT_BOTTOM_ATTR_0     ;
                        LD HL,22528+22*32               ; Start ATTR address for bottom left of screen where bottom border starts
                        LD A,2*32                       ; 2 lines of ATTR
                        CALL COLOUR_COCKPIT_0           ;

                        CALL COLOUR_COCKPIT_LEFT_RIGHT_0;

                        RET                             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Colour cockpit
COLOUR_COCKPIT_0:
                        LD B,A                          ;
DISPLAY_COCKPIT_ATTR_LOOP1_0:
                        LD A,(DE)                       ;
                        LD (HL),A                       ;
                        INC DE                          ;
                        INC HL                          ;
                        DJNZ DISPLAY_COCKPIT_ATTR_LOOP1_0;
                        RET                             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Add colour to cockpit left/right
COLOUR_COCKPIT_LEFT_RIGHT_0:
                        LD HL,22624                     ; Start ATTR address for top area of left collumn ATTR
                        LD IX,COCKPIT_LEFT_ATTR_0       ; Cockpit left ATTR data
                        LD IY,COCKPIT_RIGHT_ATTR_0      ; Cockpit right ATTR data
                        LD B,19                         ; 19 ATTR lines to colour
DISPLAY_COCKPIT_ATTR_LOOP2_0:
                        LD A,(IX+0)                     ; Get current left collumn ATTR data into A
                        LD (HL),A                       ; Set current ATTR to current data
                        LD A,(IX+1)                     ; Get current left collumn ATTR data into A
                        INC HL                          ; Move to next ATTR address
                        LD (HL),A                       ; Set current ATTR to current data
                        INC IX                          ;  Move to next left ATTR data
                        INC IX                          ;  Move to next left ATTR data

                        LD DE,29                        ; Setup DE for addition to move to right of screen ATTR
                        ADD HL,DE                       ; Add 29 to ATTR address to move to right of screen

                        LD A,(IY+0)                     ; Get current right collumn ATTR data into A
                        LD (HL),A                       ; Set current ATTR to current data
                        LD A,(IY+1)                     ; Get current right collumn ATTR data into A
                        INC HL                          ; Move to next ATTR address
                        LD (HL),A                       ; Set current ATTR to current data
                        INC HL                          ; Move to next ATTR address
                        INC IY                          ; Move to next right ATTR data
                        INC IY                          ; Move to next right ATTR data
                        DJNZ DISPLAY_COCKPIT_ATTR_LOOP2_0 ; Jump back until entire collumns are coloured

                        RET                             ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cockpit top graphics data
COCKPIT_TOP_DATA_0:

                        DEFW 16384                      ; Start address of graphics
                        DB 3,32                         ; 3 rows, 32 collumns
; Top status bar
                        defb 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 27, 49, 206, 112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 109, 156, 240, 0, 0, 0, 0, 0, 6, 192, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 24, 107, 110, 216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 109, 182, 176, 0, 0, 0, 0, 0, 6, 216, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 15, 107, 108, 216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 109, 182, 192, 0, 0, 0, 0, 0, 6, 216, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 3, 99, 108, 248, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 109, 190, 112, 0, 0, 0, 0, 0, 7, 216, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 27, 107, 108, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 101, 48, 48, 0, 0, 0, 0, 0, 6, 216, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 27, 107, 108, 216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 101, 54, 208, 0, 0, 0, 0, 0, 6, 216, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 14, 49, 204, 112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 103, 28, 240, 0, 0, 0, 0, 0, 6, 216, 0, 0, 0, 0, 0, 0, 0, 0;

; Top border
                        defb 0, 63, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 126, 170, 170, 170, 170, 170, 170, 170, 130, 23, 7;
                        defb 0, 255, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 126, 170, 170, 170, 170, 170, 170, 170, 199, 29, 15;
                        defb 3, 252, 255, 255, 255, 255, 255, 255, 127, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 239, 46, 29;
                        defb 7, 192, 255, 255, 255, 255, 255, 255, 143, 143, 255, 255, 143, 143, 255, 255, 143, 143, 255, 255, 143, 159, 255, 255, 31, 31, 255, 255, 31, 239, 58, 57;
                        defb 15, 3, 199, 17, 175, 175, 151, 85, 175, 175, 199, 17, 175, 175, 199, 17, 175, 175, 199, 17, 175, 227, 142, 35, 95, 95, 142, 35, 95, 239, 92, 113;
                        defb 30, 15, 208, 85, 223, 223, 151, 85, 143, 143, 208, 85, 143, 143, 208, 85, 143, 143, 208, 85, 143, 159, 160, 171, 31, 31, 160, 171, 31, 207, 116, 225;
                        defb 28, 63, 199, 17, 218, 223, 255, 255, 216, 223, 199, 17, 216, 223, 199, 17, 216, 223, 199, 17, 216, 255, 142, 35, 177, 191, 142, 35, 177, 222, 185, 193;
                        defb 56, 124, 255, 255, 218, 223, 255, 255, 218, 223, 255, 255, 218, 223, 255, 255, 218, 223, 255, 255, 218, 255, 255, 255, 181, 191, 255, 255, 181, 222, 235, 134;
                        defb 56, 240, 196, 113, 175, 213, 213, 101, 136, 209, 196, 113, 136, 209, 196, 113, 136, 209, 196, 113, 136, 243, 136, 227, 17, 163, 136, 227, 17, 222, 119, 27;
                        defb 113, 225, 213, 5, 175, 245, 213, 101, 175, 197, 213, 5, 175, 197, 213, 5, 175, 197, 213, 5, 175, 207, 170, 11, 95, 139, 170, 11, 95, 223, 222, 111;
                        defb 113, 199, 196, 113, 255, 255, 255, 255, 143, 241, 196, 113, 143, 241, 196, 113, 143, 241, 196, 113, 143, 243, 136, 227, 31, 227, 136, 227, 31, 159, 253, 189;
                        defb 115, 143, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 126, 170, 170, 170, 170, 170, 170, 170, 189, 190, 246;
                        defb 115, 158, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 126, 170, 170, 170, 170, 170, 170, 170, 188, 251, 216;
                        defb 103, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 239, 96;
                        defb 103, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 125, 128;
                        defb 31, 240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 124;

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cockpit bottom graphics data
COCKPIT_BOTTOM_DATA_0:
                        DEFW 20672                      ; Start address of graphics
                        DB 2,32                         ; 2 rows, 32 collumns
                        defb 127, 255, 255, 255, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 255;
                        defb 6, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 255, 255, 255, 255, 134, 255;
                        defb 27, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 251, 216;
                        defb 111, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 190, 246;
                        defb 191, 191, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 253, 189;
                        defb 254, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 222, 111;
                        defb 255, 239, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 247, 27;
                        defb 119, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 235, 134;
                        defb 155, 221, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 185, 193;
                        defb 143, 254, 255, 255, 196, 113, 255, 255, 196, 127, 245, 255, 136, 227, 255, 255, 136, 227, 255, 255, 255, 227, 255, 255, 136, 227, 255, 255, 136, 227, 244, 225;
                        defb 142, 250, 255, 255, 213, 5, 255, 255, 213, 103, 249, 255, 170, 11, 255, 255, 170, 11, 255, 249, 174, 43, 255, 255, 170, 11, 255, 255, 170, 11, 92, 113;
                        defb 159, 124, 255, 255, 196, 113, 255, 255, 196, 80, 7, 255, 136, 227, 255, 255, 136, 227, 255, 255, 168, 227, 255, 255, 136, 227, 255, 255, 136, 227, 58, 57;
                        defb 185, 244, 255, 255, 255, 255, 255, 255, 255, 231, 249, 255, 255, 255, 255, 255, 255, 255, 255, 249, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 46, 29;
                        defb 240, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 29, 15;
                        defb 224, 232, 85, 85, 85, 85, 255, 255, 255, 255, 255, 255, 255, 234, 170, 170, 255, 234, 170, 255, 255, 255, 255, 234, 170, 170, 170, 171, 250, 170, 23, 7;
                        defb 255, 112, 85, 85, 85, 85, 85, 85, 85, 84, 170, 170, 170, 255, 255, 255, 170, 170, 170, 170, 170, 170, 234, 170, 170, 170, 170, 170, 191, 250, 14, 255;

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cockpit left data
COCKPIT_LEFT_DATA_0:
                        DEFW 16480                      ; Start address of graphics
                        DB 5,2                          ; 6 rows, 2 collumns
                        defb 127, 254, 20, 136, 118, 174, 20, 136, 127, 222, 20, 216, 118, 222, 20, 136;
                        defb 125, 174, 29, 136, 125, 254, 20, 136, 118, 174, 20, 136, 127, 254, 31, 248;
                        defb 116, 206, 22, 24, 116, 206, 31, 248, 126, 62, 30, 184, 126, 62, 31, 248;
                        defb 127, 206, 28, 24, 125, 206, 20, 248, 118, 254, 20, 248, 127, 254, 31, 248;
                        defb 127, 254, 20, 136, 118, 174, 20, 136, 127, 222, 20, 216, 118, 222, 20, 136;

; Second half bottom of screen
COCKPIT_LEFT_DATAB_0:
                        DEFW 18432                      ; Start address of graphics
                        DB 8,2                          ; 6 rows, 2 collumns

                        defb 125, 174, 29, 136, 125, 254, 20, 136, 118, 174, 20, 136, 127, 254, 31, 248;
                        defb 116, 206, 22, 24, 116, 206, 31, 248, 126, 62, 30, 184, 126, 62, 31, 248;
                        defb 31, 248, 127, 254, 20, 136, 118, 174, 20, 136, 127, 222, 20, 216, 118, 222;
                        defb 127, 254, 182, 115, 181, 173, 135, 109, 182, 237, 181, 237, 180, 51, 255, 255;
                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;
                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;
                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;
                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;

COCKPIT_LEFT_DATAC_0:
                        DEFW 20480                      ; Start address of graphics
                        DB 6,2                          ; 6 rows, 2 collumns

                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;
                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;
                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;
                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;
                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;
                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cockpit right data
COCKPIT_RIGHT_DATA_0:
                        DEFW 16480+30                   ; Start address of graphics
                        DB 5,2                          ; 6 rows, 2 collumns
                        defb 15, 254, 63, 252, 127, 248, 63, 128, 96, 56, 7, 252, 127, 254, 125, 174;
                        defb 24, 136, 122, 222, 24, 216, 127, 222, 24, 136, 122, 174, 24, 136, 127, 254;
                        defb 31, 248, 105, 142, 12, 40, 105, 142, 31, 248, 126, 62, 30, 184, 126, 62;
                        defb 31, 248, 105, 254, 12, 24, 105, 222, 31, 136, 127, 174, 31, 136, 127, 254;
                        defb 31, 248, 127, 254, 24, 136, 122, 174, 24, 136, 125, 254, 29, 136, 125, 174;

; Second half bottom of screen
COCKPIT_RIGHT_DATAB_0:
                        DEFW 18432+30                   ; Start address of graphics
                        DB 8,2                          ; 8 rows, 2 collumns
                        defb 24, 136, 122, 222, 24, 216, 127, 222, 24, 136, 122, 174, 24, 136, 127, 254;
                        defb 31, 248, 105, 142, 12, 40, 105, 142, 31, 248, 127, 254, 31, 248, 127, 254;
                        defb 127, 255, 31, 252, 127, 255, 28, 204, 127, 255, 28, 204, 127, 255, 31, 252;
                        defb 127, 254, 249, 207, 246, 183, 246, 239, 246, 223, 246, 191, 249, 135, 255, 255;
                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;
                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;
                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;
                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;

; Second half bottom of screen
COCKPIT_RIGHT_DATAC_0:
                        DEFW 20480+30                   ; Start address of graphics
                        DB 6,2                          ; 6 rows, 2 collumns
                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;
                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;
                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;
                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;
                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;
                        defb 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3, 192, 3;
                        ; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cockpit top ATTR data
COCKPIT_TOP_ATTR_0:
; Status bar ATTR
                        defb 66, 66, 66, 66, 70, 70, 70, 70, 70, 70, 70, 70, 70, 66, 66, 66, 66, 70, 70, 70, 70, 70, 66, 66, 70, 70, 70, 70, 70, 70, 70, 70;


; Top border ATTR
                        defb 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69;
                        defb 69, 69, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 69, 69;


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                        ; Cockpit bottom ATTR data
COCKPIT_BOTTOM_ATTR_0:
                        defb 65, 65, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 65;
                        defb 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1;

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cockpit left ATTR data
COCKPIT_LEFT_ATTR_0:
                        defb 1, 65, 1, 65, 1, 65, 1, 65, 1, 65, 1, 65, 1, 65, 1, 65;
                        defb 69, 69, 61, 125, 61, 125, 61, 125, 61, 125, 61, 125, 61, 125, 61, 125;
                        defb 61, 125, 61, 125, 61, 125  ;

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cockpit right ATTR data
COCKPIT_RIGHT_ATTR_0:
                        defb 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 67, 67, 59, 123, 59, 123, 59, 123, 59, 123, 59, 123, 59, 123, 59, 123;
                        defb 59, 123, 59, 123, 59, 123  ;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ; BEEPER assembly listing... v3.2: 19th August 2010 By Karl McNeil
MUSIC_0:
                        LD A,(MININOTE)                 ;
                        ; Our integer notes are multiples of
                        ; (1/51)...
                        ; Add to this to speed up the Tempo!

                        CALL $2D28                      ; Push A onto Calc Stack via Rom routine
                        RST $28                         ; use the floating point calculator
                        DEFB $A1                        ; stk_one
                        DEFB $01                        ; exchange
                        DEFB $05                        ; division
                        DEFB $C3                        ; Store_M3
                        DEFB $02                        ; Delete
                        DEFB $38                        ; end-calc

                        LD A,(PITCH)                    ;
                        ; Default is 60, but this can be
                        ; changed to move music into a
                        ; a different key, in case a note is
                        ; too high or low to keep music in range

                        CALL $2D28                      ; Push A onto Calc Stack via Rom routine
                        RST $28                         ; use the floating point calculator
                        DEFB $C4                        ; Store_M4
                        DEFB $02                        ; Delete
                        DEFB $38                        ; end-calc

        ; Pitch offset is now stored in M4

restore_notes:

                        LD HL,NOTES                     ;

read_notes_loop:

                        LD A,(HL)                       ;
                        AND A                           ; (Zero is the end marker for the note data)
                        JP Z,restore_notes              ; If duration byte is 0, then do this! (Loop or Exit)...

                        LD B,A                          ;
                        INC HL                          ;

                        LD C,(HL)                       ;
                        INC HL                          ;

CheckKey:
                        xor a                           ;
                        in a, ($fe)                     ;
                        cpl                             ;
                        and %00011111                   ;
                        RET nz                          ; EXIT routine if key is pressed

                        PUSH HL                         ;
                        CALL BEEPIT                     ; BC is set, so now Play note...
                        POP HL                          ;

                        JP read_notes_loop              ;

BEEPIT:
        ; Input BC = B=Duration, C=Pitch
        ; Output Action: Beeps note using the ROM beeper routine...
        ; Duration will be a multiple of our mini-unit
        ; (Default mini-unit is usually 5/255 = 1/51)...
        ; To convert a Basic BEEP duration into our assembled value,
        ; Assembled Duration = INT(Basic duration in Sec / (1/51) )
        ; Our pitch will be the same as BASIC but with 60 added
        ; This avoids messing with negative numbers while storing data


        ; now to push Our duration Value and multiple
                        PUSH BC                         ;

                        LD A,B                          ;
                        CALL $2D28                      ; Push A onto Calc Stack via Rom routine: Duraton (B)
                        RST $28                         ; use the floating point calculator
                        DEFB $E3                        ; Recall_M3
                        DEFB $04                        ; multiple
                        DEFB $38                        ; end-calc

                        POP BC                          ;

                        LD A,C                          ;
                        CALL $2D28                      ; Push A onto Calc Stack via Rom routine: Pitch (C)
                        RST $28                         ; use the floating point calculator
                        DEFB $E4                        ; Recall Pitch offset from M4 Memory
                        DEFB $03                        ; subtract
                        DEFB $38                        ; end-calc

        ; Currect duration & pitch value now on calc stack and ready

                        JP $03F8                        ; Entry point for BEEP
                        RET                             ;

PITCH:
                        DEFB 60 + (0)                   ;
        ; The number in brackets shifts the music key up or down
        ; Add 12 to move music down an octive, -12 to move music up octive.
MININOTE:
                        DEFB 51 + (0)                   ;
        ; 1st Number above is MiniNote: durations are multiples of 1/51
        ; 2nd Number is Tempo offset, added while playing...
NOTES:

                        DEFB 11,48,10,48,5,60,5,55      ;
                        DEFB 10,48,5,60,5,55,10,48      ;
                        DEFB 5,60,5,55,5,48,5,48        ;
                        DEFB 5,55,5,60,10,48,5,60       ;
                        DEFB 5,55,10,48,5,60,5,55       ;
                        DEFB 10,48,5,60,5,55,5,48       ;
                        DEFB 5,48,5,55,5,60,10,48       ;
                        DEFB 5,60,5,55,10,48,5,60       ;
                        DEFB 5,55,10,48,5,60,5,55       ;
                        DEFB 5,48,5,48,5,55,5,60        ;
                        DEFB 10,48,5,60,5,55,10,48      ;
                        DEFB 5,60,5,55,10,48,5,60       ;
                        DEFB 5,55,5,48,5,48,5,55        ;
                        DEFB 5,60,10,48,5,60,5,55       ;
                        DEFB 10,48,5,60,5,55,10,48      ;
                        DEFB 5,60,5,55,5,48,5,48        ;
                        DEFB 5,55,5,60,10,48,5,60       ;
                        DEFB 5,55,10,48,5,60,5,55       ;
                        DEFB 10,48,5,60,5,55,5,48       ;
                        DEFB 5,48,5,55,5,60,10,48       ;
                        DEFB 5,60,5,55,5,48,5,48        ;
                        DEFB 5,55,5,60,10,46,5,58       ;
                        DEFB 5,53,5,46,5,46,5,53        ;
                        DEFB 5,58,10,44,5,56,5,51       ;
                        DEFB 5,44,5,44,5,51,5,56        ;
                        DEFB 10,48,5,60,5,53,5,48       ;
                        DEFB 5,48,5,53,5,60,10,48       ;
                        DEFB 5,60,5,55,10,48,5,60       ;
                        DEFB 5,55,10,48,5,60,5,55       ;
                        DEFB 5,48,5,48,5,55,5,60        ;
                        DEFB 10,48,5,60,5,55,10,48      ;
                        DEFB 5,60,5,55,10,48,5,60       ;
                        DEFB 5,55,5,48,5,48,5,55        ;
                        DEFB 5,60,10,48,5,60,5,55       ;
                        DEFB 5,48,5,48,5,55,5,60        ;
                        DEFB 10,46,5,58,5,53,5,46       ;
                        DEFB 5,46,5,53,5,58,10,44       ;
                        DEFB 5,56,5,51,5,44,5,44        ;
                        DEFB 5,51,5,56,10,51,5,63       ;
                        DEFB 5,58,5,51,5,51,5,58        ;
                        DEFB 5,63,10,51,5,63,5,58       ;
                        DEFB 10,51,5,63,5,58,10,51      ;
                        DEFB 5,63,5,58,5,51,5,51        ;
                        DEFB 5,58,5,63,10,51,5,63       ;
                        DEFB 5,58,10,51,5,63,5,58       ;
                        DEFB 10,51,5,63,5,58,5,51       ;
                        DEFB 5,51,5,58,5,63,10,55       ;
                        DEFB 5,67,5,62,5,55,5,55        ;
                        DEFB 5,62,5,67,10,53,5,65       ;
                        DEFB 5,60,5,53,5,53,5,60        ;
                        DEFB 5,65,10,51,5,63,5,58       ;
                        DEFB 5,51,5,51,5,58,5,63        ;
                        DEFB 10,51,5,63,5,58,5,51       ;
                        DEFB 5,51,5,58,5,63,10,51       ;
                        DEFB 5,63,5,58,10,51,5,63       ;
                        DEFB 5,58,10,51,5,63,5,58       ;
                        DEFB 5,51,5,51,5,58,5,63        ;
                        DEFB 10,51,5,63,5,58,10,51      ;
                        DEFB 5,63,5,58,10,51,5,63       ;
                        DEFB 5,58,5,51,5,51,5,58        ;
                        DEFB 5,63,10,55,5,67,5,62       ;
                        DEFB 5,55,5,55,5,62,5,67        ;
                        DEFB 10,53,5,65,5,60,5,53       ;
                        DEFB 5,53,5,60,5,65,10,51       ;
                        DEFB 5,63,5,58,5,51,5,51        ;
                        DEFB 5,58,5,63,10,48,5,60       ;
                        DEFB 5,55,5,48,5,48,5,55        ;
                        DEFB 5,60,10,48,5,60,5,55       ;
                        DEFB 10,48,5,60,5,55,10,48      ;
                        DEFB 5,60,5,55,5,48,5,48        ;
                        DEFB 5,55,5,60,10,48,5,60       ;
                        DEFB 5,55,10,48,5,60,5,55       ;
                        DEFB 10,48,5,60,5,55,5,48       ;
                        DEFB 5,48,5,55,5,60,10,48       ;
                        DEFB 5,60,5,55,5,48,5,48        ;
                        DEFB 5,55,5,60,10,46,5,58       ;
                        DEFB 5,53,5,46,5,46,5,53        ;
                        DEFB 5,58,10,44,5,56,5,51       ;
                        DEFB 5,44,5,44,5,51,5,56        ;
                        DEFB 10,48,5,60,5,53,5,48       ;
                        DEFB 5,48,5,53,5,60,10,48       ;
                        DEFB 5,60,5,55,10,48,5,60       ;
                        DEFB 5,55,10,48,5,60,5,55       ;
                        DEFB 5,48,5,48,5,55,5,60        ;
                        DEFB 10,48,5,60,5,55,10,48      ;
                        DEFB 5,60,5,55,10,48,5,60       ;
                        DEFB 5,55,5,48,5,48,5,55        ;
                        DEFB 5,60,10,48,5,60,5,55       ;
                        DEFB 5,48,5,48,5,55,5,60        ;
                        DEFB 10,46,5,58,5,53,5,46       ;
                        DEFB 5,46,5,53,5,58,10,44       ;
                        DEFB 5,56,5,51,5,44,5,44        ;
                        DEFB 5,51,5,56,10,51,5,63       ;
                        DEFB 5,58,5,51,5,51,5,58        ;
                        DEFB 5,63,10,51,5,63,5,58       ;
                        DEFB 10,51,5,63,5,58,10,51      ;
                        DEFB 5,63,5,58,5,51,5,51        ;
                        DEFB 5,58,5,63,10,51,5,63       ;
                        DEFB 5,58,10,51,5,63,5,58       ;
                        DEFB 10,51,5,63,5,58,5,51       ;
                        DEFB 5,51,5,58,5,63,10,55       ;
                        DEFB 5,67,5,62,5,55,5,55        ;
                        DEFB 5,62,5,67,10,53,5,65       ;
                        DEFB 5,60,5,53,5,53,5,60        ;
                        DEFB 5,65,10,51,5,63,5,58       ;
                        DEFB 5,51,5,51,5,58,5,63        ;
                        DEFB 10,51,5,63,5,58,5,51       ;
                        DEFB 5,51,5,58,5,63,10,51       ;
                        DEFB 5,63,5,58,10,51,5,63       ;
                        DEFB 5,58,10,51,5,63,5,58       ;
                        DEFB 5,51,5,51,5,58,5,63        ;
                        DEFB 10,51,5,63,5,58,10,51      ;
                        DEFB 5,63,5,58,10,51,5,63       ;
                        DEFB 5,58,5,51,5,51,5,58        ;
                        DEFB 5,63,10,55,5,67,5,62       ;
                        DEFB 5,55,5,55,5,62,5,67        ;
                        DEFB 10,53,5,65,5,60,5,53       ;
                        DEFB 5,53,5,60,5,65,10,51       ;
                        DEFB 5,63,5,58,5,51,5,51        ;
                        DEFB 5,58,5,63,10,48,5,60       ;
                        DEFB 5,55,5,48,5,48,5,55        ;
                        DEFB 10,60,5,79,5,84,5,87       ;
                        DEFB 5,91,5,87,5,84,10,79       ;
                        DEFB 5,79,5,84,5,87,5,91        ;
                        DEFB 5,87,5,84,10,79,5,79       ;
                        DEFB 5,84,5,87,5,91,5,87        ;
                        DEFB 5,84,10,79,5,79,5,84       ;
                        DEFB 5,87,5,91,5,87,5,84        ;
                        DEFB 10,79,5,79,5,84,5,87       ;
                        DEFB 5,91,5,87,5,84,10,77       ;
                        DEFB 5,77,5,82,5,86,5,89        ;
                        DEFB 5,86,5,82,10,75,5,75       ;
                        DEFB 5,80,5,84,5,87,5,84        ;
                        DEFB 5,75,10,72,5,79,5,84       ;
                        DEFB 5,87,5,91,5,87,5,84        ;
                        DEFB 10,79,5,79,5,84,5,87       ;
                        DEFB 5,91,5,87,5,84,10,79       ;
                        DEFB 5,79,5,84,5,87,5,91        ;
                        DEFB 5,87,5,84,10,79,5,79       ;
                        DEFB 5,84,5,87,5,91,5,87        ;
                        DEFB 5,84,10,79,5,79,5,84       ;
                        DEFB 5,87,5,91,5,87,5,84        ;
                        DEFB 10,79,5,79,5,84,5,87       ;
                        DEFB 5,91,5,87,5,84,10,77       ;
                        DEFB 5,77,5,82,5,86,5,89        ;
                        DEFB 5,86,5,82,10,75,5,75       ;
                        DEFB 5,80,5,84,5,87,5,84        ;
                        DEFB 5,75,10,72,5,79,5,84       ;
                        DEFB 5,87,5,91,5,87,5,84        ;
                        DEFB 10,79,5,82,5,87,5,91       ;
                        DEFB 5,94,5,91,5,87,10,82       ;
                        DEFB 5,82,5,87,5,91,5,94        ;
                        DEFB 5,91,5,87,10,82,5,82       ;
                        DEFB 5,87,5,91,5,94,5,91        ;
                        DEFB 5,87,10,82,5,82,5,87       ;
                        DEFB 5,91,5,94,5,91,5,87        ;
                        DEFB 10,82,5,86,5,91,5,94       ;
                        DEFB 5,98,5,94,5,91,10,86       ;
                        DEFB 5,84,5,89,5,93,5,96        ;
                        DEFB 5,93,5,89,10,84,5,82       ;
                        DEFB 5,87,5,91,5,94,5,91        ;
                        DEFB 5,82,10,79,5,82,5,87       ;
                        DEFB 5,91,5,94,5,91,5,87        ;
                        DEFB 10,82,5,82,5,87,5,91       ;
                        DEFB 5,94,5,91,5,87,10,82       ;
                        DEFB 5,82,5,87,5,91,5,94        ;
                        DEFB 5,91,5,87,10,82,5,82       ;
                        DEFB 5,87,5,91,5,94,5,91        ;
                        DEFB 5,87,10,82,5,82,5,87       ;
                        DEFB 5,91,5,94,5,91,5,87        ;
                        DEFB 10,82,5,86,5,91,5,94       ;
                        DEFB 5,98,5,94,5,91,10,86       ;
                        DEFB 5,84,5,89,5,93,5,96        ;
                        DEFB 5,93,5,89,10,84,5,82       ;
                        DEFB 5,87,5,91,5,94,5,91        ;
                        DEFB 5,82,10,79,5,82,5,87       ;
                        DEFB 5,91,1,96,4,48,5,48        ;
                        DEFB 5,55,5,60,10,48,5,60       ;
                        DEFB 5,55,10,48,5,60,5,55       ;
                        DEFB 10,48,5,60,5,55,5,48       ;
                        DEFB 5,48,5,55,5,60,10,48       ;
                        DEFB 5,60,5,55,10,48,5,60       ;
                        DEFB 5,55,10,48,5,60,5,55       ;
                        DEFB 5,48,5,48,5,55,5,60        ;
                        DEFB 10,48,5,60,5,55,5,48       ;
                        DEFB 5,48,5,55,5,60,10,46       ;
                        DEFB 5,58,5,53,5,46,5,46        ;
                        DEFB 5,53,5,58,10,44,5,56       ;
                        DEFB 5,51,5,44,5,44,5,51        ;
                        DEFB 5,56,10,48,5,60,5,53       ;
                        DEFB 5,48,5,48,5,53,5,60        ;
                        DEFB 10,48,5,60,5,55,10,48      ;
                        DEFB 5,60,5,55,10,48,5,60       ;
                        DEFB 5,55,5,48,5,48,5,55        ;
                        DEFB 5,60,10,48,5,60,5,55       ;
                        DEFB 10,48,5,60,5,55,10,48      ;
                        DEFB 5,60,5,55,5,48,5,48        ;
                        DEFB 5,55,5,60,10,48,5,60       ;
                        DEFB 5,55,5,48,5,48,5,55        ;
                        DEFB 5,60,10,46,5,58,5,53       ;
                        DEFB 5,46,5,46,5,53,5,58        ;
                        DEFB 10,44,5,56,5,51,5,44       ;
                        DEFB 5,44,5,51,5,56,10,51       ;
                        DEFB 5,63,5,58,5,51,5,51        ;
                        DEFB 5,58,5,63,10,51,5,63       ;
                        DEFB 5,58,10,51,5,63,5,58       ;
                        DEFB 10,51,5,63,5,58,5,51       ;
                        DEFB 5,51,5,58,5,63,10,51       ;
                        DEFB 5,63,5,58,10,51,5,63       ;
                        DEFB 5,58,10,51,5,63,5,58       ;
                        DEFB 5,51,5,51,5,58,5,63        ;
                        DEFB 10,55,5,67,5,62,5,55       ;
                        DEFB 5,55,5,62,5,67,10,53       ;
                        DEFB 5,65,5,60,5,53,5,53        ;
                        DEFB 5,60,5,65,10,51,5,63       ;
                        DEFB 5,58,5,51,5,51,5,58        ;
                        DEFB 5,63,10,51,5,63,5,58       ;
                        DEFB 5,51,5,51,5,58,5,63        ;
                        DEFB 10,51,5,63,5,58,10,51      ;
                        DEFB 5,63,5,58,10,51,5,63       ;
                        DEFB 5,58,5,51,5,51,5,58        ;
                        DEFB 5,63,10,51,5,63,5,58       ;
                        DEFB 10,51,5,63,5,58,10,51      ;
                        DEFB 5,63,5,58,5,51,5,51        ;
                        DEFB 5,58,5,63,10,55,5,67       ;
                        DEFB 5,62,5,55,5,55,5,62        ;
                        DEFB 5,67,10,53,5,65,5,60       ;
                        DEFB 5,53,5,53,5,60,5,65        ;
                        DEFB 10,51,5,63,5,58,5,51       ;
                        DEFB 5,51,5,58,5,63,10,48       ;
                        DEFB 5,60,5,55,5,48,5,48        ;
                        DEFB 5,55,5,60,10,48,5,60       ;
                        DEFB 5,55,10,48,5,60,5,55       ;
                        DEFB 10,48,5,60,5,55,5,48       ;
                        DEFB 5,48,5,55,5,60,10,48       ;
                        DEFB 5,60,5,55,10,48,5,60       ;
                        DEFB 5,55,10,48,5,60,5,55       ;
                        DEFB 5,48,5,48,5,55,5,60        ;
                        DEFB 10,48,5,60,5,55,5,48       ;
                        DEFB 5,48,5,55,5,60,10,46       ;
                        DEFB 5,58,5,53,5,46,5,46        ;
                        DEFB 5,53,5,58,10,44,5,56       ;
                        DEFB 5,51,5,44,5,44,5,51        ;
                        DEFB 5,56,10,48,5,60,5,53       ;
                        DEFB 5,48,5,48,5,53,5,60        ;
                        DEFB 10,48,5,60,5,55,10,48      ;
                        DEFB 5,60,5,55,10,48,5,60       ;
                        DEFB 5,55,5,48,5,48,5,55        ;
                        DEFB 5,60,10,48,5,60,5,55       ;
                        DEFB 10,48,5,60,5,55,10,48      ;
                        DEFB 5,60,5,55,5,48,5,48        ;
                        DEFB 5,55,5,60,10,48,5,60       ;
                        DEFB 5,55,5,48,5,48,5,55        ;
                        DEFB 5,60,10,46,5,58,5,53       ;
                        DEFB 5,46,5,46,5,53,5,58        ;
                        DEFB 10,44,5,56,5,51,5,44       ;
                        DEFB 5,44,5,51,5,56,10,48       ;
                        DEFB 5,60,5,55,10,48,5,60       ;
                        DEFB 5,55,10,48,5,60,5,55       ;
                        DEFB 5,48,5,48,5,55,5,60        ;
                        DEFB 10,48,5,60,5,55,10,48      ;
                        DEFB 5,60,5,55,10,48,5,60       ;
                        DEFB 5,55,5,48,5,48,5,55        ;
                        DEFB 5,60,10,48,5,60,5,55       ;
                        DEFB 10,48,5,60,5,55,10,48      ;
                        DEFB 5,60,5,55,5,48,5,48        ;
                        DEFB 5,55,5,60,10,48,5,51       ;
                        DEFB 5,55,10,48,5,51,5,55       ;
                        DEFB 10,48,5,51,5,55,10,48      ;
                        DEFB 5,51,5,55,10,48,5,51       ;
                        DEFB 5,55,10,48,5,51,5,55       ;
                        DEFB 43,48,43,48,43,48,43,48    ;
                        DEFB 71,36,0                    ;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                        ;    DEFW 22658
                        ;    DEFW 16514                      ; Start address of graphics
                        ;    DEFB 4,8                         ; 4 rows, 8 collumns
                        ;    DEFB 28         ;28 collumns to add
                        ;    DEFB 121        ; Colour bright white on blue


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Colour Ceefax title
COLOUR_SBCFAX_ATTR_ADDRESS_0:LD HL,0                    ; Set ATTR address
COLOUR_SBCFAX_TITLE_0:

                        LD B,4                          ; 4 text rows to colour
COLOUR_SBCFAX_TITLE_LOOP_0:

                        LD A,28                         ; 28 collumns
COLOUR_SBCFAX_TITLE_LOOP2_0:
                        PUSH AF                         ; Save collumns loop

SBCFAX_COLOUR_0:
                        LD A,0                          ; Get colour
                        LD (HL),A                       ; Place ATTR to screen
                        INC HL                          ;

                        POP AF                          ; Restore collumns loop
                        DEC A                           ; Take 1 from collumns loop
                        JR NZ,COLOUR_SBCFAX_TITLE_LOOP2_0 ; Complete collumn

                        PUSH DE                         ; Save DE
                        XOR D                           ; D=0
                        ; LD D,0
COLLUMNS_TO_ADD_0:      LD E,4                          ; Setup DE for addition
                        ADD HL,DE                       ; Add 5 addresses to ATTR address for next line
                        POP DE                          ; Restore ATTR pointer
                        DJNZ COLOUR_SBCFAX_TITLE_LOOP_0 ;

                        RET                             ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                        ; DEFW 22666                        ; Start ATTR address
                        ; DEFW 16514+8                      ; Start address of graphics
                        ; DEFB 1,20                         ; 1 rows, 20 collumns
                        ; DEFB 0;12                          ;0 collumns to add
                        ; DEFB 121        ; Colour bright white on blue

                        ; defb 100,255
                        ; defb 1,240, 18,0, 1,15
                        ; defb 1,240, 18,0, 1,15
                        ; defb 20,255
;Display large graphic
;Data Byte 1/2-screen address, 3=rows used, 4=collumns used
DISPLAY_LARGE_TELETEXT_COMPRESSED_0:

                        LD H,(IX+1)                     ; Get ATTR address
                        LD L,(IX+0)                     ;

                        LD (COLOUR_SBCFAX_ATTR_ADDRESS_0+1),HL; Set ATTR screen start address

                        LD H,(IX+3)                     ; Get screen address
                        LD L,(IX+2)                     ;

                        LD C,(IX+5)                     ; Get collumns
                        LD A,C                          ; Place into A to set ATTR collumns
                        LD (COLOUR_SBCFAX_TITLE_LOOP_0+1),A; Set collumns

                        LD A,(IX+7)                     ; Get colour
                        LD (SBCFAX_COLOUR_0+1),A        ; Set ATTR colour

                        LD A,(IX+6)                     ; Get collumns to add
                        LD (COLLUMNS_TO_ADD_0+1),A      ; Set collumns to add for ATTR to get to each ATTR line

                        LD A,(IX+4)                     ; Get rows            ; Get rows
                        LD (COLOUR_SBCFAX_TITLE_0+1),A  ; Set ATTR rows

                        LD DE,8                         ; Move IX to graphic data
                        ADD IX,DE                       ;

DISPLAY_LARGE_GRAPHIC_LOOP3B_0:

                        PUSH HL                         ; Save screen address
                        PUSH AF                         ; Save rows loop

                        LD A,8                          ; 8 Hi res lines
DISPLAY_LARGE_GRAPHIC_LOOP1B_0:

                        PUSH AF                         ; Save Hires lines loop

                        LD D,C                          ; Save collumn data to D
DISPLAY_LARGE_GRAPHIC_LOOP2B_0:
                        ;  PUSH AF ;Save collumn loop
                        LD B,(IX+0)                     ; Get length data
                        LD A,(IX+1)                     ; Get data

DECOMPRESS_LOOPA_0:

                        LD (HL),A                       ; Place data to screen
                        INC L                           ; Move to next screen address to the right
                        DEC D                           ; Take 1 from collumns loop
                        DJNZ DECOMPRESS_LOOPA_0         ;

                        INC IX                          ; Move to next graphic data
                        INC IX                          ; Move to next graphic data

                        LD A,D                          ; Get collumn counter
                        OR A                            ; CP 0            ; Is collumn counter 0 for line completed?
                        JR NZ,DISPLAY_LARGE_GRAPHIC_LOOP2B_0 ; Jump back until all collumns are done

                        INC H                           ; Move to next screen Hires line
                        LD A,L                          ; Setup A fora subtraction
                        SUB C                           ; Subtract collumns to go back to begining of graphic for next Hi res line
                        LD L,A                          ; Update screen address

                        POP AF                          ; Restore Hi res lines loop
                        DEC A                           ; Take one from Hi res lines loop
                        JP NZ,DISPLAY_LARGE_GRAPHIC_LOOP1B_0 ; Jump back until all Hi res lines loop are completed

                        POP AF                          ; Restore rows loop
                        POP HL                          ; Restore screen address
                        PUSH DE                         ;
                        LD DE,32                        ; Setup DE for addition
                        ADD HL,DE                       ; Update screen address for next text line
                        POP DE                          ;

                        DEC A                           ; Take one from rows loop

                        JR NZ,DISPLAY_LARGE_GRAPHIC_LOOP3B_0 ; Jump back until all rows are completed

                        CALL COLOUR_SBCFAX_ATTR_ADDRESS_0;
                        RET                             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DISPLAY_TELETEXT_TITLE_TEMPLATE_0:
                        LD IX,SBCFAX_TITLE_0            ; SBC Text data
                        CALL DISPLAY_LARGE_TELETEXT_COMPRESSED_0 ; Display data

                        LD IX,SBCFAX_TITLE_TOP_BAR_0    ;
                        CALL DISPLAY_LARGE_TELETEXT_COMPRESSED_0 ; Display data

                        LD IX,SBCFAX_TITLE_BOTTOM_BAR_0 ;
                        CALL DISPLAY_LARGE_TELETEXT_COMPRESSED_0 ; Display data

                        RET                             ;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SBC News Ceefax title
SBCFAX_TITLE_0:         ;Compressed                     ;
                        DEFW 22658                      ; Start ATTR address
                        DEFW 16514                      ; Start address of graphics
                        DEFB 4,8                        ; 4 rows, 8 collumns
                        DEFB 24                         ; 24 collumns to add
                        DEFB 121                        ; Colour bright white on blue
                        defb 8,255                      ;
                        defb 8,255                      ;
                        defb 8,255                      ;
                        defb 8,255                      ;
                        defb 8,255                      ;
                        defb 1,240, 1,0, 1,7, 2,0, 1,112, 1,0, 1,7;
                        defb 1,240, 1,0, 1,7, 2,0, 1,112, 1,0, 1,7;
                        defb 1,243, 1,255, 1,231, 1,63, 1,254, 1,115, 1,255, 1,231;
                        defb 1,243, 1,255, 1,231, 1,63, 1,254, 1,115, 1,255, 1,231;
                        defb 1,243, 1,255, 1,231, 1,63, 1,254, 1,115, 1,255, 1,231;
                        defb 2,243, 1,231, 2,62, 1,115, 1,255, 1,231;
                        defb 2,243, 1,231, 2,62, 1,115, 2,231;
                        defb 2,243, 1,231, 2,62, 1,115, 2,231;
                        defb 1,243, 1,240, 1,7, 2,62, 1,115, 1,224, 1,7;
                        defb 1,243, 1,240, 1,7, 2,62, 1,115, 1,224, 1,7;
                        defb 1,243, 1,255, 1,231, 1,63, 1,254, 1,115, 1,224, 1,7;
                        defb 1,243, 1,255, 1,231, 1,63, 1,248, 1,115, 1,224, 1,7;
                        defb 1,243, 1,255, 1,231, 1,63, 1,248, 1,115, 1,224, 1,7;
                        defb 1,243, 1,255, 1,231, 1,63, 1,254, 1,115, 1,224, 1,7;
                        defb 1,240, 1,3, 1,231, 2,62, 1,115, 1,224, 1,7;
                        defb 1,240, 1,3, 1,231, 2,62, 1,115, 1,224, 1,7;
                        defb 2,243, 1,231, 2,62, 1,115, 2,231;
                        defb 2,243, 1,231, 2,62, 1,115, 2,231;
                        defb 2,243, 1,231, 2,62, 1,115, 1,255, 1,231;
                        defb 1,243, 1,255, 1,231, 1,63, 1,254, 1,115, 1,255, 1,231;
                        defb 1,243, 1,255, 1,231, 1,63, 1,254, 1,115, 1,255, 1,231;
                        defb 1,243, 1,255, 1,231, 1,63, 1,254, 1,115, 1,255, 1,231;
                        defb 1,240, 1,0, 1,7, 2,0, 1,112, 1,0, 1,7;
                        defb 1,240, 1,0, 1,7, 2,0, 1,112, 1,0, 1,7;
                        defb 8,255                      ;
                        defb 8,255                      ;
                        defb 8,255                      ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SBCFAX_TITLE_TOP_BAR_0: ; Compressed                    ;
                        DEFW 22666                      ; Start ATTR address
                        DEFW 16514+8                    ; Start address of graphics
                        DEFB 1,20                       ; 1 rows, 20 collumns
                        DEFB 0                          ; 12                          ;0 collumns to add
                        DEFB 121                        ; Colour bright white on blue
                        defb 20,255                     ;
                        defb 20,255                     ;
                        defb 20,255                     ;
                        defb 20,255                     ;
                        defb 20,255                     ;
                        defb 1,240, 18,0, 1,15          ;
                        defb 1,240, 18,0, 1,15          ;
                        defb 20,255                     ;


SBCFAX_TITLE_BOTTOM_BAR_0:; Compressed                  ;
                        DEFW 22762                      ; Start ATTR address
                        DEFW 16608+10                   ; Start address of graphics
                        DEFB 1,20                       ; 1 rows, 20 collumns
                        DEFB 0                          ; 12                          ;0 collumns to add
                        DEFB 121                        ; Colour bright white on blue
                        defb 20,255                     ;
                        defb 20,255                     ;
                        defb 20,255                     ;
                        defb 1,240, 18,0, 1,15          ;
                        defb 1,240, 18,0, 1,15          ;
                        defb 20,255                     ;
                        defb 20,255                     ;
                        defb 20,255                     ;


SBCFAX_NEWS_TITLE_0:    ; Compressed                    ;
                        DEFW 22666+32                   ; Start ATTR address
                        DEFW 16544+10                   ; Start address of graphics
                        DEFB 2,20                       ; 2 rows, 20 collumns
                        DEFB 12                         ; 12 collumns to add
                        DEFB 113                        ; Colour bright yellow on blue
                        defb 20,255                     ;
                        defb 20,255                     ;
                        defb 1,240, 3,0, 1,15, 4,0, 1,56, 1,0, 1,63, 1,255, 1,252, 1,0, 1,12, 3,0, 1,15;
                        defb 1,240, 3,0, 1,15, 4,0, 1,56, 1,0, 1,63, 1,255, 1,252, 1,0, 1,12, 3,0, 1,15;
                        defb 1,240, 3,0, 1,15, 4,0, 1,56, 1,0, 1,63, 1,255, 1,252, 1,0, 1,12, 3,0, 1,15;
                        defb 1,240, 1,0, 1,126, 1,0, 1,15, 1,0, 1,7, 1,254, 1,0, 1,56, 1,0, 1,63, 1,255, 1,252, 1,0, 1,12, 1,0, 1,15, 2,255;
                        defb 1,240, 1,0, 1,126, 1,0, 1,15, 1,0, 1,7, 1,254, 1,0, 1,56, 1,0, 1,63, 1,255, 1,252, 1,0, 1,12, 1,0, 1,15, 2,255;
                        defb 1,240, 1,0, 1,126, 1,0, 1,15, 1,0, 1,7, 1,254, 1,0, 1,56, 1,0, 1,63, 1,255, 1,252, 1,0, 1,12, 1,0, 1,15, 2,255;
                        defb 1,240, 1,0, 1,126, 1,0, 1,15, 4,0, 1,56, 1,0, 1,60, 1,0, 1,60, 1,0, 1,12, 3,0, 1,15;
                        defb 1,240, 1,0, 1,126, 1,0, 1,15, 4,0, 1,56, 1,0, 1,60, 1,0, 1,60, 1,0, 1,12, 3,0, 1,15;
                        defb 1,240, 1,0, 1,126, 1,0, 1,15, 1,0, 1,7, 2,255, 1,248, 1,0, 1,60, 1,0, 1,60, 1,0, 1,15, 1,255, 1,254, 1,0, 1,15;
                        defb 1,240, 1,0, 1,126, 1,0, 1,15, 1,0, 1,7, 2,255, 1,248, 1,0, 1,60, 1,0, 1,60, 1,0, 1,15, 1,255, 1,254, 1,0, 1,15;
                        defb 1,240, 1,0, 1,126, 1,0, 1,15, 1,0, 1,7, 2,255, 1,248, 1,0, 1,60, 1,0, 1,60, 1,0, 1,15, 1,255, 1,254, 1,0, 1,15;
                        defb 1,240, 1,0, 1,126, 1,0, 1,15, 4,0, 1,56, 5,0, 1,12, 3,0, 1,15;
                        defb 1,240, 1,0, 1,126, 1,0, 1,15, 4,0, 1,56, 5,0, 1,12, 3,0, 1,15;
                        defb 1,240, 1,0, 1,126, 1,0, 1,15, 4,0, 1,56, 5,0, 1,12, 3,0, 1,15;

SBCFAX_CONTROLS_TOP_0:  ;Compressed                     ;

                        DEFW 22658                      ; Start ATTR address
                        DEFW 16514                      ; Start address of graphics
                        DEFB 3,28                       ; 3 rows, 28 collumns
                        DEFB 4                          ; 4 collumns to add
                        DEFB 97                         ; 96                         ; Colour bright black on red
                        defb 28,255                     ;
                        defb 28,255                     ;
                        defb 28,255                     ;
                        defb 28,255                     ;
                        defb 28,255                     ;
                        defb 28,255                     ;
                        defb 28,255                     ;
                        defb 28,255                     ;
                        defb 2,255, 2,0, 1,63, 23,255   ;
                        defb 2,255, 2,0, 1,63, 23,255   ;
                        defb 2,255, 1,0, 1,127, 24,255  ;
                        defb 2,255, 1,0, 1,127, 1,252, 2,0, 1,30, 1,1, 1,224, 1,30, 1,0, 1,3, 1,192, 1,0, 1,3, 1,192, 1,0, 1,1, 1,240, 1,7, 1,255, 1,248, 2,0, 3,255;
                        defb 2,255, 1,0, 1,255, 1,252, 2,0, 1,30, 1,0, 1,224, 1,30, 1,0, 1,3, 1,192, 1,0, 1,3, 1,192, 1,0, 1,1, 1,240, 1,7, 1,255, 1,248, 2,0, 3,255;
                        defb 2,255, 1,0, 1,255, 1,252, 1,1, 1,192, 1,30, 1,0, 1,224, 1,31, 1,192, 1,31, 1,192, 1,60, 1,3, 1,192, 1,28, 1,1, 1,240, 1,7, 1,255, 1,248, 1,3, 1,128, 3,255;
                        defb 2,255, 1,0, 1,255, 1,252, 1,3, 1,224, 1,30, 1,0, 1,96, 1,31, 1,192, 1,31, 1,192, 1,60, 1,3, 1,192, 1,62, 1,1, 1,240, 1,7, 1,255, 1,248, 1,3, 4,255;
                        defb 2,255, 1,0, 1,255, 1,252, 1,3, 1,224, 1,30, 1,0, 1,96, 1,31, 1,192, 1,31, 1,192, 1,60, 1,3, 1,192, 1,62, 1,1, 1,240, 1,7, 1,255, 1,248, 1,3, 4,255;
                        defb 2,255, 1,0, 1,255, 1,252, 1,3, 1,224, 1,30, 1,0, 1,32, 1,31, 1,192, 1,31, 1,192, 1,0, 1,31, 1,192, 1,62, 1,1, 1,240, 1,7, 1,255, 1,248, 2,0, 3,255;
                        defb 2,255, 1,0, 1,255, 1,252, 1,3, 1,224, 1,30, 1,1, 1,0, 1,31, 1,192, 1,31, 1,192, 1,0, 1,31, 1,192, 1,62, 1,1, 1,240, 1,7, 1,255, 1,248, 2,0, 3,255;
                        defb 2,255, 1,0, 1,255, 1,252, 1,3, 1,224, 1,30, 1,1, 1,128, 1,31, 1,192, 1,31, 1,192, 1,60, 1,3, 1,192, 1,62, 1,1, 1,240, 1,7, 3,255, 1,128, 3,255;
                        defb 2,255, 1,0, 1,255, 1,252, 1,3, 1,224, 1,30, 1,1, 1,128, 1,31, 1,192, 1,31, 1,192, 1,60, 1,3, 1,192, 1,62, 1,1, 1,240, 1,7, 3,255, 1,128, 3,255;
                        defb 2,255, 1,0, 1,127, 1,252, 1,1, 1,192, 1,30, 1,1, 1,192, 1,31, 1,192, 1,31, 1,192, 1,60, 1,3, 1,192, 1,28, 1,1, 1,240, 1,7, 1,255, 1,248, 1,3, 1,128, 3,255;
                        defb 2,255, 2,0, 1,60, 2,0, 1,30, 1,1, 1,192, 1,31, 1,192, 1,31, 1,192, 1,60, 1,3, 1,192, 1,0, 1,1, 1,240, 2,0, 1,120, 2,0, 3,255;
                        defb 2,255, 2,0, 1,60, 2,0, 1,30, 1,1, 1,192, 1,31, 1,192, 1,31, 1,192, 1,60, 1,3, 1,192, 1,0, 1,1, 1,240, 2,0, 1,120, 2,0, 3,255;
                        defb 28,255                     ;

SBCFAX_CONTROLS_BOTTOM_0:; Compressed                   ;

                        DEFW 22754                      ; Start ATTR address
                        DEFW 16608+2                    ; Start address of graphics
                        DEFB 1,28                       ; 1 rows, 28 collumns
                        DEFB 5                          ; 5 collumns to add
                        DEFB 81                         ; 80                         ; Colour bright black on red
                        defb 28,255                     ;
                        defb 28,255                     ;
                        defb 1,255, 1,195, 2,255, 1,199, 2,255, 1,227, 1,254, 1,127, 1,248, 1,127, 1,240, 1,127, 1,243, 1,254, 1,127, 2,255, 1,31, 2,255, 1,199, 2,255, 1,193, 2,255;
                        defb 1,255, 1,195, 2,255, 1,199, 2,255, 1,227, 1,254, 1,63, 1,248, 1,127, 1,240, 1,127, 1,243, 1,254, 1,127, 2,255, 1,31, 2,255, 1,199, 2,255, 1,193, 2,255;
                        defb 1,255, 1,195, 2,255, 1,199, 2,255, 1,227, 1,254, 1,31, 1,248, 1,127, 1,240, 1,127, 1,243, 1,254, 1,127, 2,255, 1,31, 2,255, 1,199, 2,255, 1,193, 2,255;
                        defb 1,255, 1,192, 23,0, 1,1, 2,255;
                        defb 1,255, 1,192, 23,0, 1,1, 2,255;
                        defb 28,255                     ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SBCFAX_SCORES_TITLE_0:  ; Compressed                    ;

                        DEFW 22658                      ; Start ATTR address
                        DEFW 16514                      ; Start address of graphics
                        DEFB 4,28                       ; 4 rows, 28 collumns
                        DEFB 4                          ; 4 collumns to add
                        DEFB 113                        ; Colour bright black on red
                        defb 28,255                     ;
                        defb 28,255                     ;
                        defb 28,255                     ;
                        defb 4,255, 1,192, 2,0, 1,3, 3,255, 1,128, 3,0, 3,255, 1,224, 3,0, 1,31, 5,255;
                        defb 4,255, 1,192, 2,0, 1,3, 3,255, 1,128, 3,0, 3,255, 1,224, 3,0, 1,31, 5,255;
                        defb 4,255, 1,192, 2,0, 1,3, 3,255, 1,254, 3,0, 4,255, 1,128, 2,0, 1,31, 5,255;
                        defb 4,255, 1,192, 2,0, 1,3, 3,255, 1,254, 3,0, 4,255, 1,128, 2,0, 1,31, 5,255;
                        defb 4,255, 1,192, 2,255, 1,195, 1,192, 2,0, 1,14, 1,127, 1,255, 1,192, 1,240, 2,0, 1,7, 1,159, 1,255, 1,248, 1,24, 2,0, 1,1, 2,255;
                        defb 4,255, 1,192, 2,255, 1,195, 1,192, 2,0, 1,14, 1,127, 1,255, 1,192, 1,240, 2,0, 1,7, 1,159, 1,255, 1,248, 1,24, 2,0, 1,1, 2,255;
                        defb 4,255, 1,192, 2,255, 1,195, 1,192, 2,0, 1,14, 1,127, 1,255, 1,192, 1,240, 2,0, 1,7, 1,159, 1,255, 1,248, 1,24, 2,0, 1,1, 2,255;
                        defb 4,255, 1,192, 1,248, 1,7, 1,195, 1,192, 2,0, 1,14, 1,120, 1,3, 1,192, 1,240, 2,0, 1,7, 1,159, 1,128, 1,0, 1,24, 2,0, 1,1, 2,255;
                        defb 4,255, 1,192, 1,248, 1,7, 1,195, 1,192, 2,0, 1,14, 1,120, 1,3, 1,192, 1,240, 2,0, 1,7, 1,159, 1,128, 1,0, 1,24, 2,255, 1,193, 2,255;
                        defb 1,255, 1,140, 1,30, 1,31, 1,192, 1,248, 1,0, 1,3, 1,207, 1,255, 1,252, 1,14, 1,120, 1,3, 1,192, 1,243, 2,255, 1,7, 1,159, 1,128, 1,0, 1,24, 2,255, 1,193, 2,255;
                        defb 1,255, 1,100, 1,204, 1,207, 1,192, 1,248, 1,0, 1,3, 1,207, 1,255, 1,252, 1,14, 1,120, 1,3, 1,192, 1,243, 2,255, 1,7, 1,159, 1,128, 1,0, 1,24, 2,255, 1,193, 2,255;
                        defb 1,255, 1,124, 1,201, 1,255, 1,192, 2,255, 1,195, 1,207, 1,255, 1,252, 1,14, 1,120, 1,3, 1,192, 1,243, 2,255, 1,7, 1,159, 1,255, 1,128, 1,24, 1,248, 1,7, 1,193, 2,255;
                        defb 1,255, 1,28, 1,25, 1,255, 1,192, 2,255, 1,195, 1,207, 1,0, 1,124, 1,14, 1,120, 1,3, 1,192, 1,243, 1,240, 1,63, 1,7, 1,159, 1,255, 1,128, 1,24, 1,248, 1,7, 1,193, 2,255;
                        defb 1,255, 1,132, 1,201, 1,255, 1,192, 1,0, 1,7, 1,195, 1,207, 1,0, 1,124, 1,14, 1,120, 1,3, 1,192, 1,243, 1,240, 1,63, 1,7, 1,159, 1,128, 1,0, 1,24, 1,248, 1,0, 1,1, 2,255;
                        defb 1,255, 1,228, 1,201, 1,255, 1,192, 1,0, 1,7, 1,195, 1,207, 2,0, 1,14, 1,120, 1,3, 1,192, 1,243, 1,240, 1,63, 1,7, 1,159, 1,128, 1,0, 1,24, 1,248, 1,0, 1,1, 2,255;
                        defb 1,255, 1,100, 1,204, 1,207, 1,192, 1,0, 1,7, 1,195, 1,207, 2,0, 1,14, 1,127, 1,255, 1,192, 1,243, 1,240, 1,63, 1,7, 1,159, 1,255, 1,248, 1,24, 2,255, 1,193, 2,255;
                        defb 1,255, 1,12, 1,30, 1,31, 1,192, 2,255, 1,195, 1,207, 2,0, 1,14, 1,127, 1,255, 1,192, 1,243, 2,255, 1,7, 1,159, 1,255, 1,248, 1,24, 2,255, 1,193, 2,255;
                        defb 4,255, 1,192, 2,255, 1,195, 1,207, 2,0, 1,14, 1,127, 1,255, 1,192, 1,243, 2,255, 1,7, 1,159, 1,255, 1,248, 1,24, 1,0, 1,7, 1,193, 2,255;
                        defb 4,255, 1,192, 2,255, 1,195, 1,207, 2,0, 1,14, 3,0, 1,243, 2,255, 1,7, 1,128, 2,0, 1,24, 1,0, 1,7, 1,193, 2,255;
                        defb 4,255, 1,192, 2,0, 1,3, 1,207, 2,0, 1,14, 3,0, 1,243, 1,255, 1,192, 1,7, 1,128, 2,0, 1,24, 1,0, 1,7, 1,193, 2,255;
                        defb 4,255, 1,192, 2,0, 1,3, 1,207, 1,255, 1,252, 1,14, 3,0, 2,243, 1,248, 1,7, 1,128, 2,0, 1,24, 2,255, 1,193, 2,255;
                        defb 4,255, 1,192, 2,0, 1,3, 1,207, 1,255, 1,252, 1,14, 3,0, 1,243, 1,240, 1,254, 1,7, 1,128, 2,0, 1,24, 2,255, 1,193, 2,255;
                        defb 4,255, 1,192, 2,0, 1,3, 1,207, 1,255, 1,252, 1,14, 3,0, 1,243, 1,240, 1,63, 1,135, 1,128, 2,0, 1,24, 2,255, 1,193, 2,255;
                        defb 8,255, 1,192, 2,0, 1,15, 3,255, 1,240, 2,0, 1,7, 3,255, 1,248, 2,0, 1,1, 2,255;
                        defb 8,255, 1,192, 2,0, 1,15, 3,255, 1,240, 2,0, 1,7, 3,255, 1,248, 2,0, 1,1, 2,255;
                        defb 7,255, 1,240, 3,0, 1,15, 2,255, 1,252, 3,0, 1,7, 3,255, 3,0, 1,1, 2,255;
                        defb 7,255, 1,240, 3,0, 1,15, 2,255, 1,252, 3,0, 1,7, 3,255, 3,0, 1,1, 2,255;
                        defb 28,255                     ;
                        defb 28,255                     ;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
START_MESSAGEA_0:
                        DEFB 3,2,71,0                   ; Line,Collumn,Colour,1=Double Height
                        DEFM "p195 SBCFAX 195 Mon 20 Jun";
                        DEFB 255                        ;

START_MESSAGEA1_0:
                        DEFB 3,2,71,0                   ; Line,Collumn,Colour,1=Double Height
                        DEFM "p196 SBCFAX 196 Mon 20 Jun";
                        DEFB 255                        ;

START_MESSAGEA2_0:
                        DEFB 3,2,71,0                   ; Line,Collumn,Colour,1=Double Height
                        DEFM "p197 SBCFAX 197 Mon 20 Jun";
                        DEFB 255                        ;
START_MESSAGE_0:

                        DEFB 8,2,71,0                   ; Line,Collumn,Colour,1=Double Height
                        DEFM "Alien searching enthusiasts#";
                        DEFM "stumble across a portal to#";
                        DEFM "another dimension.##"     ;
                        DEFB 255                        ;


START_MESSAGEB_0:
                        DEFB 12,2,68,0                  ;
                        DEFM "The aliens enter the portal#";
                        DEFM "and take the air and water#" ;
                        DEFM "supply. Without those#"   ;
                        DEFM "elements, there will be##" ;
                        DEFB 255                        ; String end flag

TITLE_0:
                        DEFB 17,5,74,1                  ; Line,Collumn,Colour,1=Double Height
                        DEFM " N O  F U T U R E  X L#"      ; String to display
                        DEFB 255                        ; String end flag

START_MESSAGE2_0:
                        DEFB 21,2,80,0                  ;
                        DEFM "J-KEMPSTON"               ;
                        DEFB 255                        ;

START_MESSAGE2A_0:
                        DEFB 21,13,96,0                 ;
                        DEFM "L-FULLER "                ;
                        DEFB 255                        ;


START_MESSAGE2B_0:
                        DEFB 21,23,112,0                ;
                        DEFM "K-KEYS "                  ;
                        DEFB 255                        ;

PRESS_ANY_KEY_0:
                        DEFB 20,9,96,0                  ;
                        DEFM " PRESS ANY KEY "          ;
                        DEFB 255                        ;


SELECT_CONTROLS_TEXT_0:

                        DEFB 20,2,114,0                 ;
                        DEFM "Select controls:            " ;
                        DEFB 255                        ;


DISPLAY_INSTRUCTIONS_DATA1C_0:

                        DEFB 9,2,79,0                   ;
                        DEFM " To move left               " ;
                        DEFB 255                        ;

DISPLAY_INSTRUCTIONS_DATA1C1_0:
                        DEFB 10,2,71,0                  ;
LEFT_KEY_TEXT:          DEFM " Q,E,T,U,O,Z,C,N    "     ;
                        DEFB 255                        ;

DISPLAY_INSTRUCTIONS_DATA1C2_0:
                        DEFB 12,2,79,0                  ;
                        DEFM " To move right              " ;
                        DEFB 255                        ;

DISPLAY_INSTRUCTIONS_DATA1C3_0:
                        DEFB 13,2,71,0                  ;
RIGHT_KEY_TEXT:         DEFM " W,R,Y,I,P,X,V,B,M  "     ;
                        DEFB 255                        ;

DISPLAY_INSTRUCTIONS_DATA1C4_0:
                        DEFB 15,2,79,0                  ;
                        DEFM " To Fire                    " ;
                        DEFB 255                        ;

DISPLAY_INSTRUCTIONS_DATA1C5_0:
                        DEFB 16,2,71,0                  ;
FIRE_KEY_TEXT:          DEFM " A,S,D,F,G,H,J,K,L,0,ENTER " ;
                        DEFB 255                        ;

DISPLAY_INSTRUCTIONS_DATA1D_0:
                        DEFB 21,6,80,0                  ;
                        DEFM "S-Start"                  ;
                        DEFB 255                        ;


DISPLAY_INSTRUCTIONS_DATA1E_0:
                        DEFB 21,16,96,0                 ;
                        DEFM "A-News"                   ;
                        DEFB 255                        ;

DISPLAY_INSTRUCTIONS_DATA1B_0:

                        DEFB 10,2,79,0                  ;
                        DEFM "       GAME CONTROLS        " ;
                        DEFB 255                        ;

                        DISPLAY_INSTRUCTIONS_DATA1B1:   ;
                        DEFB 12,9,71,0                  ;
                        DEFM "JOYSTICK LEFT#"           ;
                        DEFM "JOYSTICK RIGHT#"          ;
                        DEFM "JOYSTICK FIRE##"          ;
                        DEFB 255                        ;



DISPLAY_INSTRUCTIONS_DATA2_0:
                        DEFB 18,2,114,0                 ;
                        DEFM "No Future 128 By Steve Broad#" ;
                        DEFM "V1.3 (C)MYCAT SOFTWARE 2024 " ;
                        DEFB 255                        ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ASM data file from a ZX-Paintbrush picture with 256 x 192 pixels (= 32 x 24 characters)
; and an attribute area of 768 bytes

; alternate (SCREEN$) output of pixel data:
ALIEN_IMAGE1_0:
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 240, 1, 255, 252, 0, 0, 0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 192, 7, 0, 0, 0, 3, 255, 255, 227, 252, 0, 52, 0, 0, 0, 255, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 15, 0, 0, 0, 0, 3, 0, 64, 192, 3, 189, 254, 0, 0, 0, 0, 255, 7, 255, 224, 0, 126, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 127, 254, 9, 251, 0, 255, 0, 0, 255, 255, 0, 63, 255, 248, 0, 0, 255, 62, 0, 224, 56, 0, 0;
                        defb 0, 0, 0, 0, 48, 30, 0, 0, 0, 255, 0, 56, 0, 252, 239, 176, 2, 255, 0, 0, 255, 0, 157, 0, 63, 128, 0, 15, 255, 255, 254, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 7, 7, 3, 0, 248, 0, 0, 28, 48, 0, 112, 0, 0, 127, 0, 96, 96, 0, 60, 255, 143, 255, 248, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 247, 183, 143, 63, 0, 255, 15, 255, 255, 255, 255, 15, 252, 255, 240, 0, 0, 0, 255, 3, 7, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 192, 0, 31, 254, 0, 0, 0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 1, 128, 1, 128, 0, 0, 0, 127, 255, 7, 240, 0, 0, 0, 0, 1, 255, 128, 6, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 15, 0, 0, 0, 0, 3, 0, 0, 192, 2, 145, 254, 0, 0, 0, 0, 255, 7, 193, 240, 0, 60, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 240, 1, 252, 1, 255, 31, 3, 127, 255, 0, 63, 255, 240, 1, 128, 255, 255, 255, 239, 248, 127, 240;
                        defb 0, 0, 0, 0, 112, 126, 0, 0, 0, 223, 0, 206, 1, 248, 199, 134, 0, 240, 0, 195, 191, 128, 100, 0, 31, 128, 0, 56, 63, 253, 248, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 31, 7, 7, 1, 244, 31, 0, 8, 0, 0, 0, 15, 152, 127, 0, 224, 96, 0, 252, 255, 3, 96, 126, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 247, 167, 143, 63, 255, 255, 239, 255, 255, 255, 255, 127, 255, 255, 240, 0, 0, 0, 255, 7, 7, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 15, 254, 0, 0, 0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 1, 128, 1, 128, 7, 192, 0, 125, 4, 255, 224, 0, 0, 0, 0, 1, 195, 192, 6, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 3, 0, 0, 0, 0, 3, 0, 0, 192, 3, 149, 192, 0, 0, 0, 0, 15, 31, 128, 240, 0, 24, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 1, 231, 128, 0, 0, 0, 0, 14, 204, 3, 254, 255, 233, 64, 15, 240, 7, 255, 224, 7, 128, 254, 255, 255, 239, 228, 47, 240;
                        defb 0, 0, 0, 0, 115, 250, 0, 0, 0, 199, 0, 200, 3, 240, 207, 144, 255, 229, 0, 3, 63, 192, 21, 0, 7, 225, 255, 191, 255, 255, 248, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 29, 7, 6, 3, 192, 14, 0, 31, 224, 0, 0, 7, 152, 31, 128, 3, 240, 3, 143, 255, 1, 239, 255, 192;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 231, 165, 134, 63, 255, 255, 239, 240, 0, 0, 127, 127, 255, 255, 240, 0, 0, 0, 255, 3, 15, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 0, 0, 15, 255, 128, 60, 0, 240, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 1, 128, 0, 128, 7, 192, 8, 30, 3, 255, 128, 0, 0, 0, 0, 3, 129, 192, 32, 0, 56, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 12, 192, 112, 255, 192, 0, 0, 0, 0, 15, 31, 156, 248, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 6, 31, 192, 0, 0, 0, 0, 102, 240, 15, 248, 255, 62, 80, 7, 252, 0, 63, 128, 15, 0, 224, 255, 255, 239, 188, 136, 28;
                        defb 0, 0, 0, 0, 255, 228, 0, 0, 1, 131, 0, 123, 7, 192, 15, 64, 2, 231, 0, 8, 15, 192, 255, 0, 3, 225, 62, 135, 207, 255, 248, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 29, 135, 1, 7, 192, 0, 0, 31, 224, 96, 0, 0, 127, 223, 192, 3, 240, 14, 63, 252, 1, 159, 255, 192;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 231, 165, 130, 31, 127, 255, 239, 192, 0, 0, 31, 127, 255, 255, 224, 0, 0, 0, 255, 0, 31, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 255, 192, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 0, 0, 31, 255, 192, 62, 0, 192, 240, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 3, 128, 0, 192, 0, 193, 71, 0, 0, 0, 0, 123, 152, 0, 0, 7, 1, 224, 0, 0, 56, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 1, 128, 120, 128, 62, 248, 0, 0, 0, 0, 0, 0, 31, 0, 252, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 8, 7, 192, 0, 0, 0, 0, 47, 240, 31, 224, 255, 0, 192, 99, 255, 0, 0, 0, 14, 0, 224, 255, 255, 238, 255, 255, 124;
                        defb 0, 0, 0, 0, 255, 132, 0, 0, 1, 131, 0, 58, 15, 128, 255, 208, 0, 123, 8, 0, 15, 224, 51, 0, 1, 255, 255, 255, 251, 255, 248, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 29, 199, 15, 15, 207, 135, 255, 255, 255, 255, 255, 248, 127, 223, 192, 1, 248, 24, 255, 224, 1, 239, 255, 248;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 231, 165, 194, 7, 63, 255, 255, 0, 0, 0, 7, 255, 255, 255, 192, 0, 0, 0, 253, 0, 255, 255, 248, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 255, 240, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 192, 0, 63, 255, 192, 127, 0, 192, 248, 0, 0, 64, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 2, 0, 0, 0, 0, 3, 0, 32, 192, 0, 5, 206, 0, 0, 0, 0, 203, 0, 0, 0, 3, 131, 224, 4, 0, 8, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 1, 128, 193, 128, 62, 148, 0, 0, 0, 0, 0, 0, 63, 0, 252, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 8, 3, 192, 0, 0, 0, 0, 49, 192, 63, 192, 255, 188, 0, 1, 255, 192, 0, 0, 28, 3, 56, 0, 0, 0, 239, 255, 252;
                        defb 0, 0, 0, 0, 255, 56, 0, 0, 3, 163, 0, 79, 31, 0, 255, 192, 135, 255, 0, 0, 99, 240, 252, 0, 0, 127, 255, 255, 255, 191, 192, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 31, 199, 15, 31, 15, 135, 255, 255, 255, 255, 255, 248, 1, 195, 224, 0, 224, 19, 255, 224, 1, 224, 15, 240;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 231, 165, 194, 1, 255, 255, 248, 13, 255, 251, 129, 255, 255, 255, 0, 0, 0, 0, 254, 0, 255, 255, 252, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 127, 255, 248, 252, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 252, 0, 0, 0, 15, 224, 7, 255, 255, 192, 255, 0, 192, 240, 24, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 3, 0, 0, 1, 224, 3, 0, 128, 192, 0, 29, 219, 0, 0, 0, 0, 112, 77, 30, 0, 1, 231, 192, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 1, 195, 129, 128, 116, 240, 0, 31, 255, 224, 0, 0, 63, 131, 252, 0, 0, 0, 7, 255, 255, 255, 255, 128;
                        defb 0, 0, 0, 0, 16, 3, 128, 0, 0, 0, 0, 240, 192, 63, 0, 200, 208, 1, 1, 255, 240, 0, 0, 0, 3, 0, 0, 224, 56, 255, 255, 240;
                        defb 0, 0, 0, 0, 49, 192, 0, 0, 1, 163, 0, 120, 63, 0, 255, 156, 1, 129, 0, 12, 9, 248, 21, 0, 0, 63, 255, 255, 254, 127, 224, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 127, 199, 15, 63, 31, 255, 255, 255, 255, 255, 255, 255, 253, 243, 240, 224, 32, 63, 255, 192, 224, 63, 255, 240;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 231, 161, 194, 1, 253, 255, 240, 19, 160, 30, 64, 127, 255, 255, 0, 0, 124, 0, 244, 96, 255, 255, 254, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 255, 255, 248, 252, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 127, 254, 0, 0, 0, 3, 255, 255, 255, 255, 128, 28, 0, 208, 240, 60, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 15, 0, 0, 0, 224, 3, 1, 32, 192, 0, 30, 81, 0, 0, 0, 0, 113, 199, 255, 128, 0, 255, 128, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 206, 31, 0, 20, 32, 0, 255, 255, 255, 240, 0, 63, 255, 248, 0, 0, 0, 31, 255, 255, 255, 255, 128;
                        defb 0, 0, 0, 0, 16, 15, 0, 0, 0, 0, 0, 184, 192, 127, 0, 240, 248, 64, 0, 255, 252, 0, 0, 0, 63, 0, 0, 143, 255, 255, 255, 240;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 7, 163, 0, 232, 127, 0, 223, 163, 204, 255, 120, 0, 1, 248, 21, 0, 0, 0, 0, 63, 255, 255, 248, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 127, 135, 15, 63, 24, 255, 255, 255, 255, 255, 255, 255, 252, 126, 240, 224, 0, 63, 254, 0, 240, 63, 254, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 231, 225, 192, 0, 252, 7, 224, 3, 0, 14, 64, 63, 128, 252, 60, 0, 254, 0, 192, 248, 252, 255, 255, 192;
                        defb 0, 0, 0, 255, 63, 255, 0, 1, 231, 224, 224, 0, 127, 255, 192, 248, 154, 217, 255, 31, 255, 240, 255, 1, 195, 0, 192, 7, 15, 128, 15, 192;
                        defb 0, 0, 0, 0, 0, 21, 71, 129, 231, 167, 24, 15, 195, 31, 127, 192, 0, 0, 127, 249, 192, 184, 254, 0, 1, 255, 255, 0, 227, 15, 207, 192;
                        defb 0, 0, 56, 0, 119, 49, 255, 195, 224, 32, 31, 240, 7, 15, 223, 255, 224, 31, 255, 199, 192, 0, 8, 127, 143, 128, 0, 12, 3, 227, 255, 192;
                        defb 0, 0, 1, 255, 246, 0, 0, 255, 231, 135, 31, 220, 0, 162, 255, 7, 255, 255, 15, 254, 84, 31, 251, 255, 224, 31, 191, 255, 223, 191, 248, 28;
                        defb 0, 7, 255, 191, 188, 63, 253, 255, 255, 255, 255, 220, 112, 12, 1, 247, 255, 255, 252, 1, 249, 195, 238, 31, 131, 224, 31, 143, 251, 224, 51, 254;
                        defb 0, 63, 127, 3, 252, 0, 127, 255, 253, 255, 3, 255, 255, 255, 252, 127, 255, 255, 255, 255, 255, 64, 120, 0, 0, 254, 109, 11, 176, 63, 207, 151;
                        defb 0, 0, 7, 31, 135, 63, 117, 255, 255, 247, 255, 192, 127, 255, 225, 248, 64, 0, 127, 252, 7, 255, 255, 255, 255, 255, 112, 15, 252, 255, 251, 192;
                        defb 0, 1, 255, 255, 129, 5, 255, 248, 120, 0, 252, 127, 255, 193, 251, 143, 240, 255, 31, 243, 239, 252, 63, 255, 255, 3, 255, 255, 251, 253, 195, 224;
                        defb 0, 0, 0, 255, 127, 255, 0, 225, 231, 224, 112, 56, 31, 255, 128, 224, 255, 255, 63, 143, 255, 192, 255, 1, 129, 128, 224, 15, 15, 128, 15, 192;
                        defb 0, 0, 0, 0, 0, 39, 119, 129, 231, 167, 24, 9, 195, 31, 127, 252, 0, 1, 255, 249, 192, 196, 60, 0, 255, 255, 254, 0, 227, 15, 207, 192;
                        defb 0, 0, 56, 0, 127, 255, 255, 207, 225, 240, 31, 240, 2, 15, 239, 255, 224, 31, 255, 15, 192, 0, 15, 252, 135, 135, 0, 12, 227, 227, 254, 0;
                        defb 0, 0, 0, 15, 158, 0, 0, 255, 231, 135, 31, 220, 0, 42, 63, 231, 255, 255, 31, 248, 124, 31, 192, 0, 224, 31, 15, 191, 15, 191, 192, 60;
                        defb 0, 7, 112, 63, 253, 57, 255, 255, 193, 255, 1, 220, 112, 27, 0, 125, 143, 141, 240, 3, 56, 3, 254, 28, 3, 144, 31, 163, 255, 224, 120, 126;
                        defb 0, 63, 199, 239, 252, 0, 31, 255, 253, 255, 3, 255, 255, 255, 240, 63, 255, 255, 248, 127, 255, 64, 63, 240, 1, 253, 17, 11, 242, 63, 255, 199;
                        defb 0, 0, 31, 255, 143, 63, 127, 255, 255, 247, 255, 195, 255, 255, 225, 252, 0, 0, 127, 255, 0, 255, 255, 255, 255, 255, 0, 127, 255, 255, 255, 192;
                        defb 0, 3, 249, 255, 129, 15, 255, 248, 96, 0, 252, 127, 255, 207, 251, 143, 224, 255, 31, 240, 15, 252, 63, 127, 255, 3, 255, 255, 251, 255, 194, 224;
                        defb 0, 0, 0, 255, 16, 255, 3, 225, 231, 224, 112, 120, 0, 127, 128, 208, 255, 255, 31, 135, 248, 1, 195, 129, 0, 128, 240, 31, 14, 0, 15, 192;
                        defb 0, 0, 0, 0, 112, 28, 112, 1, 231, 167, 24, 0, 0, 31, 127, 124, 0, 1, 243, 249, 192, 216, 0, 0, 63, 255, 254, 128, 203, 15, 207, 192;
                        defb 0, 0, 32, 0, 117, 239, 255, 207, 192, 240, 30, 112, 3, 7, 239, 255, 224, 31, 255, 31, 192, 0, 15, 240, 0, 199, 0, 12, 227, 227, 254, 0;
                        defb 0, 0, 0, 63, 156, 253, 240, 255, 231, 135, 31, 220, 20, 126, 31, 255, 255, 255, 255, 240, 54, 31, 192, 1, 240, 127, 15, 239, 15, 63, 192, 252;
                        defb 0, 3, 240, 63, 253, 57, 253, 255, 89, 247, 1, 221, 240, 113, 0, 121, 136, 141, 241, 222, 249, 199, 255, 252, 15, 176, 31, 251, 255, 225, 254, 31;
                        defb 0, 15, 247, 255, 252, 7, 31, 255, 189, 255, 67, 255, 255, 255, 192, 15, 255, 255, 240, 63, 255, 208, 15, 255, 56, 252, 201, 11, 196, 255, 127, 255;
                        defb 0, 0, 31, 255, 143, 191, 255, 255, 255, 247, 255, 135, 255, 255, 239, 252, 0, 1, 255, 255, 192, 31, 255, 255, 15, 255, 240, 127, 255, 255, 254, 0;
                        defb 0, 0, 112, 255, 129, 31, 255, 192, 96, 160, 252, 127, 252, 7, 235, 128, 0, 56, 31, 240, 15, 252, 63, 30, 253, 3, 255, 255, 203, 191, 224, 224;
                        defb 0, 0, 0, 211, 0, 182, 199, 225, 231, 160, 48, 192, 0, 127, 0, 80, 255, 255, 31, 195, 240, 1, 129, 129, 0, 128, 252, 127, 62, 0, 15, 192;
                        defb 0, 0, 0, 3, 252, 60, 112, 1, 231, 167, 24, 1, 192, 31, 127, 63, 128, 15, 203, 249, 192, 176, 0, 0, 255, 255, 254, 128, 207, 15, 255, 192;
                        defb 0, 0, 0, 15, 117, 255, 255, 255, 199, 255, 28, 112, 0, 3, 243, 127, 192, 31, 252, 127, 192, 0, 1, 192, 0, 7, 0, 62, 224, 227, 254, 0;
                        defb 0, 15, 112, 62, 144, 253, 252, 191, 231, 135, 31, 220, 28, 15, 7, 199, 255, 255, 31, 240, 124, 124, 14, 7, 239, 244, 3, 255, 15, 63, 195, 224;
                        defb 0, 7, 192, 47, 255, 63, 255, 255, 93, 247, 1, 221, 208, 183, 2, 124, 120, 251, 193, 92, 249, 215, 251, 240, 15, 48, 28, 123, 191, 129, 255, 159;
                        defb 0, 1, 192, 63, 240, 7, 7, 255, 189, 231, 99, 255, 240, 28, 0, 0, 255, 255, 192, 15, 255, 208, 0, 60, 56, 252, 249, 11, 130, 255, 127, 252;
                        defb 0, 0, 31, 255, 245, 47, 255, 255, 255, 255, 255, 135, 255, 255, 255, 252, 64, 7, 255, 255, 248, 15, 255, 252, 15, 255, 240, 63, 254, 255, 232, 0;
                        defb 0, 3, 251, 255, 129, 63, 127, 196, 32, 128, 252, 127, 254, 119, 239, 0, 0, 0, 31, 247, 255, 252, 63, 127, 255, 3, 255, 255, 175, 191, 248, 248;
                        defb 0, 0, 0, 199, 0, 198, 207, 129, 231, 160, 56, 206, 0, 127, 0, 160, 255, 239, 231, 193, 192, 3, 129, 129, 129, 128, 255, 255, 56, 0, 15, 192;
                        defb 0, 0, 0, 3, 220, 28, 64, 1, 231, 167, 24, 128, 208, 31, 63, 159, 128, 15, 191, 249, 192, 244, 0, 0, 248, 0, 248, 128, 239, 15, 63, 192;
                        defb 0, 0, 8, 15, 124, 24, 63, 255, 199, 255, 28, 112, 0, 1, 248, 0, 192, 24, 0, 127, 192, 0, 1, 192, 0, 7, 0, 59, 224, 227, 254, 0;
                        defb 0, 15, 112, 14, 144, 253, 204, 191, 231, 135, 31, 220, 44, 23, 7, 199, 224, 63, 31, 224, 56, 112, 14, 15, 255, 208, 0, 255, 12, 63, 195, 224;
                        defb 0, 15, 103, 179, 255, 255, 255, 255, 205, 247, 15, 221, 195, 135, 14, 31, 0, 7, 221, 48, 255, 3, 255, 240, 15, 240, 28, 127, 255, 231, 255, 151;
                        defb 0, 3, 240, 63, 241, 151, 23, 255, 191, 255, 231, 255, 224, 0, 63, 0, 127, 248, 7, 3, 255, 248, 0, 253, 252, 253, 73, 27, 235, 255, 127, 252;
                        defb 0, 0, 112, 255, 193, 39, 255, 255, 240, 63, 255, 15, 255, 255, 255, 254, 0, 15, 255, 255, 255, 3, 255, 241, 193, 255, 240, 127, 254, 255, 184, 224;
                        defb 0, 3, 223, 255, 193, 63, 126, 12, 0, 0, 252, 30, 3, 255, 127, 0, 0, 0, 63, 255, 255, 254, 63, 9, 208, 7, 255, 255, 255, 191, 254, 248;
                        defb 0, 0, 0, 192, 0, 133, 95, 129, 231, 160, 56, 198, 0, 31, 0, 97, 27, 160, 231, 193, 192, 3, 129, 129, 227, 128, 255, 255, 248, 7, 239, 192;
                        defb 0, 0, 0, 3, 252, 0, 67, 225, 231, 167, 29, 224, 240, 31, 63, 207, 224, 31, 159, 249, 192, 232, 0, 2, 248, 0, 248, 7, 239, 7, 255, 192;
                        defb 0, 0, 7, 15, 255, 24, 31, 143, 199, 135, 31, 124, 0, 1, 252, 0, 192, 24, 0, 255, 192, 7, 255, 252, 0, 7, 15, 251, 224, 227, 254, 0;
                        defb 0, 15, 112, 14, 240, 253, 253, 255, 231, 135, 255, 220, 112, 13, 7, 199, 224, 63, 31, 192, 36, 112, 63, 255, 255, 212, 11, 255, 62, 255, 255, 224;
                        defb 0, 15, 31, 255, 255, 255, 255, 255, 253, 255, 11, 253, 195, 247, 206, 31, 224, 63, 221, 207, 231, 203, 255, 208, 15, 252, 12, 127, 254, 239, 251, 135;
                        defb 0, 3, 252, 15, 199, 31, 119, 255, 255, 255, 239, 252, 0, 0, 255, 227, 31, 224, 31, 192, 255, 241, 192, 124, 255, 255, 57, 27, 191, 255, 127, 252;
                        defb 0, 0, 112, 63, 209, 39, 255, 255, 128, 7, 255, 15, 255, 252, 125, 254, 0, 63, 255, 255, 255, 129, 255, 226, 0, 127, 248, 127, 254, 63, 120, 224;
                        defb 0, 3, 223, 255, 245, 127, 254, 15, 128, 0, 252, 30, 0, 255, 254, 0, 7, 192, 59, 255, 252, 254, 15, 0, 192, 15, 252, 255, 255, 191, 126, 56;
                        defb 0, 0, 0, 248, 0, 225, 127, 129, 231, 167, 152, 214, 0, 31, 124, 67, 27, 224, 135, 225, 192, 3, 129, 128, 255, 15, 255, 255, 224, 15, 239, 192;
                        defb 0, 0, 20, 0, 112, 16, 113, 225, 231, 167, 29, 224, 252, 31, 63, 255, 248, 127, 255, 249, 192, 208, 56, 15, 254, 0, 241, 31, 0, 3, 255, 192;
                        defb 0, 0, 15, 7, 255, 192, 7, 239, 199, 135, 31, 28, 0, 0, 252, 0, 255, 255, 0, 255, 128, 7, 255, 252, 0, 7, 15, 243, 224, 227, 254, 0;
                        defb 0, 7, 127, 15, 240, 249, 253, 255, 255, 135, 255, 220, 0, 21, 7, 247, 224, 63, 127, 128, 16, 240, 255, 255, 251, 144, 15, 143, 56, 255, 255, 128;
                        defb 0, 15, 31, 239, 255, 231, 255, 255, 253, 255, 3, 220, 3, 255, 224, 7, 240, 127, 29, 255, 255, 195, 251, 128, 3, 248, 12, 127, 241, 143, 251, 135;
                        defb 0, 3, 124, 0, 135, 159, 119, 255, 255, 247, 239, 240, 3, 129, 255, 224, 0, 0, 31, 224, 127, 249, 192, 124, 255, 255, 61, 11, 255, 235, 255, 0;
                        defb 0, 0, 112, 255, 193, 5, 255, 255, 129, 195, 254, 63, 255, 252, 125, 255, 0, 63, 255, 255, 255, 224, 255, 192, 0, 63, 248, 255, 254, 255, 251, 224;
                        defb 0, 3, 223, 255, 245, 255, 254, 15, 136, 31, 224, 0, 0, 253, 252, 1, 255, 252, 9, 255, 248, 254, 7, 0, 2, 31, 248, 63, 255, 255, 255, 184;
                        defb 0, 0, 0, 248, 0, 225, 124, 1, 231, 167, 24, 252, 0, 31, 126, 237, 0, 224, 135, 225, 192, 1, 195, 0, 255, 255, 255, 255, 224, 15, 207, 192;
                        defb 0, 0, 28, 0, 119, 56, 121, 195, 231, 167, 31, 192, 248, 31, 63, 255, 248, 127, 255, 231, 192, 228, 56, 31, 238, 0, 255, 31, 0, 3, 255, 192;
                        defb 0, 0, 7, 255, 255, 0, 7, 239, 199, 135, 31, 220, 0, 0, 255, 7, 255, 255, 3, 255, 0, 7, 255, 255, 128, 7, 191, 239, 243, 239, 248, 0;
                        defb 0, 7, 255, 143, 184, 59, 253, 255, 63, 135, 191, 220, 0, 23, 3, 247, 224, 63, 127, 0, 0, 192, 238, 31, 131, 224, 15, 143, 56, 224, 3, 248;
                        defb 0, 63, 63, 239, 255, 231, 255, 255, 245, 255, 67, 220, 127, 255, 255, 247, 255, 255, 127, 255, 255, 67, 251, 128, 15, 252, 14, 123, 253, 191, 255, 135;
                        defb 0, 1, 127, 159, 135, 159, 117, 191, 255, 247, 239, 224, 127, 255, 255, 248, 0, 0, 127, 240, 31, 255, 255, 255, 255, 255, 252, 15, 255, 255, 255, 128;
                        defb 0, 0, 112, 254, 1, 1, 255, 254, 1, 192, 252, 63, 255, 193, 125, 159, 240, 255, 159, 255, 255, 248, 255, 128, 0, 15, 255, 255, 255, 249, 251, 128;
                        defb 0, 3, 244, 255, 253, 255, 255, 255, 128, 63, 224, 0, 120, 61, 248, 7, 252, 63, 4, 255, 128, 254, 7, 0, 0, 127, 224, 31, 255, 255, 254, 184;
                        defb 0, 3, 240, 255, 255, 255, 255, 251, 128, 255, 224, 3, 252, 125, 240, 63, 0, 7, 198, 255, 129, 254, 7, 255, 255, 255, 3, 7, 63, 255, 255, 248;
                        defb 0, 0, 0, 15, 192, 200, 192, 12, 127, 248, 127, 15, 255, 255, 135, 195, 255, 225, 225, 31, 252, 0, 7, 157, 251, 135, 255, 193, 127, 1, 248, 0;
                        defb 0, 0, 0, 237, 128, 0, 0, 251, 240, 255, 255, 227, 255, 252, 127, 254, 7, 255, 231, 199, 199, 247, 199, 239, 143, 240, 28, 0, 34, 143, 230, 0;
                        defb 0, 0, 0, 3, 255, 255, 255, 255, 206, 248, 231, 129, 224, 245, 244, 0, 0, 0, 15, 223, 191, 255, 31, 254, 127, 255, 255, 255, 255, 255, 224, 0;
                        defb 0, 0, 0, 15, 222, 255, 255, 206, 28, 0, 0, 251, 128, 63, 255, 255, 0, 63, 127, 243, 252, 7, 247, 127, 1, 31, 255, 255, 224, 1, 192, 0;
                        defb 0, 0, 0, 190, 95, 249, 254, 124, 96, 15, 7, 237, 191, 159, 249, 131, 0, 226, 7, 255, 240, 143, 112, 255, 120, 16, 31, 255, 191, 255, 127, 192;
                        defb 0, 0, 0, 0, 15, 255, 239, 255, 239, 28, 63, 222, 127, 255, 224, 7, 192, 3, 199, 255, 255, 247, 255, 255, 143, 247, 255, 255, 239, 224, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 15, 7, 239, 255, 255, 255, 191, 255, 255, 255, 0, 0, 231, 254, 127, 220, 255, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 116, 63, 255, 191, 255, 251, 128, 255, 224, 3, 252, 119, 224, 124, 0, 3, 227, 127, 65, 254, 7, 255, 255, 255, 195, 1, 35, 227, 254, 248;
                        defb 0, 0, 0, 15, 0, 254, 224, 1, 143, 248, 255, 15, 251, 255, 131, 195, 255, 227, 225, 31, 248, 126, 7, 253, 224, 7, 232, 0, 199, 1, 56, 0;
                        defb 0, 0, 0, 231, 248, 6, 112, 251, 255, 255, 255, 227, 255, 252, 127, 252, 15, 255, 231, 199, 195, 247, 207, 239, 143, 240, 31, 1, 227, 71, 254, 0;
                        defb 0, 0, 0, 3, 254, 15, 255, 255, 242, 224, 228, 145, 255, 255, 252, 0, 0, 0, 7, 255, 191, 255, 96, 6, 143, 255, 255, 255, 191, 255, 224, 0;
                        defb 0, 0, 0, 15, 222, 255, 255, 206, 28, 4, 65, 251, 128, 63, 255, 255, 0, 63, 127, 247, 252, 7, 195, 159, 1, 135, 255, 255, 224, 1, 64, 0;
                        defb 0, 0, 0, 255, 247, 252, 126, 92, 96, 15, 1, 224, 127, 129, 224, 131, 0, 242, 28, 63, 240, 31, 0, 7, 248, 0, 15, 191, 255, 255, 255, 128;
                        defb 0, 0, 0, 0, 7, 255, 255, 255, 224, 28, 63, 194, 31, 157, 224, 0, 192, 3, 223, 255, 253, 247, 195, 192, 14, 7, 255, 255, 191, 224, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 15, 127, 255, 255, 223, 255, 191, 255, 255, 254, 29, 255, 231, 255, 255, 255, 255, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 127, 255, 255, 191, 255, 255, 255, 255, 225, 207, 252, 119, 192, 248, 31, 3, 227, 127, 7, 254, 7, 255, 191, 255, 255, 1, 119, 255, 250, 252;
                        defb 0, 0, 0, 14, 0, 255, 48, 129, 135, 248, 255, 15, 251, 255, 131, 193, 255, 131, 249, 31, 240, 126, 3, 255, 224, 7, 251, 6, 31, 1, 56, 0;
                        defb 0, 0, 0, 255, 247, 7, 240, 255, 255, 255, 255, 255, 255, 128, 127, 252, 31, 255, 224, 15, 227, 255, 143, 227, 255, 159, 31, 135, 195, 159, 126, 128;
                        defb 0, 0, 0, 0, 0, 15, 255, 255, 222, 224, 234, 31, 255, 255, 248, 0, 56, 56, 3, 255, 191, 255, 96, 30, 143, 255, 255, 255, 224, 0, 0, 0;
                        defb 0, 0, 0, 62, 112, 255, 255, 252, 0, 0, 6, 7, 128, 63, 255, 247, 131, 191, 127, 255, 252, 231, 231, 255, 248, 7, 255, 255, 224, 15, 56, 0;
                        defb 0, 0, 0, 63, 255, 255, 255, 192, 56, 3, 249, 192, 127, 255, 230, 7, 0, 0, 28, 63, 247, 28, 56, 7, 56, 4, 15, 191, 239, 255, 254, 0;
                        defb 0, 0, 0, 0, 1, 255, 255, 255, 255, 255, 255, 226, 31, 255, 248, 119, 192, 227, 252, 3, 255, 255, 195, 255, 255, 255, 255, 255, 239, 240, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 15, 119, 255, 127, 91, 240, 3, 199, 255, 255, 29, 127, 227, 255, 255, 247, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 127, 255, 255, 128, 0, 63, 255, 255, 135, 207, 252, 119, 193, 240, 63, 193, 225, 127, 255, 254, 7, 227, 143, 252, 159, 129, 20, 63, 251, 252;
                        defb 0, 0, 0, 254, 0, 254, 49, 128, 7, 248, 255, 15, 251, 255, 131, 225, 255, 135, 255, 31, 193, 255, 131, 255, 224, 7, 207, 14, 255, 0, 62, 0;
                        defb 0, 0, 0, 251, 199, 4, 176, 63, 31, 255, 255, 255, 254, 0, 115, 252, 63, 255, 240, 15, 241, 255, 143, 231, 251, 159, 31, 135, 0, 31, 120, 0;
                        defb 0, 0, 0, 0, 0, 15, 255, 248, 28, 128, 212, 62, 127, 255, 240, 3, 255, 255, 3, 255, 191, 240, 192, 51, 0, 7, 255, 255, 224, 0, 0, 0;
                        defb 0, 0, 0, 57, 124, 255, 252, 112, 0, 112, 62, 31, 240, 63, 255, 192, 243, 191, 31, 255, 248, 224, 239, 255, 248, 2, 127, 255, 238, 121, 248, 0;
                        defb 0, 0, 0, 63, 255, 255, 255, 248, 248, 1, 255, 193, 255, 191, 224, 15, 0, 12, 31, 63, 255, 31, 16, 191, 120, 61, 255, 191, 255, 255, 248, 0;
                        defb 0, 0, 0, 0, 0, 63, 127, 255, 255, 255, 255, 254, 3, 253, 248, 119, 128, 255, 240, 0, 231, 255, 3, 255, 255, 255, 255, 255, 254, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 15, 255, 255, 255, 255, 240, 123, 255, 255, 255, 255, 255, 231, 255, 255, 255, 254, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 7, 255, 247, 192, 0, 131, 255, 252, 7, 15, 252, 127, 131, 240, 127, 193, 225, 63, 255, 254, 7, 205, 239, 240, 159, 255, 0, 7, 227, 248;
                        defb 0, 0, 0, 254, 28, 252, 0, 48, 7, 248, 255, 15, 223, 255, 131, 225, 248, 15, 255, 63, 199, 255, 225, 239, 195, 135, 254, 14, 127, 1, 6, 0;
                        defb 0, 0, 0, 255, 247, 229, 247, 255, 31, 255, 255, 255, 255, 157, 243, 252, 120, 255, 248, 31, 249, 255, 159, 255, 251, 223, 31, 135, 15, 159, 248, 0;
                        defb 0, 0, 0, 0, 0, 63, 255, 248, 24, 129, 0, 120, 3, 255, 224, 3, 255, 255, 129, 255, 252, 0, 192, 60, 128, 167, 255, 255, 224, 0, 0, 0;
                        defb 0, 0, 0, 1, 124, 159, 252, 0, 0, 127, 184, 24, 240, 39, 248, 132, 255, 63, 1, 255, 252, 1, 137, 255, 112, 15, 31, 252, 238, 65, 248, 0;
                        defb 0, 0, 0, 63, 255, 255, 255, 248, 224, 248, 231, 192, 27, 191, 224, 28, 0, 15, 7, 63, 252, 31, 128, 191, 224, 63, 255, 191, 255, 255, 248, 0;
                        defb 0, 0, 0, 0, 0, 63, 255, 255, 255, 255, 255, 248, 3, 255, 255, 247, 254, 255, 240, 3, 255, 253, 15, 255, 255, 255, 255, 255, 254, 128, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 15, 255, 255, 255, 255, 240, 120, 127, 255, 251, 255, 255, 230, 31, 255, 255, 254, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 7, 255, 255, 192, 15, 131, 255, 252, 63, 15, 252, 127, 131, 224, 255, 225, 225, 63, 255, 254, 15, 223, 239, 247, 255, 250, 128, 3, 207, 240;
                        defb 0, 0, 0, 224, 28, 255, 0, 56, 0, 248, 127, 3, 223, 255, 131, 243, 248, 31, 239, 191, 199, 255, 227, 239, 131, 135, 255, 1, 254, 1, 70, 0;
                        defb 0, 0, 0, 63, 255, 255, 31, 255, 31, 255, 135, 255, 255, 191, 255, 240, 0, 7, 252, 63, 252, 255, 31, 255, 227, 192, 0, 0, 15, 255, 254, 0;
                        defb 0, 0, 0, 0, 0, 63, 255, 240, 0, 255, 0, 120, 31, 255, 224, 31, 255, 255, 193, 255, 255, 112, 192, 63, 12, 255, 255, 255, 192, 0, 0, 0;
                        defb 0, 0, 1, 248, 124, 143, 252, 112, 0, 119, 191, 120, 255, 255, 248, 128, 119, 191, 1, 255, 240, 128, 251, 254, 112, 7, 15, 252, 254, 79, 254, 0;
                        defb 0, 0, 0, 0, 108, 61, 255, 248, 224, 48, 231, 192, 31, 255, 238, 124, 1, 15, 15, 63, 253, 255, 241, 63, 248, 127, 255, 255, 255, 224, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 57, 143, 255, 191, 255, 255, 191, 192, 2, 255, 249, 15, 247, 255, 255, 254, 0, 0, 128, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 15, 127, 255, 255, 255, 255, 255, 255, 255, 251, 255, 255, 255, 255, 255, 255, 240, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 255, 156, 0, 31, 3, 191, 252, 127, 15, 252, 127, 135, 193, 255, 225, 225, 31, 255, 240, 15, 225, 158, 7, 255, 136, 128, 1, 239, 192;
                        defb 0, 0, 0, 239, 60, 255, 11, 16, 0, 254, 31, 227, 223, 255, 243, 251, 192, 63, 231, 255, 199, 255, 231, 239, 143, 135, 227, 0, 255, 15, 198, 0;
                        defb 0, 0, 0, 63, 255, 255, 31, 255, 7, 0, 0, 127, 240, 255, 255, 192, 0, 1, 255, 255, 255, 254, 63, 255, 15, 224, 0, 0, 3, 255, 254, 0;
                        defb 0, 0, 0, 3, 192, 255, 255, 14, 1, 255, 0, 0, 15, 255, 226, 127, 255, 255, 224, 255, 255, 112, 207, 191, 14, 28, 127, 255, 128, 0, 0, 0;
                        defb 0, 0, 0, 184, 127, 255, 252, 124, 70, 112, 31, 227, 255, 253, 252, 0, 254, 255, 7, 255, 241, 128, 255, 255, 0, 50, 0, 255, 255, 255, 142, 128;
                        defb 0, 0, 0, 0, 124, 60, 127, 252, 224, 35, 59, 192, 95, 255, 238, 112, 3, 15, 31, 63, 253, 240, 31, 0, 63, 255, 243, 255, 15, 224, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 8, 7, 255, 191, 254, 63, 142, 0, 2, 239, 241, 251, 247, 255, 255, 254, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 255, 248, 0, 31, 15, 255, 248, 127, 15, 252, 127, 135, 195, 255, 225, 225, 31, 255, 0, 7, 255, 187, 128, 254, 190, 128, 1, 255, 128;
                        defb 0, 0, 0, 233, 63, 127, 3, 251, 240, 255, 159, 227, 255, 255, 243, 255, 0, 255, 231, 255, 199, 255, 231, 239, 143, 247, 227, 0, 193, 111, 198, 0;
                        defb 0, 0, 0, 63, 255, 255, 255, 255, 135, 0, 224, 127, 255, 245, 255, 0, 0, 0, 63, 255, 255, 255, 255, 254, 15, 224, 127, 255, 255, 255, 254, 0;
                        defb 0, 0, 0, 3, 192, 255, 255, 14, 28, 255, 0, 0, 0, 63, 238, 127, 255, 255, 248, 255, 252, 7, 207, 255, 0, 28, 127, 255, 128, 0, 0, 0;
                        defb 0, 0, 0, 184, 31, 253, 252, 28, 6, 8, 15, 224, 62, 29, 248, 0, 255, 255, 7, 255, 241, 128, 175, 255, 0, 58, 0, 255, 63, 247, 127, 128;
                        defb 0, 0, 0, 0, 7, 252, 255, 254, 255, 125, 59, 220, 127, 255, 224, 7, 0, 4, 7, 255, 255, 241, 255, 0, 159, 255, 243, 255, 239, 224, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 255, 255, 63, 255, 227, 223, 255, 191, 255, 255, 255, 0, 2, 239, 254, 251, 220, 63, 255, 254, 0, 0, 0, 0, 0;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 0, 0, 0, 0, 0, 0, 0, 0, 0;

                        ; alternate (SCREEN$) output of attribute data:

                        defb 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 41, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40;
                        defb 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 16, 16, 16, 40, 40, 47, 40, 61, 47, 40, 40, 47, 40, 40, 40, 40, 40;
                        defb 40, 40, 40, 47, 47, 40, 47, 47, 40, 56, 16, 40, 47, 47, 47, 56, 56, 56, 40, 47, 47, 40, 40, 40, 16, 40, 47, 40, 47, 40, 40, 40;
                        defb 40, 40, 40, 47, 40, 40, 40, 40, 40, 16, 16, 40, 47, 61, 61, 56, 56, 56, 56, 61, 40, 16, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40;
                        defb 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 47, 61, 56, 16, 2, 23, 16, 16, 56, 56, 56, 40, 47, 47, 61, 56, 56, 40, 40, 24, 40;
                        defb 40, 40, 40, 40, 40, 40, 40, 40, 40, 56, 40, 47, 56, 16, 58, 23, 23, 58, 16, 23, 16, 56, 61, 40, 40, 40, 40, 40, 40, 24, 40, 40;
                        defb 40, 40, 40, 40, 40, 40, 40, 40, 40, 56, 47, 56, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 56, 47, 47, 40, 40, 40, 47, 40, 40, 40;
                        defb 40, 40, 40, 40, 40, 40, 40, 40, 24, 56, 47, 56, 24, 24, 32, 32, 32, 32, 32, 32, 24, 56, 56, 40, 40, 40, 61, 47, 61, 40, 40, 40;
                        defb 40, 40, 40, 61, 47, 61, 40, 40, 24, 56, 40, 61, 56, 56, 32, 52, 62, 62, 52, 32, 56, 56, 16, 40, 16, 40, 61, 61, 56, 56, 56, 40;
                        defb 40, 40, 47, 40, 40, 47, 8, 40, 24, 56, 40, 47, 61, 56, 32, 48, 56, 56, 48, 32, 56, 47, 40, 40, 40, 40, 61, 47, 56, 56, 8, 40;
                        defb 40, 40, 47, 40, 8, 56, 56, 40, 24, 56, 40, 40, 47, 56, 32, 32, 48, 48, 32, 32, 56, 56, 40, 40, 40, 40, 40, 40, 56, 8, 40, 40;
                        defb 40, 47, 40, 40, 32, 48, 32, 32, 24, 56, 40, 40, 47, 47, 40, 32, 16, 16, 32, 40, 47, 32, 48, 32, 40, 32, 48, 32, 8, 8, 40, 40;
                        defb 40, 40, 32, 32, 32, 32, 8, 56, 40, 8, 40, 40, 40, 40, 40, 32, 32, 32, 40, 40, 40, 32, 48, 40, 40, 32, 48, 32, 32, 56, 48, 32;
                        defb 40, 40, 32, 32, 32, 32, 32, 8, 8, 8, 8, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 48, 40, 32, 32, 32, 32, 32, 32, 40;
                        defb 40, 40, 40, 32, 32, 32, 32, 16, 16, 16, 32, 32, 32, 8, 8, 32, 32, 32, 32, 32, 32, 32, 56, 56, 16, 16, 32, 32, 8, 32, 40, 40;
                        defb 40, 40, 32, 56, 32, 32, 8, 16, 16, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 8, 8, 32, 32, 26, 26, 16, 56, 56, 8, 32, 32, 40;
                        defb 40, 40, 40, 32, 16, 16, 56, 16, 24, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 8, 32, 32, 32, 32, 16, 58, 58, 16, 16, 32, 40;
                        defb 40, 40, 40, 40, 16, 50, 16, 16, 16, 32, 32, 32, 24, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 16, 16, 50, 16, 26, 16, 24, 40;
                        defb 40, 40, 40, 40, 16, 16, 16, 16, 56, 16, 56, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 56, 24, 24, 16, 24, 16, 40, 41;
                        defb 40, 40, 40, 40, 40, 40, 56, 16, 16, 58, 16, 16, 16, 16, 32, 32, 32, 32, 32, 8, 16, 16, 58, 58, 16, 16, 16, 56, 40, 40, 41, 40;
                        defb 40, 40, 41, 32, 40, 8, 24, 24, 16, 16, 16, 16, 16, 16, 56, 16, 58, 58, 16, 32, 16, 16, 50, 58, 16, 16, 24, 8, 32, 40, 40, 40;
                        defb 40, 40, 40, 40, 40, 32, 32, 24, 16, 16, 16, 48, 32, 32, 16, 16, 16, 16, 16, 24, 16, 16, 16, 26, 16, 16, 16, 32, 32, 40, 40, 40;
                        defb 40, 40, 40, 40, 40, 40, 40, 56, 24, 24, 24, 32, 8, 32, 16, 16, 16, 24, 48, 48, 32, 8, 56, 24, 24, 24, 40, 40, 40, 40, 40, 40;
                        defb 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 8, 48, 48, 32, 56, 48, 32, 32, 32, 32, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




        if *> 64500                                     ;
                        zeuserror "out of room"         ;
        endif                                           ;








Addre0:                 equ *-1                         ;








