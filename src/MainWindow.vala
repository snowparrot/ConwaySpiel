namespace ConwaySpiel{
public class MainWindow: Gtk.ApplicationWindow {

    private ConwaySpiel.CellsDrawer CellsDrawer;



    private bool [,] states;


    public MainWindow (Gtk.Application application) {
        Object (application: application);
    }    

    construct {
    
        default_height = 500;
        default_width = 500;
        title = "";

        CellsDrawer = new ConwaySpiel.CellsDrawer (2, 2);
        add (CellsDrawer);
        
        // natuerlich ueberarbeiten
        states = new bool [2,2];
        states[0,0] = false;
        states[0,1] = true;
        states[1,0] = false;
        states[1,1] = true;
        CellsDrawer.change_cells (states);        

    }

}
}
