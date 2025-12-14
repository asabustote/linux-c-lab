#include <stdio.h>

typedef struct {
    void (*on_key)(int keycode);
    void (*on_click)(int x, int y);
} EventListener;

void key_handler(int keycode) {
    printf("Key Pressd: %d\n", keycode);
}

void click_handler(int x, int y) {
    printf("Mouse Click: (%d, %d)\n", x, y);
}

int main() {
    EventListener listener = {
        .on_key = key_handler,
        .on_click = click_handler
    };

    listener.on_key(32);
    listener.on_click(100, 200);

    return 0;
}
