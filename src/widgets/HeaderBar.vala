namespace ConwaySpiel {
public class HeaderBar: Gtk.HeaderBar {
    Gtk.Button new_mesh_headerbarbutton;
    public signal void clicked_new_mesh (int height, int width);

    construct {
        has_subtitle = false;
        show_close_button = true;
        
        var new_mesh_popover = new Gtk.Popover (new_mesh_headerbarbutton);
        new_mesh_headerbarbutton = new Gtk.Button.from_icon_name ("document-new", Gtk.IconSize.LARGE_TOOLBAR);
        new_mesh_headerbarbutton.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);
        this.pack_end (new_mesh_headerbarbutton);
        
        
        var new_mesh_popover_grid = new Gtk.Grid ();
        new_mesh_popover_grid.margin = 6;
        new_mesh_popover_grid.margin_start = 6;
        new_mesh_popover_grid.row_spacing = 6;
        new_mesh_popover_grid.column_spacing = 12;
        
        
        var new_mesh_width = new Gtk.Entry ();
        var new_mesh_height = new Gtk.Entry ();
        
        new_mesh_popover_grid.attach (new Gtk.Label ("Height"), 1, 1, 1, 1);
        new_mesh_popover_grid.attach (new Gtk.Label ("Width"), 1, 2, 1, 1);
        new_mesh_popover_grid.attach (new_mesh_width, 2, 2, 3, 1);
        new_mesh_popover_grid.attach (new_mesh_height, 2, 1, 3, 1);
        
        
        var new_mesh_create_button = new Gtk.Button.with_label ("Create");
        new_mesh_popover_grid.attach (new_mesh_create_button, 2, 3, 2, 1);
        new_mesh_create_button.clicked.connect(() => {
            int height = int.parse(new_mesh_width.text);
            int width = int.parse(new_mesh_height.text);
                        
            clicked_new_mesh (height, width);
            new_mesh_popover.visible = false;
            
        });
        
        
        new_mesh_popover_grid.show_all ();
        
        
        
        new_mesh_popover.relative_to = new_mesh_headerbarbutton;
        new_mesh_popover.position = Gtk.PositionType.BOTTOM;
        new_mesh_popover.add (new_mesh_popover_grid);
        
        new_mesh_headerbarbutton.clicked.connect (() => {
            new_mesh_popover.visible = !new_mesh_popover.visible;
        
        });        
      
       
        
    }
    
    
    // Todo: Nur Zahlen akzeptieren
    private Gtk.Entry only_Numbers (Gtk.Entry entry) {
    
        return (entry);
    
    
    }
}
}
