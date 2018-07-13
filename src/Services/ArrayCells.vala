namespace ConwaySpiel{
public class ArrayCells : Object, CellsService {
    // states array has 1 cell padding for better calculating
    private bool[,] states;
    private int width;
    private int height;


    public ArrayCells (int height, int width) {
        // padding on both sides => plus 2
        states = new bool[height + 2, width + 2];
        this.height = height;
        this.width = width;
        Object ();
    }


    public  bool get_cell_state (int x, int y) {
        return states[x + 1,y + 1];
    }
    public void set_cell_state (int x, int y, bool result){
        states[x + 1,y + 1] = result;
    }

    // Doesnt gurantee that old states are saved
    public  void set_size (int height, int width) {
        states = new bool[height + 2, width + 2];
        this.height = height;
        this.width = width;
    }
    

    public void calculate () {
        // Saves which empty cells have been visited
        Gee.TreeSet<int[]> visited_cells = new Gee.TreeSet<int[]> ();
        for (int y = 0; y < get_width (); y++) {
            for (int x = 0; x < get_height (); x++) {
                if (states[x + 1, y + 1]) {
                    int i = count_neighbours(x + 1, y + 1);
                    // checking if cell is dead or alive
                    states[x + 1, y + 1] = (i < 2 || i > 3);
                    // now checking if neigbours cells might become alive     
                    for (int xi = x - 1; xi < x + 2; xi++) {
                        for (int yi = y - 1; yi < y + 2; yi++) {
                            if (!visited_cells.contains({xi + 1, yi + 1})) {
                                int j = count_neighbours(xi + 1, yi + 1);
                                // born
                                states[xi + 1, yi + 1] = (j == 3);
                                visited_cells.add({xi + 1, yi + 1});
                            }
                        }
                    }
                }
            }
        }
    }

    public  int get_width () {
        return width;
    }
    public  int get_height () {
        return height;
    }

    private int count_neighbours (int x, int y) {
        int i = 0;        
        for (int xi = x - 1; xi < x + 2; xi++) {
            for (int yi = y - 1; yi < y + 2; yi++) {
                if (states [xi, yi]) {
                    i++;
                }
            }
        }
       return i;
    }
}
}
