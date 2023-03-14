//leave this in the second screen hahaha


#include <gtk/gtk.h>
#include <string.h>

int mapToDisplayVariable(int x) {
    return x * 0xF / 100;
}

// Declare the function before using it
void on_slider_value_changed(GtkRange *range, gpointer user_data);

void activate(GtkApplication* app, gpointer user_data) {
    GtkWidget *window;
    GtkWidget *slider;

    window = gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), "Slider Demo");
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 100);

    slider = gtk_scale_new_with_range(GTK_ORIENTATION_HORIZONTAL, 0, 100, 1);
    gtk_container_add(GTK_CONTAINER(window), slider);

    // Use the declared function in g_signal_connect
    g_signal_connect(slider, "value-changed", G_CALLBACK(on_slider_value_changed), user_data);

    gtk_widget_show_all(window);
}

// Define the function after the activate function
void on_slider_value_changed(GtkRange *range, gpointer user_data) {
    char command[100];
    gdouble value = gtk_range_get_value(range);

    int variable = value;
    char hex[17];

    g_print("Slider value changed to %f\n", value);



    //sprintf(command, "echo '%s' ", interpolate(variable));
    sprintf(command, "echo '\\_SB.ATKD.WMNB 0x0 0x53564544 b32000500%XF000000' | sudo tee /proc/acpi/call", mapToDisplayVariable(variable)); //| sudo tee /proc/acpi/call
    system(command);
    g_print(command);


    /*
    snprintf(command, sizeof(command), "echo '%g'", value);
    system(command);
    */
}

int main(int argc, char **argv) {
    GtkApplication *app;
    int status;

    app = gtk_application_new("com.example.sliderexample", G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
    status = g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    return status;
}
