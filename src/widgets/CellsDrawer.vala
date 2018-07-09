using GLib.Math;
// TODO: Scrollable implementieren
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
    private double line_no_margin_factor; // part, where lines are in the margin area
    
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
        line_no_margin_factor = 0.05;
        state_array = new bool [x_cells, y_cells];
        
        draw.connect (on_draw_event);
    }
    
    private bool on_draw_event (Cairo.Context context) {
        float margin_y = (float) Math.floor(this.get_allocated_height () * margin_factor);
	    float margin_x = (float) Math.floor(this.get_allocated_width () * margin_factor);
	    int margin = (int) Math.fminf (margin_x, margin_y);// both sides have the same margin
	    
        // draw the cells
        Gdk.cairo_set_source_rgba (context, cell_colour);
	    for (int i = 0; i < x_cells; i++) {
	        for (int j = 0; j < y_cells; j++) {
                if (state_array [i, j])
                {
                    context.rectangle (margin + i * cell_width, margin + j * cell_height, cell_width, cell_height);
                }
	        }
	    }
        context.fill ();
        

        draw_lines (context);


        return true;
    }

    private void draw_lines (Cairo.Context context) {

        // bereichnung auslagern
        // we want to have a mesh effect. That's why we have margin_y/x, which so lines start more left / more above
        float margin_y_lmf = (float) Math.floor(this.get_allocated_height () * (margin_factor - line_no_margin_factor));
	    float margin_x_lmf = (float) Math.floor(this.get_allocated_width () * (margin_factor - line_no_margin_factor));
        int margin_lmf = (int) Math.fminf (margin_x_lmf, margin_y_lmf);// both sides have the same margin
        
        float margin_y = (float) Math.floor(this.get_allocated_height () * margin_factor);
	    float margin_x = (float) Math.floor(this.get_allocated_width () * margin_factor);
        int margin = (int) Math.fminf (margin_x, margin_y);// both sides have the same margin
        
        float end_margin_y = (float) Math.floor(this.get_allocated_height () * line_no_margin_factor);
        float end_margin_x = (float) Math.floor(this.get_allocated_width () * line_no_margin_factor);
        int end_margin = (int) Math.fminf (end_margin_x, end_margin_y);// both sides have the same margin

        Gdk.cairo_set_source_rgba (context, grid_colour);
        context.set_line_width (line_width);

        /* principle for verticle lines
        We have x_cells + 1 vertical lines. There are one line left of a cell and the last one right of. starts like the cells with margin_x
        on y axes we start above the cells (margin_y_lmf) for meshing effect, Then add the height of all cells
        one end_margin_y is filling the rest of margin_y_lmf (margin_y_lmf + end_margin_y = margin_y) and another one for meshing effect again.
        */
        for (int i = 0; i < x_cells + 1; i++) {
            context.move_to (margin + i * cell_width, margin_lmf);
            context.line_to (margin + i * cell_width, margin_lmf + y_cells * cell_height + 2 * end_margin);    
        }

        for (int j = 0; j < y_cells + 1; j++) {
            context.move_to (margin_lmf, margin + j * cell_height);
            context.line_to (margin_lmf + x_cells * cell_width + 2 * end_margin , margin + j * cell_height);    
        }
        
        context.stroke ();
        
        // calculate size so widget how big mesh is
        set_size_request (margin + end_margin + cell_width * x_cells, margin + end_margin + cell_height * y_cells);
    }

    
    public void change_cells (bool [,] new_cells) {
        x_cells = new_cells.length[0];
        y_cells = new_cells.length[1];
        
        state_array = new_cells;
        
        
    }
}
}
