// document.getRootNode() returns the root node of the document, which is typically the #document object.
// console.log(document_root.childNodes); logs the child nodes of the document, which usually include:
// #documentType (if present, e.g., <!DOCTYPE html>)
// html (the root HTML element)
const document_root = document.getRootNode();
console.log(document_root.childNodes);

// console.log(html_tag.childNodes); logs all child nodes of <html>, which typically include: head, text and body
// Any text nodes (if there's whitespace between elements).
const html_tag = document_root.childNodes[1]; // document_root.childNodes[1] selects the second child of #document, which is <html>
console.log(html_tag); // console.log(html_tag); logs the <html> element
console.log(html_tag.childNodes);

// console.log(head_tag.childNodes); logs all child nodes of <head>, which may include:
// <title>, <meta>, <link>, <script>, etc. Text nodes (whitespace or newlines).
// console.log(head_tag.children); logs only the element children of <head>, ignoring text node
const head_tag = html_tag.childNodes[0]; // html_tag.childNodes[0] selects the first child of <html>, which is the <head> element.
console.log(head_tag.childNodes);
console.log(head_tag.children);

const title_tag = head_tag.children[0]; //selects the first child element of <head>, which is likely <title>.
console.log(title_tag.innerText); //logs the visible text inside <title>. (For <title>, it's the same as textContent.)
console.log(title_tag.textContent);
console.log(title_tag.innerHTML); //logs the inner HTML of <title>, which is just text (since <title> cannot contain nested HTML elements)

console.log(title_tag.parentNode); // logs the parent of <title>, which is <head>.
console.log(title_tag.nextSibling); // logs the next sibling node, which could be: #text or meta link script
console.log(title_tag.nextElementSibling); // logs the next element sibling of <title>, ignoring text nodes

// const body_tag = document.body;
// console.log(body_tag.childNodes);

//dont forget to use defer to get o/p when declared as below
const body_tag = html_tag.childNodes[2];
console.log(body_tag);
console.log(body_tag.children);

const div_tag = body_tag.children[0];
console.log(div_tag);
console.log(div_tag.childNodes); //nodel list when childNodes is used , all text and elements are displayed
console.log(div_tag.children); //html collection when using children only elemnts with no #text

const h1_tag = div_tag.children[0];
console.log(h1_tag);
console.log(h1_tag.innerText);

const p_tag = div_tag.children[1];
console.log(p_tag);
console.log(p_tag.innerText);
