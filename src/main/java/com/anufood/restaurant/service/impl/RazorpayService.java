package com.anufood.restaurant.service.impl;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class RazorpayService {

    @Value("${razorpay.key}")
    private String razorpayKey;

    @Value("${razorpay.secret}")
    private String razorpaySecret;

    public Order createOrder(double amount, String currency, String receipt) throws Exception {
        RazorpayClient client = new RazorpayClient(razorpayKey, razorpaySecret);
        JSONObject orderRequest = new JSONObject();
        orderRequest.put("amount", (int) (amount * 100)); // convert to paise
        orderRequest.put("currency", currency);
        orderRequest.put("receipt", receipt);
        return client.orders.create(orderRequest);
    }
}
