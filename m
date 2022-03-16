Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C4A4DAA44
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Mar 2022 07:03:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJKT33qc0z30Dp
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Mar 2022 17:03:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=qvpEU3yG;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.39;
 helo=alexa-out-sd-02.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=qvpEU3yG; dkim-atps=neutral
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJKSw1Yx3z2yhD
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Mar 2022 17:03:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647410592; x=1678946592;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fe5eidc9KNP30vHZxqVKa+zHY+Tzeiyri5cqRQyVBUA=;
 b=qvpEU3yGq38G1vzsguZ+WiN7iqvwDx4NpbmoPfrJJptMXj8fCpU4mmiZ
 60iy/NaHdM0U2rsdy0da3sQwCXQiINDmWxD6NaPJsqv0tOSfK7KBLb7Z7
 HQLRkSBTfAGvzy+FE5gQwX0AK28PZoQ8UE6pykUa5g5aWJ+Ziks3Dgv9W M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Mar 2022 23:03:09 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 23:03:09 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Mar 2022 23:03:08 -0700
Received: from [10.110.69.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 15 Mar
 2022 23:03:07 -0700
Message-ID: <c75e49ad-8b1d-7cf3-19ec-26c65d7da05c@quicinc.com>
Date: Tue, 15 Mar 2022 23:03:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 3/5] pinctrl: pinctrl-aspeed-g6: add FWQSPI function-group
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, "Rob
 Herring" <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
References: <20220308003745.3930607-1-quic_jaehyoo@quicinc.com>
 <20220308003745.3930607-4-quic_jaehyoo@quicinc.com>
 <700af02b-a220-495f-861a-af10f30b482a@www.fastmail.com>
 <2f283c1e-adad-97c5-cc7c-2f0cf4f67150@quicinc.com>
 <3056f002-4d9a-461e-8a29-12b6742e99fb@www.fastmail.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <3056f002-4d9a-461e-8a29-12b6742e99fb@www.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Johnny Huang <johnny_huang@aspeedtech.com>,
 linux-aspeed@lists.ozlabs.org, Jamie Iles <quic_jiles@quicinc.com>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 3/15/2022 10:45 PM, Andrew Jeffery wrote:
> 
> 
> On Wed, 16 Mar 2022, at 15:35, Jae Hyun Yoo wrote:
>> Hi Andrew,
>>
>> On 3/15/2022 8:33 PM, Andrew Jeffery wrote:
>>>
>>>
>>> On Tue, 8 Mar 2022, at 11:07, Jae Hyun Yoo wrote:
>>>> From: Johnny Huang <johnny_huang@aspeedtech.com>
>>>>
>>>> Add FWSPIDQ2 (AE12) and FWSPIDQ3 (AF12) function-group to support
>>>> AST2600 FW SPI quad mode. These pins can be used with dedicated FW
>>>> SPI pins - FWSPICS0# (AB14), FWSPICK (AF13), FWSPIMOSI (AC14)
>>>> and FWSPIMISO (AB13).
>>>>
>>>> Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
>>>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>>>> ---
>>>>    drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 11 +++++++++--
>>>>    1 file changed, 9 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>>>> b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>>>> index 54064714d73f..80838dc54b3a 100644
>>>> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>>>> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>>>> @@ -1236,12 +1236,17 @@ FUNC_GROUP_DECL(SALT8, AA12);
>>>>    FUNC_GROUP_DECL(WDTRST4, AA12);
>>>>
>>>>    #define AE12 196
>>>> +SIG_EXPR_LIST_DECL_SESG(AE12, FWSPIQ2, FWQSPI, SIG_DESC_SET(SCU438, 4));
>>>>    SIG_EXPR_LIST_DECL_SESG(AE12, GPIOY4, GPIOY4);
>>>> -PIN_DECL_(AE12, SIG_EXPR_LIST_PTR(AE12, GPIOY4));
>>>> +PIN_DECL_(AE12, SIG_EXPR_LIST_PTR(AE12, FWSPIQ2),
>>>> +	  SIG_EXPR_LIST_PTR(AE12, GPIOY4));
>>>>
>>>>    #define AF12 197
>>>> +SIG_EXPR_LIST_DECL_SESG(AF12, FWSPIQ3, FWQSPI, SIG_DESC_SET(SCU438, 5));
>>>>    SIG_EXPR_LIST_DECL_SESG(AF12, GPIOY5, GPIOY5);
>>>> -PIN_DECL_(AF12, SIG_EXPR_LIST_PTR(AF12, GPIOY5));
>>>> +PIN_DECL_(AF12, SIG_EXPR_LIST_PTR(AF12, FWSPIQ3),
>>>> +	  SIG_EXPR_LIST_PTR(AF12, GPIOY5));
>>>> +FUNC_GROUP_DECL(FWQSPI, AE12, AF12);
>>>
>>> The idea behind the quad group was not to define a function for it
>>> specifically, but to re-use the FWSPID function and select the specific
>>> group associated with the specific style of SPI bus you desire. This
>>> way you'd have a pinctrl node like:
>>>
>>> pinctrl_fwqspi_default = {
>>>       function = "FWSPID";
>>>       group = "FWQSPI";
>>> };
>>>
>>> (note the lack of 'Q' in the function name)
>>>
>>> Maybe that's an abuse of groups, but I don't see a need for the
>>> function name to match the group name here, we're still doing SPI.
>>>
>>> This can be seen in the DTS fix that Joel sent (disregarding the mixed
>>> voltage pins problem).
>>>
>>> Thoughts?
>>
>> As you said, FWSPID function in existing code is defined as two groups.
>>
>> GROUP_DECL(FWSPID, Y1, Y2, Y3, Y4);
>> GROUP_DECL(FWQSPID, Y1, Y2, Y3, Y4, AE12, AF12);
>>
>> In case of the FWSPID group, it defines Y1, Y2, Y3 and Y4 pin pads as
>> FWSPI18 pins which can be multiplexed with eMMC so pinctrl driver sets
>> SCU500[3] when we select this group. Also, if we select FWQSPID group,
>> it additionally set AE12 and AF12 pin pads as FWSPIDQ2 and FWSPIDQ3 but
>> these two pins are actually part of FWSPI function group that are
>> exposed as dedicated pins on AST2600 SoC.
>>
>> Joel's patch can fix below pin mux setting error since there was a bug
>> in aspeed-g6-pinctrl.dtsi.
>>
>> [    0.742963] aspeed-g6-pinctrl 1e6e2000.syscon:pinctrl: invalid
>> function FWQSPID in map table
>>
>> But it doesn't fix an improper group selection in pinctrl-aspeed-g6
>> driver.
>>
>> As we saw above, SCU500[3] bit will be set even when we select FWQSPID
>> group, and it's described in datasheets like below.
>>
>> SCU500[3]
>>     Boot from debug SPI (OTPSTRAP[2])
>>     0: Disable (default)
>>     1: Enable
>>     Enable this bit will set CPU to boot from SPI that is attached on pins
>>     FWSPI18*. This strap will not work when secure boot or boot from Uart5
>>     is enabled. This bit is for verification and testing only. Please
>>     don’t enable the OTPSTRAP[2] and protect it by setting OTPCFG30[2]=1
>>     and OTPCFG28[2]=1 if there are security concerns.
>>
>> So if we set this bit once, BMC boot path will be immediately switched
>> to FWSPI18 pins when we don't enable secure boot, and it breaks BMC
>> booting. I observed this issue in my board and AST2600 EVB too.
> 
> Yep, this needs to be fixed.
>>
>> It's not just interface voltage level issue but also boot failure issue
>> if a board uses dedicated FWSPI pins (AB14, AF13, AC14, AB13).
> 
> Okay, I wasn't across that part :)
> 
>>
>> To fix the issue, this commit removes FWQSPID group from FWSPID
>> function, and adds FWQSPI function and group to enable just AE12 and
>> AF12 as FWSPIDQ2 and FWSPIDQ3 to use them with FWSPICS#, FWSPICK,
>> FWSPIMOSI and FWSPIMISO pins.
> 
> Okay, probably wrote what I meant in a confusing way. I understand what
> you've described, but what I was trying to suggest was instead of
> creating a "FWQSPI" function and group was to instead have just the
> "FWSPI" function to be used with both the "FWSPI" and "FWQSPI" groups.
> This aligns with how the FWSPID function/groups work.

FWSPI pins are dedicated pins just for boot firmware SPI interface so
these pins don't need any pinmux setting. We just need to add pinmux
setting of AE12 and AF12 for a case when FWSPI needs QSPI support with
having these additional data pins. Do we need to define two groups
including a dummy group for the dedicated pins? Can you please share
more details of your idea? I don't see any example of dedicated pins in
the driver.

- Jae
