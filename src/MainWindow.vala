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
        add (cellsdrawer);
        set_titlebar (headerbar);
        
        
        // natuerlich ueberarbeiten
        states = new bool [3,3];
        states[0,0] = true;
        states[0,1] = false;
        states[1,0] = false;
        states[1,1] = true;
        cellsdrawer.change_cells (states);        

    }

}
}
