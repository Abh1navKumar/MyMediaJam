/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package RBtree;

import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Cj
 */
public class HashTree implements Serializable{
    private Map<Character, RBTree> tree;
    public HashTree(){
        tree = new HashMap<Character, RBTree>();
    }
    
    public void insert(File file, int index){
        RBTree rbt;
        char c = Character.toLowerCase(file.getName().charAt(index));
        if(c>='a' && c<='z'){
            if(!tree.containsKey(c)){
                getTree().put(c,new RBTree());
                rbt = getTree().get(c);
            }
            else{
                rbt = getTree().get(c);
            }
        }
        else{
            if(!tree.containsKey('$')){
                getTree().put('$',new RBTree());
                rbt = getTree().get('$');
            }
            else{
                rbt = getTree().get('$');
            }
        }
        rbt.insert(file, ++index);
    }
    
    public boolean delete(File file, int index){
        RBTree rbt;
        char c = Character.toLowerCase(file.getName().charAt(index));
        if(c>='a' && c<='z'){
            if(getTree().containsKey(c)){
                rbt = getTree().get(c);
                return rbt.delete(file, ++index);
            }
            else
                return false;
        }
        else{
            if(getTree().containsKey('$')){
                rbt = getTree().get('$');
                return rbt.delete(file, ++index);
            }
            else
                return false;
        }
    }
    
    public ArrayList<Node> search(String file, int index){
        RBTree rbt;
        ArrayList<Node> result = new ArrayList<Node>();
        char c = Character.toLowerCase(file.charAt(index));
        if(c>='a' && c<='z'){
            if(getTree().containsKey(c)){
                rbt = getTree().get(c);
                result = rbt.search(file, ++index);
                if(result.isEmpty()){
                    rbt = getTree().get('$');
                    if(rbt==null){
                        result.add(new Node());
                        return result;
                    }
                    else{
                        return rbt.search_special('$'+file,index);
                        
                    }
                }
                else{
                     return result;
                }
            }
            else
                return result;
        }
        else{
            if(getTree().containsKey('$')){
                rbt = getTree().get('$');
                return rbt.search(file, ++index);
            }
            else
                return null;
        }
    }
    
    public void inorder(){
        RBTree rbt;
        for(Character c : getTree().keySet()){
            rbt = getTree().get(c);
            if(!rbt.isEmpty()){
                System.out.println("Iterating over "+c+" node at first child");
                System.out.
                println("------------------------------------------------");
                rbt.inorder();
            }
        }
    }

    /**
     * @return the tree
     */
    public Map<Character, RBTree> getTree() {
        return tree;
    }

    /**
     * @param tree the tree to set
     */
    public void setTree(Map<Character, RBTree> tree) {
        this.tree = tree;
    }
    
    
}
