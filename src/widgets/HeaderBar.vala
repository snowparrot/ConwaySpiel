namespace ConwaySpiel {
public class HeaderBar: Gtk.HeaderBar {
    Gtk.Button new_grid_headerbarbutton;

    construct {
        has_subtitle = false;
        show_close_button = true;

        new_grid_headerbarbutton = new Gtk.Button.from_icon_name ("document-new", Gtk.IconSize.LARGE_TOOLBAR);
        new_grid_headerbarbutton.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);

        
        

      //  pack_start (new_grid_headerbarbutton);
       // create_new_grid_popover ();
    }


    public void create_new_grid_popover () {
        //var new_grid_popover = new Gtk.Popover (new_grid_headerbarbutton);
        ///new_grid_popover.position = Gtk.PositionType.BOTTOM;
        //new_grid_popover.popup ();

    }
}
}
