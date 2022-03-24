Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 129114E6AD0
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Mar 2022 23:41:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPgFD6w1mz307L
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 09:41:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=yKPj5z2w;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com;
 envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=yKPj5z2w; dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPgF66Dzcz2xTr
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 09:41:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648161691; x=1679697691;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=losDnmYPH+h+n7uGC5CzgQ24IUC1SFXLeQexPxfUi0Q=;
 b=yKPj5z2wTap20Z956fHBSJ1RELfK/Sq7kpMw6/iqf+oQ1MOUf5md9dNG
 s63oOAN+cb3m+JAKluoF+LfMkw2TA+2M5n5g0ZdRcr6zLlC8aXwnLungF
 NK0H9Q079cJIkLzS+bWOn855o4eBFvQVbsT8OSxYpS2QtNIo2NGh2nZ7B c=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 24 Mar 2022 15:40:29 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 15:40:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 24 Mar 2022 15:40:28 -0700
Received: from [10.110.37.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 24 Mar
 2022 15:40:27 -0700
Message-ID: <a70bde19-3ded-d8ae-51ff-ec37fa803b06@quicinc.com>
Date: Thu, 24 Mar 2022 15:40:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ARM: dts: aspeed: add Nuvia DC-SCM BMC
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20220324164551.359570-1-quic_jaehyoo@quicinc.com>
 <YjzhT4gOJ9SKy6q+@lunn.ch> <88849423-c4a5-0a68-1900-72196395704e@quicinc.com>
 <Yjzub26okJosPkXC@lunn.ch>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <Yjzub26okJosPkXC@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Jamie Iles <quic_jiles@quicinc.com>, Rob Herring <robh+dt@kernel.org>, Graeme
 Gregory <quic_ggregory@quicinc.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 3/24/2022 3:19 PM, Andrew Lunn wrote:
> On Thu, Mar 24, 2022 at 02:27:34PM -0700, Jae Hyun Yoo wrote:
>> Hi Andrew,
>>
>> On 3/24/2022 2:23 PM, Andrew Lunn wrote:
>>> On Thu, Mar 24, 2022 at 09:45:51AM -0700, Jae Hyun Yoo wrote:
>>>> From: Graeme Gregory <quic_ggregory@quicinc.com>
>>>>
>>>> +&mac2 {
>>>> +	status = "okay";
>>>> +
>>>> +	phy-mode = "rgmii";
>>>
>>> Are you sure about this? That PHY are you using? It is more normal to
>>> use rgmii-id.
>>
>> Yes, I'm sure. PHY works with rgmii on my board. I picked a different
>> clock delay setting too.
> 
> Do you know who is inserting the delay? It looks like rgmii will be
> passed to the PHY. So there are few possibilities here:
> 
> The MAC is adding the delay. Not recommended, but does work. In that
> case, your DT is correct.
> 
> The bootloader or strapping configures the PHY to insert the
> delay. The PHY driver then ignores 'rgmii' and leaves the
> configuration alone. This will break sometime in the future when
> somebody fixes the PHY driver to actually set the PHY to rgmii as
> requested. In this case, both the PHY driver and your DT is broken.
> 
> The board itself inserts the delays by having long tracks. In this
> case, your DT is correct.
> 
> It would be good to understand this, just in case it is the second
> condition.

Thanks for your kind explanation.

The clock delay I mentioned is added into u-boot bootloader in a
patch I'm currently trying to submit.
https://lore.kernel.org/all/20220324165530.359668-1-quic_jaehyoo@quicinc.com/

I had to pick those value with 'rgmii' to make my board work but the
delay is actually different from what AST2600 EVB DT provides. I think
it's caused by a different PCB routing and board characteristic like
you said.

I want to keep this setting as it's acquired from lots of experiments.
It could be changed in case if it needs to be fixed in the future.

Thanks,
Jae
