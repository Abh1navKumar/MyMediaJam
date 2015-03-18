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
public class RootTree implements Serializable{
    private Map<Character, SubRootTree> tree;
    public RootTree(){
        tree = new HashMap<Character, SubRootTree>();
    }
    
    public void insert(File file, int index){
        SubRootTree st;
        char c = Character.toLowerCase(file.getName().charAt(index));
        if(c>='a' && c<='z'){
            if(getTree().containsKey(c)){
                st = getTree().get(c);
                
            }
            else{
                getTree().put(c,new SubRootTree());
                st = getTree().get(c);
            }
        }
        else{
            if(!tree.containsKey('$')){
                getTree().put('$',new SubRootTree());
                st = getTree().get('$');
            }
            else{
                st = getTree().get('$');
            }
        }
        st.insert(file, ++index);
    }
    
    public boolean delete(File file, int index){
        SubRootTree st;
        char c = Character.toLowerCase(file.getName().charAt(index));
        if(c>='a' && c<='z'){
            if(getTree().containsKey(c)){
                st = getTree().get(c);
                return st.delete(file, ++index);
            }
            else
                return false;
        }
        else{
            if(getTree().containsKey('$')){
                st = getTree().get('$');
                return st.delete(file, ++index);
            }
            else
                return false;
        }
    }
    
    public ArrayList<Node> search(String file, int index){
        SubRootTree st;
        ArrayList<Node> result = new ArrayList<Node>();
        char c = Character.toLowerCase(file.charAt(index));
        if(c>='a' && c<='z'){
            if(getTree().containsKey(c)){
                st = getTree().get(c);
                result = st.search(file, ++index);
                if(result.isEmpty()){
                    st = getTree().get('$');
                    if(st==null){
                        result.add(new Node());
                        return result;
                    }
                    else{
                        return st.search('$'+file,index);
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
                st = getTree().get('$');
                return st.search(file, ++index);
            }
            else
                return null;
        }
    }
    
    public void inorder(){
        SubRootTree st;
        for(Character c : getTree().keySet()){
            st = getTree().get(c);
            System.out.
            println("------------------------------------------------");
            System.out.println("Iterating over "+c+" node at root");
            st.inorder();
        }
    }

    /**
     * @return the tree
     */
    public Map<Character, SubRootTree> getTree() {
        return tree;
    }

    /**
     * @param tree the tree to set
     */
    public void setTree(Map<Character, SubRootTree> tree) {
        this.tree = tree;
    }
    
    
}
