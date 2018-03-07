
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
        var main_window = new ConwaySpiel.MainWindow (this);
        
        main_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new MyApp ();
        return app.run (args);
    }
}
}
