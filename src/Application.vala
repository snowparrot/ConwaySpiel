
namespace ConwaySpiel {
public class MyApp : Granite.Application {

    private ConwaySpiel.CellsDrawer CellsDrawer;

    public MyApp () {
        Object (
            application_id: "com.github.snowparrot.ConwaySpiel",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var main_window = new Gtk.ApplicationWindow (this);
        main_window.default_height = 500;
        main_window.default_width = 500;
        main_window.title = "";
        
        CellsDrawer = new ConwaySpiel.CellsDrawer (2, 2);
        main_window.add (CellsDrawer);
        
        
        bool[,] cells = new bool [2,2];
        cells[0,0] = false;
        cells[0,1] = false;
        cells[1,0] = true;
        cells[1,1] = true;
        CellsDrawer.change_cells (cells);
        
        main_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new MyApp ();
        return app.run (args);
    }
}
}
