namespace ConwaySpiel{
public class MainWindow: Gtk.ApplicationWindow {

    private ConwaySpiel.CellsDrawer cellsdrawer;
    private ConwaySpiel.HeaderBar headerbar;



    private bool [,] states;


    public MainWindow (Gtk.Application application) {
        Object (application: application);
    }    

    construct {
    
        default_height = 500;
        default_width = 500;
        title = "";

        cellsdrawer = new ConwaySpiel.CellsDrawer (3, 3);
        headerbar = new ConwaySpiel.HeaderBar ();
        set_titlebar (headerbar);
        
        headerbar.clicked_new_mesh.connect (new_cells);
        
        var scrolledWindow = new Gtk.ScrolledWindow (null, null);
        scrolledWindow.expand = true;
	    scrolledWindow.add_with_viewport (cellsdrawer);   

        add (scrolledWindow);
     
        // natuerlich ueberarbeiten
        states = new bool [20,20];
        states[0,0] = true;
        states[0,1] = false;
        states[1,0] = false;
        states[1,1] = true;
        cellsdrawer.change_cells (states);  

        cellsdrawer.on_clicked_cell.connect ((s, x, y) => {
            states[x,y] = !states[x,y];
            cellsdrawer.change_cells (states);  
            cellsdrawer.queue_draw ();
        });      
    }
    
    private void new_cells (int height, int width) {
                   
        states = new bool[height, width];
        states[0, 1] = true;
        cellsdrawer.change_cells (states);
        cellsdrawer.queue_draw ();
    }

}
}
