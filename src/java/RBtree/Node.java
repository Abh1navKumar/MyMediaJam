package RBtree;


import java.awt.Color;
import java.io.File;
import java.io.Serializable;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Cj
 */
public class Node implements Serializable{
    private File file;
    private Node right;
    private Node left;
    private Node parent;
    private Color color;
    public Node(){
        this.file = null;
        this.right     = null;
        this.left      = null;
        this.color     = Color.RED;
    }
    public Node(File data) {
        this.file = data;
        this.color = Color.RED;
        this.left = left;
        this.right = right;
        if (left  != null) {
            left.parent = this;
        }
        if (right != null){
            right.parent = this;
        }
        this.parent = null;
    }

    /**
     * @return the right
     */
    public Node getRight() {
        return right;
    }

    /**
     * @param right the right to set
     */
    public void setRight(Node right) {
        this.right = right;
    }

    /**
     * @return the left
     */
    public Node getLeft() {
        return left;
    }

    /**
     * @param left the left to set
     */
    public void setLeft(Node left) {
        this.left = left;
    }

    /**
     * @return the parent
     */
    public Node getParent() {
        return parent;
    }

    /**
     * @param parent the parent to set
     */
    public void setParent(Node parent) {
        this.parent = parent;
    }

    /**
     * @return the color
     */
    public Color getColor() {
        return color;
    }

    /**
     * @param color the color to set
     */
    public void setColor(Color color) {
        this.color = color;
    }
    
    //----------------------Node Relationships-------------------------// 
    public Node getGrandparent() {
        assert this.getParent() != null; // Not the root node
        assert this.getParent().getParent() != null; // Not child of root
        return this.getParent().getParent();
    }
    
    public Node getSibling() {
        assert getParent() != null; // Root node has no sibling
        if (this == this.getParent().left)
            return this.getParent().right;
        else
            return this.getParent().left;
    }
    
    public Node getUncle() {
        assert this.getParent() != null; // Root node has no uncle
        assert this.getParent().getParent() != null; // Children of root have no uncle
        return this.getParent().getSibling();
    }
    //------------------Node Relationship Ends------------------------//

    /**
     * @return the file
     */
    public File getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(File file) {
        this.file = file;
    }

}
