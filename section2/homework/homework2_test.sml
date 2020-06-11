use "homework2.sml";

all_except_option("hello", ["do", "a" ,"hello", "world"]);

get_substitutions1([ ["do", "a" ,"hello", "world"], ["my", "man"], ["hello","found"] ], "hello");

get_substitutions2([ ["do", "a" ,"hello", "world"], ["my", "man"], ["hello","found"] ], "hello");

similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],{first="Fred", middle="W", last="Smith"});