package RBtree;


import java.awt.Color;
import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Cj
 */
public class RBTree implements Serializable{
    /**      
    * @param args the command line arguments
    */
    public static final boolean VERIFY_RBTREE = true;
    private Node root;
    
    public RBTree(){
        root = null;
        verifyProperties();
    }

//***********************------------Verifying Properties of RB Tree------------************************//
    
    public void verifyProperties() {
        if (VERIFY_RBTREE) {
            verifyProperty1(root);
            verifyProperty2(root);
            // Property 3 is implicit
            verifyProperty4(root);
            verifyProperty5(root);
        }
    }
    
    //  1.Each node is either red or black:
    private static void verifyProperty1(Node node) {
        assert nodeColor(node) == Color.RED || nodeColor(node) == Color.BLACK;
        if (node == null) return;
        verifyProperty1(node.getLeft());
        verifyProperty1(node.getRight());
    }
    
    //  2.The root node is black:
    private static void verifyProperty2(Node root) {
        assert nodeColor(root) == Color.BLACK;
    }
    
    //  3.All leaves are black and contain no data:
    private static Color nodeColor(Node node) {
        if(node==null){
            return Color.BLACK;
        }
        else{
            return node.getColor();
            }
    }
    
    //  4.Every red node has two children, and both are black (or equivalently, the parent of every red node is black):
    private static void verifyProperty4(Node node) {
        if (nodeColor(node) == Color.RED) {
            assert nodeColor(node.getLeft())== Color.BLACK;
            assert nodeColor(node.getRight())  == Color.BLACK;
            assert nodeColor(node.getParent()) == Color.BLACK;
         }
        if (node == null)   return;
        verifyProperty4(node.getLeft());
        verifyProperty4(node.getRight());
    }
    
    //  5.All paths from any given node to its leaf nodes contain the same number of black nodes:
    private static void verifyProperty5(Node root) {
        verifyProperty5Helper(root, 0, -1);
    }
    
    //We do it by traversing the tree, incrementing a black node count as we go. The first time we reach a leaf we save the count.
    //We return the count so that when we subsequently reach other leaves.At last we compare the count to the saved count.
    private static int verifyProperty5Helper(Node node, int blackCount, int pathBlackCount) {
        if (nodeColor(node) == Color.BLACK) {
            blackCount++;
         }
        if (node == null) {
            if (pathBlackCount == -1) {
                pathBlackCount = blackCount;
            } 
            else {
                assert blackCount == pathBlackCount;
            }
            return pathBlackCount;
        }
        pathBlackCount = verifyProperty5Helper(node.getLeft(),  blackCount, pathBlackCount);
        pathBlackCount = verifyProperty5Helper(node.getRight(), blackCount, pathBlackCount);
        return pathBlackCount;
    }
    //!!!!!!--------------------------Verification Finished---------------------------!!!!!!!!//
    
    
    
//***********************-------Operations in RB Tree---------*****************************//
    
    // A search function that gets a pointer to the node with a given key. 
    //If the key is not found, it returns null. This will be useful later for deletion: 
    public Node search(File file, int index){
        Node node = search(root, file, index);
        if(node==null){
            return null;
        }
        else {
            return node;
        }
    }
    
    private Node search(Node node, File file, int index){
        char c = Character.toLowerCase(file.getName().charAt(index));
        char v = Character.toLowerCase(node.getFile().getName().charAt(index));
        while(node!=null ){    
            if(c==v){
                return node;
            }
            if(c<v){
                node = node.getLeft();
            }
            else if(c>v){
                node = node.getRight();
            }
        }
        return node;
    }
    
    public ArrayList<Node> search(String file, int index){
        ArrayList<Node> result = new ArrayList();
        search(root, file, index, result);
        return result;
    }
    
    private ArrayList<Node> search(Node node, String file, int index, ArrayList<Node> result){
        char c = Character.toLowerCase(file.charAt(index));
        while(node!=null ){   
            char v = Character.toLowerCase(node.getFile().getName().charAt(index));
            if(c==v){
                result.add(node);
                if(node.getLeft()!=null){
                    search(node.getLeft(),file,index,result);
                }
                if(node.getRight()!=null){
                    search(node.getRight(),file,index,result);
                }
                return result;
            }
            if(c<v){
                node = node.getLeft();
            }
            else if(c>v){
                node = node.getRight();
            }
        }
        return result;
    }
    
    public ArrayList<Node> search_special(String file, int index){
        ArrayList<Node> result = new ArrayList();
        search_special(root, file, index, result);
        return result;
    }
    
    private ArrayList<Node> search_special(Node node, String file, int index, ArrayList<Node> result){
        String c = file.substring(index).toLowerCase();
        String v = node.getFile().getName().toLowerCase();
        while(node!=null ){    
            if(v.contains(c)){
                result.add(node);
            }
            if(node.getLeft()!=null){
                search_special(node.getLeft(),file,index,result);
            }
            if(node.getRight()!=null){
                search_special(node.getRight(),file,index,result);
            }
            return result;
        }
        return result;
    }
    //!!!!-------------------------------Search Finished-----------------------------!!!!//
    
//***************---------------------Rotations-----------------------------------************************//
    private void rotateLeft(Node node) {
        Node right = node.getRight();
        replaceNode(node, right);
        node.setRight(right.getLeft()); 
        if (right.getLeft()!= null) {
            right.getLeft().setParent(node);
        }
        right.setLeft(node); 
        node.setParent(right);
    }

    private void rotateRight(Node node) {
        Node left = node.getLeft();
        replaceNode(node, left);
        node.setLeft(left.getRight());
        if (left.getRight()!= null) {
            left.getRight().setParent(node);
        }
        left.setRight(node);
        node.setParent(left);
    }   
      
    private void replaceNode(Node oldn, Node newn) {
        if (oldn.getParent() == null) {
            root = newn;
        } 
        else {
            if (oldn == oldn.getParent().getLeft())
                oldn.getParent().setLeft(newn);
            else
                oldn.getParent().setRight(newn);
        }
        if (newn != null) {
            newn.setParent(oldn.getParent());
        }
    }
    //!!!!!!!!!---------------------------Roation Finished----------------------------!!!!!!!!!!//
    

//*********************-------------------Insertion-----------------------*******************************//
    public void insert(File file, int index) {
        Node insertedNode = new Node(file);
        if (root == null) {
            root = insertedNode;
        } 
        else {
            Node node = root;
            while (true) {
                char c = Character.toLowerCase(file.getName().charAt(index));
                char v = Character.toLowerCase(node.getFile().getName().charAt(index));
                if (c==v){
                    if (node.getLeft()==null) {
                        node.setLeft(insertedNode);
                        break;
                    } 
                    else {
                        node = node.getLeft();
                    }
                }  
                else if (c<v) {
                    if (node.getLeft()==null) {
                        node.setLeft(insertedNode);
                        break;
                    } 
                    else {
                        node = node.getLeft();
                    }
                } 
                else {
                    assert c>v;
                    if (node.getRight() == null) {
                        node.setRight(insertedNode);
                        break;
                    } 
                    else {
                        node = node.getRight();
                    }
                }
            }
            insertedNode.setParent(node);
        }
        insertCase1(insertedNode);
        verifyProperties();
    }
    
    //Case 1: In this case, the new node is now the root node of the tree. 
    //Since the root node must be black, and changing its color adds the same number of black nodes to every path,
    //we simply recolor it black. Because only the root node has no parent, 
    private void insertCase1(Node node) {
        if (node.getParent() == null){
            node.setColor(Color.BLACK);
        }
        else{
            insertCase2(node);
        }
    }
    
    //Case 2: In this case, the new node has a black parent.
    private void insertCase2(Node node) {
         if (nodeColor(node.getParent())==Color.BLACK)
             return; // Tree is still valid
        else
            insertCase3(node);
    }
    
    //Case 3: If the uncle node is red. We recolor the parent and uncle black and the grandparent red. 
    //However, the red grandparent node may now violate the red-black tree properties; 
    //So we recursively invoke this procedure on it from case 1 to deal with this.
    void insertCase3(Node node) {
        if (nodeColor(node.getUncle())==Color.RED) {
            node.getParent().setColor(Color.BLACK);
            node.getUncle().setColor(Color.BLACK);
            node.getGrandparent().setColor(Color.RED);
            insertCase1(node.getGrandparent());
        } 
        else {
            insertCase4(node);
        }
    }
    
    //Case 4: In this case, we deal with two cases that are mirror images of one another:
    //        1. The new node is the right child of its parent and the parent is the left child of the grandparent. In this case we rotate left about the parent.
    //        2. The new node is the left child of its parent and the parent is the right child of the grandparent. In this case we rotate right about the parent.
    //Neither of these fixes the properties, but they put the tree in the correct form to apply case 5
    void insertCase4(Node node) {
        if (node == node.getParent().getRight() && node.getParent() == node.getGrandparent().getLeft()) {
            rotateLeft(node.getParent());
            node = node.getLeft();
        }
        else if (node == node.getParent().getLeft() && node.getParent() == node.getGrandparent().getRight()) {
            rotateRight(node.getParent());
            node = node.getRight();
        }
        insertCase5(node);
    }
    
    //Case 5: In this final case, we deal with two cases that are mirror images of one another:
    //        1. The new node is the left child of its parent and the parent is the left child of the grandparent.
    //           In this case we rotate right about the grandparent.
    //        2. The new node is the right child of its parent and the parent is the right child of the grandparent. 
    //           In this case we rotate left about the grandparent.
    void insertCase5(Node node) {
        node.getParent().setColor(Color.BLACK);
        node.getGrandparent().setColor(Color.RED);
        if (node == node.getParent().getLeft() && node.getParent() == node.getGrandparent().getLeft()) {
            rotateRight(node.getGrandparent());
        } 
        else {
            assert node == node.getParent().getRight() && node.getParent() == node.getGrandparent().getRight();
            rotateLeft(node.getGrandparent());
        }
    }
    //Now the properties are satisfied and all cases have been covered.
    //!!!!!!!!!!!!!!!!!!!!!!!!!------------Insertion Finished--------------------!!!!!!!!!!!!!!!!!!!!!!!//
    
//****************************--------------Deletion-----------------------------*****************************//
    //We begin by finding the node to be deleted with lookupNode() and deleting it precisely as we would in a binary search tree. 
    //There are two cases for removal, depending on whether the node to be deleted has at most one, or two non-leaf children. 
    //A node with at most one non-leaf child can simply be replaced with its non-leaf child. When deleting a node with two non-leaf
    //children, we copy the value from the in-order predecessor (the maximum or rightmost element in the left subtree) 
    //into the node to be deleted, and then we then delete the predecessor node, which has only one non-leaf child. 
    //This same procedure also works in a red-black tree without affecting any properties.
    public boolean isEmpty(){
        return root==null;
    }
    
    public boolean delete(File file, int index){
        if(isEmpty()){
            return false;
        }
        else if(search(file, index)==null){
            return false;
        }
        else{
            Node node = search(file, index);
            System.out.println("To Delete :"+node.getFile().getName()+" with "+node.getColor());
            delete(node, file);
            return true;
        }
    }
    
    
    private void delete(Node node,File file) {
        if (node.getLeft() != null && node.getRight() != null) {
            // Copy data from predecessor and then delete it instead
            //System.out.println("I m here");
            Node pred = maximumNode(node.getLeft());
            //node.setFile_path(pred.getFile_path());
            node = pred;
        }
        //System.out.println("now node :"+node.getFile_path());
        //System.out.println("Node left :"+node.getLeft());
        //System.out.println("Node Right :"+node.getRight());
        assert node.getLeft()==null || node.getRight()== null;
        Node child;
        //System.out.println(node.getRight());
        if(node.getRight() == null){
           child = node.getLeft()  ;
           //System.out.println("Child's left Found");
       }
        else{
            child = node.getRight();
            //System.out.println("Child's Right Found");
        }
       if (nodeColor(node)== Color.BLACK) {
            node.setColor(nodeColor(child));
            deleteCase1(node);
        }
       replaceNode(node, child);
       verifyProperties();
    }
    
    
    
    //The maximumNode() function just walks right until it reaches the last non-leaf:
    private static Node maximumNode(Node node) {
        assert node != null;
        while (node.getRight() != null) {
            node = node.getRight();
        }
        return node;
    }
    //-----------------------------Deletion Cases-----------------------------------//
    
    //Case 1: In this case, N has become the root node. The deletion removed one black node from every path, 
    //so no properties are violated.
    private void deleteCase1(Node node) {
        if (node.getParent() == null)
            return;
        else
            deleteCase2(node);
    }
    
    //Case 2: N has a red sibling. In this case we exchange the colors of the parent and sibling, then rotate about the parent 
    //so that the sibling becomes the parent of its former parent. 
    private void deleteCase2(Node node) {
        if (nodeColor(node.getSibling()) == Color.RED) {
            node.getParent().setColor(Color.RED);
            node.getSibling().setColor(Color.BLACK);
            if (node == node.getParent().getLeft())
                rotateLeft(node.getParent());
            else
                rotateRight(node.getParent());
        }
        deleteCase3(node);
    }
    
    //Case 3: In this case N's parent, sibling, and sibling's children are black. In this case we paint the sibling red. 
    //Now all paths passing through N's parent have one less black node than before the deletion, 
    //so we must recursively run this procedure from case 1 on N's parent.
    private void deleteCase3(Node node) {
        if (nodeColor(node.getParent())== Color.BLACK &&
            nodeColor(node.getSibling()) == Color.BLACK &&
            nodeColor(node.getSibling().getLeft()) == Color.BLACK &&
            nodeColor(node.getSibling().getRight()) == Color.BLACK)
        {
            node.getSibling().setColor(Color.RED);
            deleteCase1(node.getParent());
        }
        else
            deleteCase4(node);
    }
    
    //Case 4: N's sibling and sibling's children are black, but its parent is red.We exchange the colors of the sibling and parent; 
    // this restores the tree properties.
    private void deleteCase4(Node node) {
        if (nodeColor(node.getParent())== Color.RED &&
            nodeColor(node.getSibling()) == Color.BLACK &&
            nodeColor(node.getSibling().getLeft()) == Color.BLACK &&
            nodeColor(node.getSibling().getRight()) == Color.BLACK)
        {
            node.getSibling().setColor(Color.RED);
            node.getParent().setColor(Color.BLACK);
        }
        else{
            deleteCase5(node);
        }
    }
    
    //Case 5: There are two cases handled here which are mirror images of one another:
    //        1. N's sibling S is black, S's left child is red, S's right child is black, and N is the left child of its parent. 
    //           We exchange the colors of S and its left sibling and rotate right at S.
    //        2. N's sibling S is black, S's right child is red, S's left child is black, and N is the right child of its parent. 
    //           We exchange the colors of S and its right sibling and rotate left at S.
    private void deleteCase5(Node node) {
        if (node == node.getParent().getLeft() &&
            nodeColor(node.getSibling()) == Color.BLACK &&
            nodeColor(node.getSibling().getLeft()) == Color.RED &&
            nodeColor(node.getSibling().getRight()) == Color.BLACK)
        {
            node.getSibling().setColor(Color.RED);
            node.getSibling().getLeft().setColor(Color.BLACK); 
            rotateRight(node.getSibling());
        }
        else if (node == node.getParent().getRight() &&
             nodeColor(node.getSibling()) == Color.BLACK &&
             nodeColor(node.getSibling().getRight()) == Color.RED &&
             nodeColor(node.getSibling().getLeft()) == Color.BLACK)
        {
            node.getSibling().setColor(Color.RED);
            node.getSibling().getRight().setColor(Color.BLACK);
            rotateLeft(node.getSibling());
        }
        deleteCase6(node);
    }
    
    //Case 6: There are two cases handled here which are mirror images of one another:
    //        1. N's sibling S is black, S's right child is red, and N is the left child of its parent. 
    //           We exchange the colors of N's parent and sibling, make S's right child black, then rotate left at N's parent.
    //        2. N's sibling S is black, S's left child is red, and N is the right child of its parent. 
    //           We exchange the colors of N's parent and sibling, make S's left child black, then rotate right at N's parent.
    //This accomplishes three things at once:
    //        1. We add a black node to all paths through N, either by adding a black S to those paths or by recoloring N's parent
    //           black.
    //        2. We remove a black node from all paths through S's red child, either by removing P from those paths or by 
    //           recoloring S.
    //        3. We recolor S's red child black, adding a black node back to all paths through S's red child.
    //S's left child has become a child of N's parent during the rotation and so is unaffected.
    private void deleteCase6(Node node) {
        node.getSibling().setColor(nodeColor(node.getParent()));
        node.getParent().setColor(Color.BLACK);
        if (node == node.getParent().getLeft()) {
            assert nodeColor(node.getSibling().getRight()) == Color.RED;
            node.getSibling().getRight().setColor(Color.BLACK);
            rotateLeft(node.getParent());
        }
        else{
            assert nodeColor(node.getSibling().getLeft()) == Color.RED;
            node.getSibling().getLeft().setColor(Color.BLACK);
            rotateRight(node.getParent());
        }
    }
    //!!!!!!!!!!!!!---------------------------Deletion Finished-----------------------------------!!!!!!!!//
    
    public int countNodes(){
        return countNodes(root);
    }
    
    private int countNodes(Node node){
        if (node==null){
            return 0;
        }
        else{
            int count = 1;
            count += countNodes(node.getLeft());
            count += countNodes(node.getRight());
            return count;
        }
    }
    
    public void inorder(){
        inorder(root);
    }
    
    private void inorder(Node node){
        if(node!=null){
            inorder(node.getLeft());
            System.out.println(node.getFile().getName()+":"+node.getColor());
            inorder(node.getRight());
        }
    }
}
