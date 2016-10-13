require "rubygems"
require "sparql_client"
require 'pp'

qs="
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX dc: <http://purl.org/dc/elements/1.1/>
PREFIX : <http://dbpedia.org/resource/>
PREFIX dbpedia2: <http://dbpedia.org/property/>
PREFIX dbpedia: <http://dbpedia.org/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
SELECT ?name ?birth ?person WHERE {
     ?person dbpedia2:birthPlace <http://dbpedia.org/resource/California> .
     ?person foaf:name ?name .
}
LIMIT 10
"
endpoint="http://dbpedia.org/sparql"
sparql = SPARQL::SPARQLWrapper.new(endpoint)
sparql.setQuery(qs)
ret = sparql.query()
#pp ret
puts ret.response