Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7094E6B84
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 01:15:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPjKr37w4z308B
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 11:15:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=CzAwsMun;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.38;
 helo=alexa-out-sd-01.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=CzAwsMun; dkim-atps=neutral
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPjKj3Bddz2xYn
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 11:15:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648167337; x=1679703337;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bEWaoJQcOVP85g1T182Zwzbg7CE38Ki3V1mVgVgM1UI=;
 b=CzAwsMung2X/N5fGgmwFUWorYNHmogOEprQw2/XDLob7NkLIX83ys9Ta
 bfFhIG1c7bM0xRhoQfcTxaPj7dGEKMd55uJ6ZoA6gcqxkxkhfHRAAtpLm
 cg/fFTSQjBsPNaqrvwwW3ZdSkZWRSg/RZT4IWwaLT8nhO/LQih5tIkwxK 8=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Mar 2022 17:15:34 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 17:15:33 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 24 Mar 2022 17:15:33 -0700
Received: from [10.110.37.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 24 Mar
 2022 17:15:32 -0700
Message-ID: <98f13444-d5cd-0396-ae75-439a372e7ab6@quicinc.com>
Date: Thu, 24 Mar 2022 17:15:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ARM: dts: aspeed: add Nuvia DC-SCM BMC
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20220324164551.359570-1-quic_jaehyoo@quicinc.com>
 <YjzhT4gOJ9SKy6q+@lunn.ch> <88849423-c4a5-0a68-1900-72196395704e@quicinc.com>
 <Yjzub26okJosPkXC@lunn.ch> <a70bde19-3ded-d8ae-51ff-ec37fa803b06@quicinc.com>
 <Yj0IbLsebBvZdaZE@lunn.ch>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <Yj0IbLsebBvZdaZE@lunn.ch>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Jamie Iles <quic_jiles@quicinc.com>, Rob Herring <robh+dt@kernel.org>, Graeme
 Gregory <quic_ggregory@quicinc.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 3/24/2022 5:10 PM, Andrew Lunn wrote:
>> The clock delay I mentioned is added into u-boot bootloader in a
>> patch I'm currently trying to submit.
>> https://lore.kernel.org/all/20220324165530.359668-1-quic_jaehyoo@quicinc.com/
> 
> Do you mean this:
> 
> +&scu {
> +	mac0-clk-delay = <0x1d 0x1c
> +			  0x10 0x17
> +			  0x10 0x17>;
> +	mac1-clk-delay = <0x1d 0x10
> +			  0x10 0x10
> +			  0x10 0x10>;
> +	mac2-clk-delay = <0x0a 0x04
> +			  0x08 0x04
> +			  0x08 0x04>;
> +	mac3-clk-delay = <0x0a 0x04
> +			  0x08 0x04
> +			  0x08 0x04>;
> 
> So the MAC is adding the delay. In that case, setting phy-mode to
> rgmii is O.K, but it would be nice to add a comment in DT that the
> bootloader is setting up the MAC to insert the delay.

Right. It would be better with the comment. I'll add the comment in v2.

Thanks for your suggestion!

-Jae
