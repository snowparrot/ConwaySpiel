interface CellsService {
        
    public abstract bool get_cell_state (int x, int y);
    public abstract bool set_cell_state (int x, int y, bool result);
    
    
    public abstract void calculate ();


}
