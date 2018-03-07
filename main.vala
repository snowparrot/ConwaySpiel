public class Application : Gtk.Window {
	public Application () {
		// Prepare Gtk.Window:
		this.title = "My Gtk.DrawingArea";
		this.window_position = Gtk.WindowPosition.CENTER;
		this.destroy.connect (Gtk.main_quit);
		this.set_default_size (400, 400);
		


		// The drawing area:
		Gtk.DrawingArea drawing_area = new Gtk.DrawingArea ();
		drawing_area.add_events (
            Gdk.EventMask.BUTTON_PRESS_MASK|
            Gdk.EventMask.BUTTON_RELEASE_MASK|
            Gdk.EventMask.POINTER_MOTION_MASK|
            Gdk.EventMask.KEY_PRESS_MASK|
            Gdk.EventMask.KEY_RELEASE_MASK|
            Gdk.EventMask.LEAVE_NOTIFY_MASK
);

		drawing_area.button_press_event.connect ((event) => {
            
			if (event.x > 25 && event.x < 75 && event.y > 25 && event.y < 75 ) {
				stdout.printf("mouse click \n");
			}
			
            return false;
        });


		drawing_area.draw.connect ((context) => {
			// Get necessary data:
			weak Gtk.StyleContext style_context = drawing_area.get_style_context ();
			int height = 50;
			int width = 50;
			Gdk.RGBA color = new Gdk.RGBA ();
			color.parse("#0000FF");

			// Draw an arc:
			double xc = width / 2.0;
			double yc = height / 2.0;
			double radius = int.min (width, height) / 2.0;
			double angle1 = 0;
			double angle2 = 2*Math.PI;

			//context.arc (xc, yc, radius, angle1, angle2);
			context.rectangle (xc, yc, 50, 50);
			



			Gdk.cairo_set_source_rgba (context, color);
			context.fill ();
			return true;
		});
		this.add (drawing_area);
	}

	public static int main (string[] args) {
		Gtk.init (ref args);

		Application app = new Application ();
		app.show_all ();
		Gtk.main ();
		return 0;
	}
}
