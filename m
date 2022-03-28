Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9D74E9977
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 16:27:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRw4s4NZjz3c2S
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 01:27:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=LoOgLDXa;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com;
 envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=LoOgLDXa; dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRw4n2NFJz3c25
 for <linux-aspeed@lists.ozlabs.org>; Tue, 29 Mar 2022 01:27:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648477626; x=1680013626;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lkf0GPAYUWsCTaSy58VIzkIDARnaffeDCbbKcbKulBE=;
 b=LoOgLDXaUjFJcxnF6Zkm7KE6tLWK5pjpj7F/cM1Jn4y/h5c8ZMwFFq7J
 +rPap+gWDQIpnIAKi7Oq1S5uxp2UC1V9h4b/lbpqHJkU9Auy/Y8pLS4qV
 feYGPMCQAnSgAXYOPHQnsQgc/6cBmU6w7Ot6q02n6AeE+UvCUF4fZqhI7 c=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 28 Mar 2022 07:26:04 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 07:26:03 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 28 Mar 2022 07:26:02 -0700
Received: from [10.110.126.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 28 Mar
 2022 07:26:01 -0700
Message-ID: <38f0359d-ccc9-d366-4323-de1224788dd3@quicinc.com>
Date: Mon, 28 Mar 2022 07:26:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/5] ARM: dts: aspeed-g6: remove FWQSPID group in
 pinctrl dtsi
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Lunn <andrew@lunn.ch>
References: <20220325154048.467245-1-quic_jaehyoo@quicinc.com>
 <20220325154048.467245-2-quic_jaehyoo@quicinc.com>
 <f55316d5-43cb-49cd-ba4b-6730c2a9b91c@www.fastmail.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <f55316d5-43cb-49cd-ba4b-6730c2a9b91c@www.fastmail.com>
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
Cc: devicetree@vger.kernel.org, Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Jamie Iles <quic_jiles@quicinc.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On 3/27/2022 8:09 PM, Andrew Jeffery wrote:
> 
> 
> On Sat, 26 Mar 2022, at 02:10, Jae Hyun Yoo wrote:
>> FWSPIDQ2 and FWSPIDQ3 are not part of FWSPI18 interface so remove
>> FWQSPID group in pinctrl dtsi. These pins must be used with the
>> FWSPI pins that are dedicated for boot SPI interface which provides
>> same 3.3v logic level.
>>
>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>> Fixes: 2f6edb6bcb2f ("ARM: dts: aspeed: Fix AST2600 quad spi group")
>> ---
>> Changes in v2:
>>   * Rebased it on the latest.
>>   * Updated 'Fixes' while rebasing it on the latest.
>>
>> Note:
>>   * Removing 'pinctrl_fwqspid_default' doesn't break any existing DT since
>>     it has not been used in any DTs.
> 
> Can you please send a patch to the bindings to drop the broken
> function/group given they never worked and no-one could be using them?

Sure, I'll send a bindings patch too in v3.

Thanks for your review!

-Jae

> Other than that,
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
