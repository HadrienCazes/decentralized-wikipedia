pragma solidity ^0.5.0;

contract Wikipedia {

  event NewArticle(string content);

  struct Article {
    string content;
  }

  uint[] public ids;
  mapping (uint => string[]) public historicalArticlesContent;
  mapping (uint => Article) public articlesById;
  mapping (address => uint[]) userOwningArticles;

  constructor() public {
    uint index = 0;
    ids.push(index);
    Article memory newArticle = Article("This is your first article in your contract");
    articlesById[index] = newArticle;
  }

  function articleContent(uint index) public view returns (string memory) {
    return articlesById[index].content;
  }

  function getAllIds() public view returns (uint[] memory) {
    return ids;
  }

  function createArticle(string memory _content) public {
    index = articlesById.push(Article(_content)) - 1;
    ids.push(index);
    userOwningArticles[msg.sender].push(index);
    historicalArticlesContent[_id].push(articlesById[index].content);
    emit NewArticle(_content);
  }

  function readArticleById(uint _id) public views returns (string) {
    return articlesById[_id].content;
  }

  function updateArticle (uint _id, string memory _newContent) public {
    articlesById[_id].content = _newContent;
    historicalArticlesContent[_id].push(articlesById[_id].content);
  }


}
