Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B80F4DA97B
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Mar 2022 06:05:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJJBk0FXpz30Dp
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Mar 2022 16:05:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=ADhaY6aC;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.38;
 helo=alexa-out-sd-01.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=ADhaY6aC; dkim-atps=neutral
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJJBZ6WgVz3015
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Mar 2022 16:05:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647407143; x=1678943143;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZLhvDT6RWpH9ePgLaw6P1j0KTrfRXSsfYzZ5rGzeatU=;
 b=ADhaY6aCV6u5+jZul/zN9W60486xNnfj1GXfuR1vzkh3oqeUdprnNUP7
 0k/YxxDKW+Bama6evVngVzUlNIr/ARyvesImKQqexi6Z8IvOfmn0+IE2O
 tRCkvNTTEuoKFuJfo/K8IMkndRLKGyxyUKEFNb34nwKA2yG2aTiQdn7Ua g=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Mar 2022 22:05:40 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 22:05:40 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Mar 2022 22:05:39 -0700
Received: from [10.110.69.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 15 Mar
 2022 22:05:38 -0700
Message-ID: <2f283c1e-adad-97c5-cc7c-2f0cf4f67150@quicinc.com>
Date: Tue, 15 Mar 2022 22:05:30 -0700
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
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <700af02b-a220-495f-861a-af10f30b482a@www.fastmail.com>
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

Hi Andrew,

On 3/15/2022 8:33 PM, Andrew Jeffery wrote:
> 
> 
> On Tue, 8 Mar 2022, at 11:07, Jae Hyun Yoo wrote:
>> From: Johnny Huang <johnny_huang@aspeedtech.com>
>>
>> Add FWSPIDQ2 (AE12) and FWSPIDQ3 (AF12) function-group to support
>> AST2600 FW SPI quad mode. These pins can be used with dedicated FW
>> SPI pins - FWSPICS0# (AB14), FWSPICK (AF13), FWSPIMOSI (AC14)
>> and FWSPIMISO (AB13).
>>
>> Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>> ---
>>   drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>> b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>> index 54064714d73f..80838dc54b3a 100644
>> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>> @@ -1236,12 +1236,17 @@ FUNC_GROUP_DECL(SALT8, AA12);
>>   FUNC_GROUP_DECL(WDTRST4, AA12);
>>
>>   #define AE12 196
>> +SIG_EXPR_LIST_DECL_SESG(AE12, FWSPIQ2, FWQSPI, SIG_DESC_SET(SCU438, 4));
>>   SIG_EXPR_LIST_DECL_SESG(AE12, GPIOY4, GPIOY4);
>> -PIN_DECL_(AE12, SIG_EXPR_LIST_PTR(AE12, GPIOY4));
>> +PIN_DECL_(AE12, SIG_EXPR_LIST_PTR(AE12, FWSPIQ2),
>> +	  SIG_EXPR_LIST_PTR(AE12, GPIOY4));
>>
>>   #define AF12 197
>> +SIG_EXPR_LIST_DECL_SESG(AF12, FWSPIQ3, FWQSPI, SIG_DESC_SET(SCU438, 5));
>>   SIG_EXPR_LIST_DECL_SESG(AF12, GPIOY5, GPIOY5);
>> -PIN_DECL_(AF12, SIG_EXPR_LIST_PTR(AF12, GPIOY5));
>> +PIN_DECL_(AF12, SIG_EXPR_LIST_PTR(AF12, FWSPIQ3),
>> +	  SIG_EXPR_LIST_PTR(AF12, GPIOY5));
>> +FUNC_GROUP_DECL(FWQSPI, AE12, AF12);
> 
> The idea behind the quad group was not to define a function for it
> specifically, but to re-use the FWSPID function and select the specific
> group associated with the specific style of SPI bus you desire. This
> way you'd have a pinctrl node like:
> 
> pinctrl_fwqspi_default = {
>      function = "FWSPID";
>      group = "FWQSPI";
> };
> 
> (note the lack of 'Q' in the function name)
> 
> Maybe that's an abuse of groups, but I don't see a need for the
> function name to match the group name here, we're still doing SPI.
> 
> This can be seen in the DTS fix that Joel sent (disregarding the mixed
> voltage pins problem).
> 
> Thoughts?

As you said, FWSPID function in existing code is defined as two groups.

GROUP_DECL(FWSPID, Y1, Y2, Y3, Y4);
GROUP_DECL(FWQSPID, Y1, Y2, Y3, Y4, AE12, AF12);

In case of the FWSPID group, it defines Y1, Y2, Y3 and Y4 pin pads as
FWSPI18 pins which can be multiplexed with eMMC so pinctrl driver sets
SCU500[3] when we select this group. Also, if we select FWQSPID group,
it additionally set AE12 and AF12 pin pads as FWSPIDQ2 and FWSPIDQ3 but
these two pins are actually part of FWSPI function group that are
exposed as dedicated pins on AST2600 SoC.

Joel's patch can fix below pin mux setting error since there was a bug
in aspeed-g6-pinctrl.dtsi.

[    0.742963] aspeed-g6-pinctrl 1e6e2000.syscon:pinctrl: invalid 
function FWQSPID in map table

But it doesn't fix an improper group selection in pinctrl-aspeed-g6
driver.

As we saw above, SCU500[3] bit will be set even when we select FWQSPID
group, and it's described in datasheets like below.

SCU500[3]
   Boot from debug SPI (OTPSTRAP[2])
   0: Disable (default)
   1: Enable
   Enable this bit will set CPU to boot from SPI that is attached on pins
   FWSPI18*. This strap will not work when secure boot or boot from Uart5
   is enabled. This bit is for verification and testing only. Please
   don’t enable the OTPSTRAP[2] and protect it by setting OTPCFG30[2]=1
   and OTPCFG28[2]=1 if there are security concerns.

So if we set this bit once, BMC boot path will be immediately switched
to FWSPI18 pins when we don't enable secure boot, and it breaks BMC
booting. I observed this issue in my board and AST2600 EVB too.

It's not just interface voltage level issue but also boot failure issue
if a board uses dedicated FWSPI pins (AB14, AF13, AC14, AB13).

To fix the issue, this commit removes FWQSPID group from FWSPID
function, and adds FWQSPI function and group to enable just AE12 and
AF12 as FWSPIDQ2 and FWSPIDQ3 to use them with FWSPICS#, FWSPICK,
FWSPIMOSI and FWSPIMISO pins.

Thanks,

-Jae

> Andrew
> 
>>
>>   #define AC12 198
>>   SSSF_PIN_DECL(AC12, GPIOY6, FWSPIABR, SIG_DESC_SET(SCU438, 6));
>> @@ -1911,6 +1916,7 @@ static const struct aspeed_pin_group
>> aspeed_g6_groups[] = {
>>   	ASPEED_PINCTRL_GROUP(FSI2),
>>   	ASPEED_PINCTRL_GROUP(FWSPIABR),
>>   	ASPEED_PINCTRL_GROUP(FWSPID),
>> +	ASPEED_PINCTRL_GROUP(FWQSPI),
>>   	ASPEED_PINCTRL_GROUP(FWSPIWP),
>>   	ASPEED_PINCTRL_GROUP(GPIT0),
>>   	ASPEED_PINCTRL_GROUP(GPIT1),
>> @@ -2152,6 +2158,7 @@ static const struct aspeed_pin_function
>> aspeed_g6_functions[] = {
>>   	ASPEED_PINCTRL_FUNC(FSI2),
>>   	ASPEED_PINCTRL_FUNC(FWSPIABR),
>>   	ASPEED_PINCTRL_FUNC(FWSPID),
>> +	ASPEED_PINCTRL_FUNC(FWQSPI),
>>   	ASPEED_PINCTRL_FUNC(FWSPIWP),
>>   	ASPEED_PINCTRL_FUNC(GPIT0),
>>   	ASPEED_PINCTRL_FUNC(GPIT1),
>> -- 
>> 2.25.1
