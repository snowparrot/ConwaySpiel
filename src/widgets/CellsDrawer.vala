using GLib.Math;
namespace ConwaySpiel {
public class CellsDrawer: Gtk.DrawingArea {

    private int x_cells;
    private int y_cells;
    
    private bool cells_not_drawn; // shows if CellsDrawer is too small to draw all Cells
    
    private int cell_width;
    private int cell_height;
    
    private bool show_grid;
    
    private Gdk.RGBA cell_colour;
    private Gdk.RGBA grid_colour;
    private double margin_factor; // part of cells drawer size where we wont draw
    private double line_width;
    
    private int scaling_factor; // for hdpi
    
    private bool[,] state_array;
    
    public CellsDrawer (int x_cells, int y_cells) {
        Object();
        this.x_cells = x_cells;
        this.y_cells = y_cells;
        
        state_array = new bool [x_cells, y_cells];
    }
    
    construct {
        cells_not_drawn = false;
        show_grid = false;
    
        // spater in design.vala auslagern!
        cell_colour.parse("#000000");
        grid_colour.parse("#0000FF");
        line_width = 3; 
        
        cell_width = 50; //verbessern
        cell_height = 50; //#verbessern
    
        this.add_events (
            Gdk.EventMask.BUTTON_PRESS_MASK|
            Gdk.EventMask.BUTTON_RELEASE_MASK|
            Gdk.EventMask.POINTER_MOTION_MASK|
            Gdk.EventMask.KEY_PRESS_MASK|
            Gdk.EventMask.KEY_RELEASE_MASK|
            Gdk.EventMask.LEAVE_NOTIFY_MASK
        );
        
        scaling_factor = 1;
        margin_factor = 0.1;
        state_array = new bool [x_cells, y_cells];
        
        draw.connect (on_draw_event);
    }
    
    private bool on_draw_event (Cairo.Context context) {
        int margin_y = (int) Math.floor((this.get_allocated_height () * margin_factor));
	    int margin_x = (int) Math.floor((this.get_allocated_width () * margin_factor));
	    
        // draw the cells
        Gdk.cairo_set_source_rgba (context, cell_colour);
	    for (int i = 0; i < x_cells; i++) {
	        for (int j = 0; j < y_cells; j++) {
                if (state_array [i, j])
                {
                    context.rectangle (margin_x + i * cell_width, margin_y + j * cell_height, cell_width, cell_height);
                }
	        }
	    }
        context.fill ();
        

        // TODO: Gitter malen
        // TODO: Auf Git hochladen
        Gdk.cairo_set_source_rgba (context, grid_colour);
        context.set_line_width (3);
        context.move_to (30, 50);
        context.line_to (70, 100);
        
        context.stroke ();



        return true;
    }
    
    public void change_cells (bool [,] new_cells) {
        if (new_cells.length[0] != x_cells && new_cells.length[1] != y_cells) {
            return;   
        }
        state_array = new_cells;
    }
}
}
