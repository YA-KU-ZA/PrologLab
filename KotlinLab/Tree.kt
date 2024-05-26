import java.util.*

data class TreeNodeKT(val value: String, var left: TreeNodeKT? = null, var right: TreeNodeKT? = null)

class BinaryTreeKT {
    var root: TreeNodeKT? = null

    fun insert(value: String, comparator: Comparator<String>) {
        root = insertRec(root, value, comparator)
    }

    private fun insertRec(root: TreeNodeKT?, value: String, comparator: Comparator<String>): TreeNodeKT {
        root ?: return TreeNodeKT(value)
        if (comparator.compare(value, root.value) < 0) {
            root.left = insertRec(root.left, value, comparator)
        } else {
            root.right = insertRec(root.right, value, comparator)
        }
        return root
    }

    fun toSortedList(): List<String> {
        val result = mutableListOf<String>()
        inOrderTraversal(root, result)
        return result
    }

    private fun inOrderTraversal(node: TreeNodeKT?, result: MutableList<String>) {
        node?.let {
            inOrderTraversal(it.left, result)
            result.add(it.value)
            inOrderTraversal(it.right, result)
        }
    }

    companion object {
        fun fromList(list: List<String>, comparator: Comparator<String>): BinaryTreeKT {
            val tree = BinaryTreeKT()
            list.forEach { tree.insert(it, comparator) }
            return tree
        }
    }
}

fun main() {
    val strings = listOf("Это тестовые слова", "Фрукты", "Овощи", "Звери бегут", "Наступает кромешная тьма в аду")
    val wordCountComparator = Comparator<String> { s1, s2 -> s1.split("\\s+".toRegex()).size - s2.split("\\s+".toRegex()).size }

    val tree = BinaryTreeKT.fromList(strings, wordCountComparator)
    val sortedList = tree.toSortedList()
    sortedList.forEach { println(it) }
}
