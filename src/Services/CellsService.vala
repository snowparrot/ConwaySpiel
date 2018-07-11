namespace ConwaySpiel{
interface CellsService {


        
    public abstract bool get_cell_state (int x, int y);
    public abstract bool set_cell_state (int x, int y, bool result);

    // Doesnt gurantee that old states are saved
    public abstract void set_size (int height, int width);
    

    public abstract void calculate ();

    public abstract int get_width ();
    public abstract int get_height ();

}
}
