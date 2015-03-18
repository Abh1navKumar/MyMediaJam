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
public class SubRootTree implements Serializable{
    private Map<Character, HashTree> tree;
    public SubRootTree(){
        tree = new HashMap<Character, HashTree>();
    }
    
    public void insert(File file, int index){
        HashTree ht;
        char c = Character.toLowerCase(file.getName().charAt(index));
        if(c>='a' && c<='z'){
            if(!tree.containsKey(c)){
                getTree().put(c,new HashTree());
                ht = getTree().get(c);
            }
            else{
                ht = getTree().get(c);
            }
        }
        else{
            if(!tree.containsKey('$')){
                getTree().put('$',new HashTree());
                ht = getTree().get('$');
            }
            else{
                ht = getTree().get('$');
            }
        }
        ht.insert(file, ++index);
    }
    
    public boolean delete(File file, int index){
        HashTree ht;
        char c = Character.toLowerCase(file.getName().charAt(index));
        if(c>='a' && c<='z'){
            if(getTree().containsKey(c)){
                ht = getTree().get(c);
                return ht.delete(file, ++index);
            }
            else
                return false;
        }
        else{
            if(getTree().containsKey('$')){
                ht = getTree().get('$');
                return ht.delete(file, ++index);
            }
            else
                return false;
        }
    }
    
    public ArrayList<Node> search(String file, int index){
        HashTree ht;
        ArrayList<Node> result = new ArrayList<Node>();
        char c = Character.toLowerCase(file.charAt(index));
        if(c>='a' && c<='z'){
            if(getTree().containsKey(c)){
                ht = getTree().get(c);
                result = ht.search(file, ++index);
                if(result.isEmpty()){
                    ht = getTree().get('$');
                    if(ht==null){
                        result.add(new Node());
                        return result;
                    }
                    else{
                        return ht.search('$'+file,index);
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
                ht = getTree().get('$');
                return ht.search(file, ++index);
            }
            else
                return null;
        }
    }
    
    public void inorder(){
        HashTree ht;
        for(Character c : getTree().keySet()){
            ht = getTree().get(c);
            System.out.println("Iterating over "+c+" node at sub root");
            ht.inorder();
        }
    }

    /**
     * @return the tree
     */
    public Map<Character, HashTree> getTree() {
        return tree;
    }

    /**
     * @param tree the tree to set
     */
    public void setTree(Map<Character, HashTree> tree) {
        this.tree = tree;
    }
    
    
}
