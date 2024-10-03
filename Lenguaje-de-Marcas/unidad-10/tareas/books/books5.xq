for $book in doc("books.xml")/bookstore/book/title
let $author := $book/author
return
    <libro>
        {$book/title}
        <autores>{count($author)}</autores>
    </libro>