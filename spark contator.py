
pyspark
pesquisa = sc.textFile:"file(///home/cloudera/Spark_Projeto/contratos.json")
contagem = pesquisa.flatMap(lambda palavra: palavra.split(" ")).filter(lambda palavra: (palavra =="risco"))
contagem = contagem.map(lambda pal: (pal, 1))
contagem = contagem.reduceByKey(lambda a, b: a + b)
contagem.saveAsTextFile("risco")
quit()

hdfs dfs -ls /user/cloudera/risco/
hdfs dfs -cat /user/cloudera/risco/part-00000
