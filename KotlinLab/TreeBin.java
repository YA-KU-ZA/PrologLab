import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

class TreeNode {
    String value;
    TreeNode left;
    TreeNode right;

    TreeNode(String value) {
        this.value = value;
        this.left = null;
        this.right = null;
    }
}

class BinaryTree {
    TreeNode root;

    BinaryTree() {
        this.root = null;
    }

    void insert(String value, Comparator<String> comparator) {
        root = insertRec(root, value, comparator);
    }

    private TreeNode insertRec(TreeNode root, String value, Comparator<String> comparator) {
        if (root == null) {
            root = new TreeNode(value);
            return root;
        }
        if (comparator.compare(value, root.value) < 0) {
            root.left = insertRec(root.left, value, comparator);
        } else {
            root.right = insertRec(root.right, value, comparator);
        }
        return root;
    }

    List<String> toSortedList() {
        List<String> result = new ArrayList<>();
        inOrderTraversal(root, result);
        return result;
    }

    private void inOrderTraversal(TreeNode node, List<String> result) {
        if (node != null) {
            inOrderTraversal(node.left, result);
            result.add(node.value);
            inOrderTraversal(node.right, result);
        }
    }

    static BinaryTree fromList(List<String> list, Comparator<String> comparator) {
        BinaryTree tree = new BinaryTree();
        for (String value : list) {
            tree.insert(value, comparator);
        }
        return tree;
    }
}

public class TreeBin {
    public static void main(String[] args) {
        List<String> strings = List.of("Это тестовые слова", "Фрукты", "Овощи", "Звери бегут", "Наступает кромешная тьма в аду");

        Comparator<String> wordCountComparator = Comparator.comparingInt(s -> s.split("\\s+").length);
        BinaryTree tree = BinaryTree.fromList(strings, wordCountComparator);
        
        List<String> sortedList = tree.toSortedList();
        sortedList.forEach(System.out::println);
    }
}
