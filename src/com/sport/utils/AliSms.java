package com.sport.utils;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

import java.util.Random;

public class AliSms {

    //初始化ascClient需要的几个参数

    //短信API产品名称（短信产品名固定，无需修改）
    public static final String product = "Dysmsapi";

    //短信API产品域名（接口地址固定，无需修改）
    public static final String domain = "dysmsapi.aliyuncs.com";

    //你的accessKeyId
    public static final String accessKeyId = "LTAIsHMJVPf8sYn6";

    //你的accessKeySecret
    public static final String accessKeySecret = "DUPTlw9fn6yMFcqUuT49xzaSDP5gqz";

    public static void main(String[] args) {
        int random = new Random().nextInt(999999);
        String code = "";
        try {
            code = sendSms("15736259475", random);
        } catch (ClientException e) {
            e.printStackTrace();
        }
        System.out.println("随机验证码为：" + random + "错误码为：" + code);
    }

    public static String sendSms(String number, int random) throws ClientException {
        //设置超时时间-可自行调整
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");

        //初始化ascClient,暂时不支持多region（请勿修改）
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId,
                accessKeySecret);

        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        IAcsClient acsClient = new DefaultAcsClient(profile);

        //组装请求对象
        SendSmsRequest request = new SendSmsRequest();

        //使用post提交
        request.setMethod(MethodType.POST);

        //必填:待发送手机号。支持以逗号分隔的形式进行批量调用，批量上限为1000个手机号码,批量调用相对于单条调用及时性稍有延迟,验证码类型的短信推荐使用单条调用的方式；发送国际/港澳台消息时，接收号码格式为00+国际区号+号码，如“0085200000000”
        request.setPhoneNumbers(number);

        //必填:短信签名-可在短信控制台中找到
        request.setSignName("全民健生公共服务平台");

        //必填:短信模板-可在短信控制台中找到，发送国际/港澳台消息时，请使用国际/港澳台短信模版
        request.setTemplateCode("SMS_143711211");

        //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
        //友情提示:如果JSON中需要带换行符,请参照标准的JSON协议对换行符的要求,比如短信内容中包含\r\n的情况在JSON中需要表示成\\r\\n,否则会导致JSON在服务端解析失败
        request.setTemplateParam("{\"code\": \""+ random +"\"}");

        //可选-上行短信扩展码(扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段)
        //request.setSmsUpExtendCode("90997");
        //可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
        request.setOutId("yourOutId");

        //请求失败这里会抛ClientException异常
        SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);

        if(sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) {
            //请求成功
            System.out.println("验证码发送成功!" + " 验证码为：" + random);
        }else {
            System.out.println("code:" + sendSmsResponse.getCode() +
                    "\nmsg:" + sendSmsResponse.getMessage() +
                    "\nBizID:" + sendSmsResponse.getBizId() +
                    "\nRequestID:" + sendSmsResponse.getRequestId());
        }        
        return sendSmsResponse.getCode();
    }
}
