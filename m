Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 109574E9A07
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 16:43:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRwRy49nVz3c2G
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 01:43:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=SDltuoMX;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com;
 envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=SDltuoMX; dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRwRv09G8z2xm1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 29 Mar 2022 01:43:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648478619; x=1680014619;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DWla+++ZEMsuZw+cSin1iVx3cXWKGoCzaHtISsrEYY8=;
 b=SDltuoMXSZxyWOBbRB/VisKHx36cxeHuBRjtDcM9HC00ISQJ9zA7G8M/
 aydOeuDOyPAOYsSF+5FHUyI4MXSsbL7ZNJ1YasWQcC4QRTtKdDtrnLTkX
 G+yFG4gCPld3ruMBOWTxkyP4hY3oxqG29tswhmJFTQPAYbKeV3Tlcbxr6 Q=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 28 Mar 2022 07:42:37 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 07:42:37 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 28 Mar 2022 07:42:36 -0700
Received: from [10.110.126.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 28 Mar
 2022 07:42:35 -0700
Message-ID: <e7c4a366-6954-def2-03a3-f50232c4404d@quicinc.com>
Date: Mon, 28 Mar 2022 07:42:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/5] ARM: dts: aspeed-g6: add FWQSPI group in pinctrl
 dtsi
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Lunn <andrew@lunn.ch>
References: <20220325154048.467245-1-quic_jaehyoo@quicinc.com>
 <20220325154048.467245-5-quic_jaehyoo@quicinc.com>
 <c681079b-5bc7-4c96-b68b-77214f64a165@www.fastmail.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <c681079b-5bc7-4c96-b68b-77214f64a165@www.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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



On 3/27/2022 8:17 PM, Andrew Jeffery wrote:
> 
> 
> On Sat, 26 Mar 2022, at 02:10, Jae Hyun Yoo wrote:
>> From: Johnny Huang <johnny_huang@aspeedtech.com>
>>
>> Add FWSPIDQ2 and FWSPIDQ3 group to support AST2600 FW SPI quad mode.
>> These pins can be used with dedicated FW SPI pins - FWSPICS0#,
>> FWSPICK, FWSPIMOSI and FWSPIMISO.
>>
>> Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>> ---
>> Changes in v2:
>>   * None.
>>
>>   arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
>> b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
>> index 06d60a8540e9..47c3fb137cbc 100644
>> --- a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
>> @@ -117,6 +117,11 @@ pinctrl_fwspid_default: fwspid_default {
>>   		groups = "FWSPID";
>>   	};
>>
>> +	pinctrl_fwqspi_default: fwqspi_default {
>> +		function = "FWQSPI";
>> +		groups = "FWQSPI";
>> +	};
>> +
> 
> This is okay once you update the binding documentation.

Will add a bindings patch in v3.

Thanks,
Jae

> Andrew
