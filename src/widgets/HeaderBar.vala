namespace ConwaySpiel {
public class HeaderBar: Gtk.HeaderBar {
    Gtk.Button new_mesh_headerbarbutton;

    construct {
        has_subtitle = false;
        show_close_button = true;

        new_mesh_headerbarbutton = new Gtk.Button.from_icon_name ("document-new", Gtk.IconSize.LARGE_TOOLBAR);
        new_mesh_headerbarbutton.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);
        this.pack_end (new_mesh_headerbarbutton);
        
        
        var new_mesh_popover_grid = new Gtk.Grid ();
        
        var new_mesh_width = new Gtk.Entry ();
        var new_mesh_height = new Gtk.Entry ();
        
        new_mesh_popover_grid.attach (new Gtk.Label ("Height"), 1, 1, 1, 1);
        new_mesh_popover_grid.attach (new Gtk.Label ("Width"), 1, 2, 1, 1);
        new_mesh_popover_grid.attach (new_mesh_width, 2, 2, 3, 1);
        new_mesh_popover_grid.attach (new_mesh_height, 2, 1, 3, 1);
        
        new_mesh_popover_grid.attach (new Gtk.Button.with_label ("1"), 1, 3, 2, 1);
        new_mesh_popover_grid.show_all ();
        
        
        var new_mesh_popover = new Gtk.Popover (new_mesh_headerbarbutton);
        new_mesh_popover.relative_to = new_mesh_headerbarbutton;
        new_mesh_popover.position = Gtk.PositionType.BOTTOM;
        new_mesh_popover.add (new_mesh_popover_grid);
        
        new_mesh_headerbarbutton.clicked.connect (() => {
            new_mesh_popover.visible = !new_mesh_popover.visible;
        
        });        
      
       
        
    }
}
}
