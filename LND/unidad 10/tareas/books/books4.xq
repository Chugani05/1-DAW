for $x in doc("books.xml")/bookstore/book/title
order by $x
return $x