<ul>
{
    for $x in doc("books.xml")/bookstore/book/title
    order by $x
    return <li>{$x}</li>
}
</ul>