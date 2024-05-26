fun main(args: Array<String>) {
    var prog = mutableListOf(
        "fun main(args: Array<String>) {",
        "    var prog = mutableListOf(",
        "    )",
        "    println(prog[0]+\"\\n\"+prog[1])",
        "    for(string in prog){",
        "        println(\"\\\"\"+string+\"\\\"\")",
        "    }",
        "    for(i in 2..8) {",
        "        println(prog[i])",
        "    }",
        "}"
    )
    println(prog[0]+"\n"+prog[1])
    for(string in prog){
        println("\""+string+"\"")
    }
    for(i in 2..10) {
        println(prog[i])
    }
}