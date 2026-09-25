# Razorpay Integration in Django

> Source: https://www.geeksforgeeks.org/python/razorpay-integration-in-django/

Razorpay is a popular payment gateway in India that allows businesses to accept online payments via credit/debit cards, UPI, wallets, and net banking. Integrating Razorpay with Django enables secure and seamless payment processing for your web applications.
Project Setup with Razorpay in Django
Consider a project named 'dj_razorpay' having an app named 'payment', and create a Payment model to track transactions and apply migrations.
In payment/models.py:
from django.db import models
class Payment(models.Model):
    razorpay_order_id = models.CharField(max_length=100, unique=True)
    razorpay_payment_id = models.CharField(max_length=100, blank=True, null=True)
    razorpay_signature = models.CharField(max_length=255, blank=True, null=True)
    amount = models.IntegerField()
    status = models.CharField(max_length=50, default='Created')  # Created, Success, Failed
    created_at = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return f"{self.razorpay_order_id} - {self.status}"
Step 1: Get Razorpay Keys
Create an account on the Razorpay website by signing up with your email address and password. During registration, provide the required basic details such as your phone number. After the account is set up, complete the KYC verification by submitting your identity documents and business details.
Once verified, navigate to the Razorpay Dashboard to obtain the API Key ID and Key Secret, which are required for integration. For live transactions, you will also need to add your bank account details to enable settlements.
Note: After successful verification, you will see a similar user interface as below.
Inside the Razorpay settings screen, select 'Create a new key' to generate your API credentials. This will provide a Key ID and a Key Secret.
At this stage, payments operate in test mode, meaning no real transactions occur and only limited payment methods are available. To enable live transactions and unlock all payment options, complete the KYC verification process and add bank account details. The integration process remains identical for both test and live modes.
Add the 'Key Id' and 'Key Secret' to settings.py file.
RAZOR_KEY_ID = 'YOUR_KEY_ID'
RAZOR_KEY_SECRET = 'YOUR_KEY_SECRET'
Install razorpay's python package:
pip install razorpay
Razorpay Payment Flow
- A Razorpay Order is created from the Django backend.
- The Order ID and other required details are passed to the frontend.
- The user clicks the payment button and completes the transaction using a preferred payment method.
- Razorpay handles both payment success and failure scenarios.
- In case of failure, Razorpay allows the user to retry the payment.
- On successful payment, Razorpay sends a POST request to a callback URL on the Django server.
- The server then verifies the payment signature to ensure authenticity and prevent tampering.
- Once verified, the payment is captured, and a success page is rendered for the user.
Step 2: Views.py
In payment/views.py:
from django.shortcuts import render
from django.conf import settings
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponseBadRequest
import razorpay
from .models import Payment
# Initialize Razorpay client
razorpay_client = razorpay.Client(auth=(settings.RAZOR_KEY_ID, settings.RAZOR_KEY_SECRET))
def homepage(request):
    amount = 20000  # Rs. 200 in paise
    currency = 'INR'
    # Create Razorpay order
    razorpay_order = razorpay_client.order.create(
        dict(amount=amount, currency=currency, payment_capture='0')
    )
    
    # Save order in database
    Payment.objects.create(
        razorpay_order_id=razorpay_order['id'],
        amount=amount,
        status='Created'
    )
    context = {
        'razorpay_order_id': razorpay_order['id'],
        'razorpay_merchant_key': settings.RAZOR_KEY_ID,
        'razorpay_amount': amount,
        'currency': currency,
        'callback_url': '/paymenthandler/'
    }
    return render(request, 'index.html', context)
@csrf_exempt
def paymenthandler(request):
    if request.method == "POST":
        payment_id = request.POST.get('razorpay_payment_id', '')
        razorpay_order_id = request.POST.get('razorpay_order_id', '')
        signature = request.POST.get('razorpay_signature', '')
        params_dict = {
            'razorpay_order_id': razorpay_order_id,
            'razorpay_payment_id': payment_id,
            'razorpay_signature': signature
        }
        try:
            razorpay_client.utility.verify_payment_signature(params_dict)
            
            # GET THE OBJECT: Fetch the payment record from your DB
            payment = Payment.objects.get(razorpay_order_id=razorpay_order_id)
            # CRITICAL ADDITION: Ensure amount is an integer (Paise)
            # Razorpay will throw an error if this is a float or string
            capture_amount = int(payment.amount)
            
            # CAPTURE THE PAYMENT: This prevents the auto-refund
            razorpay_client.payment.capture(payment_id, capture_amount)
            
            # UPDATE RECORD: Save the IDs and mark as Success
            payment.razorpay_payment_id = payment_id
            payment.razorpay_signature = signature
            payment.status = 'Success'
            payment.save()
            return render(request, 'paymentsuccess.html')
        except razorpay.errors.SignatureVerificationError:
            Payment.objects.filter(razorpay_order_id=razorpay_order_id).update(status='Failed')
            return render(request, 'paymentfail.html')
            
        except Exception as e:
            
            return HttpResponseBadRequest(f"Payment Processing Error: {str(e)}")
    else:
        return HttpResponseBadRequest("Invalid request method")
Note: It is necessary to capture the payment, otherwise it would be auto refunded to the payer.
Step 3: Map the views to the urls
In dj_razorpay/urls.py:
from django.contrib import admin
from django.urls import path
from payment import views
urlpatterns = [
    path('', views.homepage, name='index'),
    path('paymenthandler/', views.paymenthandler, name='paymenthandler'),
    path('admin/', admin.site.urls),
]
Step 4: Templates
Pass the Razorpay Order ID along with other options generated in the previous step. Include Razorpay's JavaScript in the template to render the payment window and initialize it with backend-provided options.
Add an event listener to the payment button so the payment window opens when the button is clicked. The payment button is rendered on the homepage. Two additional pages are required to handle payment success and payment failure.
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>GFG</title>
    <style>
      
      * {
        box-sizing: border-box;
        padding: 0px;
        margin: 0px;
        font-family: cursive;
      }
      html,
      body {
        height: 100%;
      }
      body {
        background-color: #f1f5f8;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      .card {
        background-color: white;
        padding: 25px;
        border: 1px solid #bbbbbb;
        border-radius: 5px;
        box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 25%);
      }
      .title {
        text-align: center;
        letter-spacing: 1px;
      }
      .muted {
        color: #8e7f7f;
        display: block;
        margin-bottom: 10px;
        text-align: center;
      }
      .btn_container {
        padding: 20px;
        text-align: center;
      }
      .btn {
        border-radius: 4px;
        cursor: pointer;
        padding: 4px 8px;
        background-color: #ffaaa7;
        color: white;
        font-size: 1.2em;
        font-weight: 600;
        letter-spacing: 1px;
      }
    </style>
  </head>
  <body>
    <div class="card">
      <h1 class="title">Buy Me a Chai ☕</h1>
      <small class="muted"
        >If you like my work, you can support me by donating ₹200</small
      >
      <div class="btn_container">
        <!-- Payment Button -->
        <button class="btn" id="pay-btn">Donate❤️</button>
      </div>
    </div>
  </body>
  
  <!-- Razorpay's Javascript code. -->
  <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
  <script>
    var options = {
      
      // Enter the Key ID generated from the Dashboard
      key: "{{ razorpay_merchant_key }}", 
      
      // Amount is in currency subunits.
      // Default currency is INR. Hence, 
      // 50000 refers to 50000 paise
      amount: "{{ razorpay_amount }}", 
      currency: "{{ currency }}",
      
      // Your/store name.
      name: "Dj Razorpay", 
      
      // Pass the `id` obtained in the response of Step 1
      order_id: "{{ razorpay_order_id }}", 
      callback_url: "{{ callback_url }}",
    };
    
    // initialise razorpay with the options.
    var rzp1 = new Razorpay(options);
    
    // add event listener to the payment button.
    document.getElementById("pay-btn").onclick = function (e) {
      rzp1.open();
      e.preventDefault();
    };
  </script>
</html>
Step 5: Testing
Run the Server:
python manage.py runserver
Visit development URL- http://127.0.0.1:8000
