using System;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.Generic;
using AuthorizeNet.Api.Controllers;
using AuthorizeNet.Api.Contracts.V1;
using AuthorizeNet.Api.Controllers.Bases;

namespace Library_and_online_book_store
{
    public class ChargeCreditCard
    {
            public string Run(String ApiLoginID, String ApiTransactionKey,string fname,string lname, decimal amount,string creditcardsno)
            {
               
                string responseStr="";
                Console.WriteLine("Charge Credit Card Sample");

                ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.SANDBOX;

                // define the merchant information (authentication / transaction id)
                ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
                {
                    name = ApiLoginID,
                    ItemElementName = ItemChoiceType.transactionKey,
                    Item = ApiTransactionKey,
                };

            //creditcardno == "4111111111111111"
            

            
             var creditCard = new creditCardType
                {
                
                cardNumber = creditcardsno.ToString(),
                expirationDate = "1028",
                cardCode = "123"
                };
            

            
            var billingAddress = new customerAddressType
                {
                    
                    firstName = fname,
                    lastName = lname,
                    
                };

                //standard api call to retrieve response
                var paymentType = new paymentType { Item = creditCard };

                // Add line Items
                

                var transactionRequest = new transactionRequestType
                {
                    transactionType = transactionTypeEnum.authCaptureTransaction.ToString(),    // charge the card

                    amount = amount,
                    payment = paymentType,
                    billTo = billingAddress,
                   
                };

                var request = new createTransactionRequest { transactionRequest = transactionRequest };

                // instantiate the controller that will call the service
                var controller = new createTransactionController(request);
                controller.Execute();

                // get the response from the service (errors contained if any)
                var response = controller.GetApiResponse();

                // validate response
                if (response != null)
                {
                
                    if (response.messages.resultCode == messageTypeEnum.Ok)
                    {
                        if (response.transactionResponse.messages != null)
                        {
                          
                            Console.WriteLine("Successfully created transaction with Transaction ID: " + response.transactionResponse.transId);
                            Console.WriteLine("Response Code: " + response.transactionResponse.responseCode);
                            Console.WriteLine("Message Code: " + response.transactionResponse.messages[0].code);
                            Console.WriteLine("Description: " + response.transactionResponse.messages[0].description);
                            Console.WriteLine("Success, Auth Code : " + response.transactionResponse.authCode);

                        responseStr = "Successfully created transaction with Transaction ID: " + response.transactionResponse.transId +
                                      "Response Code: " + response.transactionResponse.responseCode + "Message Code: " + response.transactionResponse.messages[0].code +
                                      "Description: " + response.transactionResponse.messages[0].description + "Success, Auth Code : " + response.transactionResponse.authCode;

                        responseStr = "Transaction Successfully";
                        }
                        else
                        {
                            Console.WriteLine("Failed Transaction.");
                            if (response.transactionResponse.errors != null)
                            {
                                Console.WriteLine("Error Code: " + response.transactionResponse.errors[0].errorCode);
                                Console.WriteLine("Error message: " + response.transactionResponse.errors[0].errorText);
                            responseStr = "Error Code: " + response.transactionResponse.errors[0].errorCode + "\n Error message: " + response.transactionResponse.errors[0].errorText;
                            }
                        }
                    }
                    else
                    {
                        Console.WriteLine("Failed Transaction.");
                        if (response.transactionResponse != null && response.transactionResponse.errors != null)
                        {
                            Console.WriteLine("Error Code: " + response.transactionResponse.errors[0].errorCode);
                            Console.WriteLine("Error message: " + response.transactionResponse.errors[0].errorText);
                        responseStr = "Error Code: " + response.transactionResponse.errors[0].errorCode + "\n Error message: " + response.transactionResponse.errors[0].errorText;

                        }
                        else
                        {
                            Console.WriteLine("Error Code: " + response.messages.message[0].code);
                            Console.WriteLine("Error message: " + response.messages.message[0].text);

                        responseStr = "Error Code: " + response.messages.message[0].code + "\n Error message: " + response.messages.message[0].text;
                        }
                    }
                }
                else
                {
                    Console.WriteLine("Null Response.");
                    responseStr = "Null Response.";
                }
            
                return responseStr;
            }
        }
}