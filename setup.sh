#curl -H "Content-Type: application/json" -XPUT localhost:9200/_template/mdatahub_project -d @dataflow_prototype/bin/index_template/mdatahub_project.json 
#curl -H "Content-Type: application/json" -XPUT localhost:9200/_template/mdatahub_genome -d @dataflow_prototype/bin/index_template/mdatahub_genome.json

curl -XDELETE http://localhost:9201/bioproject  
curl -XDELETE http://localhost:9201/genome

curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9201/_bulk?pretty' --data-binary @microbiome-data/test/mdatahub_index_project.jsonl_part_000
curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9201/_bulk?pretty' --data-binary @microbiome-data/test/mdatahub_index_genome.jsonl_part_000
