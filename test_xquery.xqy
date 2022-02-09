declare namespace tei = 'http://www.tei-c.org/ns/1.0';

<html>
<head>
<link rel="stylesheet" href="style.css" />
</head>
<body>
<h1>
{
    for $x in //tei:teiHeader//tei:fileDesc//tei:titleStmt
    return <h1>{data($x/tei:title)}</h1>
}
</h1>

<br/>

<table>
<tr>
<th>Edition:</th>
{
    for $x1 in //tei:teiHeader//tei:fileDesc//tei:editionStmt
    return <td>{data($x1/tei:edition)}</td>
}
</tr>
<tr>
<th>Encoding by:</th>
{
    for $x2 in //tei:teiHeader//tei:fileDesc//tei:editionStmt//tei:respStmt
    return <td>{data($x2/tei:name)}</td>
}
</tr>
<tr>
<th>Publisher:</th>
{
    for $x3 in //tei:teiHeader//tei:fileDesc//tei:publicationStmt
    return <td>{data($x3/tei:publisher)}</td>
}
</tr>
<tr>
<th>Language:</th>
{                                                                                           
    for $x4 in //tei:teiHeader//tei:profileDesc//tei:langUsage
    return <td>{data($x4/tei:language)}</td>
}
</tr>
</table>

<br />
<br />

<table>
    <tr>
        <th>Trascrizione:</th>
    </tr>

    <tr>
        <td>
{
    for $utterance in //tei:u
    let $sequenza_testo := $utterance//text()[not(.= $utterance//tei:vocal//text() | $utterance//tei:del//text() | $utterance//tei:sic//text() | $utterance//tei:reg//text() | $utterance//tei:incident//text() | $utterance//tei:kinesic//text() )]
    return 
    if(count($sequenza_testo) = 0) then ""
    else (
        normalize-space( string-join( 
            (
            tokenize($utterance/@who, "#")[2], 
            string(": - "), 
            $sequenza_testo, 
            string(" -")
            )
        ) ),
        <br /> 
    )
}
        </td>
    </tr>
</table>

</body>
</html>
