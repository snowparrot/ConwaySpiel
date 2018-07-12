namespace ConwaySpiel{
public class ArrayCells : CellsService {

    private bool[,] states;
    private int width;
    private int height;


    public ArrayCells (int height, int width) {
        states = new bool[height, width];
        this.height = height;
        this.width = width;
        Object ();
    }


    public  bool get_cell_state (int x, int y) {
        return states[x,y];
    }
    public void set_cell_state (int x, int y, bool result){
        states[x,y] = result;
    }

    // Doesnt gurantee that old states are saved
    public  void set_size (int height, int width) {
        states = new bool[height, width];
        this.height = height;
        this.width = width;
    }
    

    public  void calculate () {

    }

    public  int get_width () {
        return width;
    }
    public  int get_height () {
        return height;
    }
}
}
