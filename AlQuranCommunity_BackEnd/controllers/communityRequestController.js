const communityRequestModel = require("../DB/models/communityRequest.model");

const requestToCommunity = async (req, res) => {
  try {
    const { communityID, userReqEmail } = req.body;
    
    // قم بإنشاء سجل طلب المجتمع
    const request = await communityRequestModel.create({
      communityID,
      userReqEmail
    });
    
    // إرجاع رد ناجح
    res.status(200).json({ message: "req send sucsses" });
  } catch (error) {
    // إرجاع رد خطأ
    res.status(500).json({ error: "Error!" });
  }
};

const deleteRequest = async (req, res) => {
    console.log("ngfsdmkl,a");
    try {
      const { communityID, userReqEmail } = req.params;
      
      const deletedRequest = await communityRequestModel.destroy({
        where: {
            communityID,
            userReqEmail
        }
      });
      
      if (deletedRequest) {
        // Request deleted successfully
        res.status(200).json({ message: "Request deleted successfully" });
      } else {
        // Request not found
        res.status(404).json({ error: "Request not found" });
      }
    } catch (error) {
      // Internal server error
      res.status(500).json({ error: "Error!" });
    }
  };
  



module.exports = { requestToCommunity, deleteRequest };
