pragma solidity ^0.5.0;

contract DStorage {
  string public name = "Dstorage";

  uint public fileCount = 0;
  // Mapping fileId=>Struct 
  mapping(uint  =>  File) public files;


  // Struct
  struct File{
    uint fileId;
    string filehash;
    uint fileSize;
    string fileType;
    string fileName;
    string fileDescription;
    uint uploadTime;
    address payable uploader;
  }

  // Event

  event FileUploaded(
    uint fileId,
    string filehash,
    uint fileSize,
    string fileType,
    string fileName,
    string fileDescription,
    uint uploadTime,
    address payable uploader
  );
  constructor() public {
  }

  function uploadFile(string memory _fileHash,uint _fileSize, string memory _fileType, string memory _fileName,string memory _fileDescription ) public {
    // Make sure the file hash exists
    require(bytes(_fileHash).length > 0);
    // Make sure file type exists
    require(bytes(_fileType).length > 0);
    // Make sure file description exists
    require(bytes(_fileDescription).length >0);
    // Make Sure fileName exists
    require(bytes(_fileName).length>0);
    //Make sure uploader address exists
    require(msg.sender!=address(0));
    //File size is more than 0;
    require(_fileSize>0);

    fileCount++;
    files[fileCount]=File(fileCount,_fileHash,_fileSize,_fileType,_fileName,_fileDescription, now, msg.sender);
    // msg time stamp we use by using now


    //Trigger the event
    emit FileUploaded(fileCount,_fileHash,_fileSize,_fileType,_fileName,_fileDescription, now, msg.sender);

  }
  
}