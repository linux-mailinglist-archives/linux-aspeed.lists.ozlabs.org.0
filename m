Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B85034E6A3A
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Mar 2022 22:28:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPddB411Kz30Df
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 08:28:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=PxNgvH5U;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com;
 envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=PxNgvH5U; dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPdd41M3bz2xTr
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 08:28:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648157320; x=1679693320;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oRK599eMaLWKOmJExCWFHKgcOlHaMiKGHB0nq0WnEOA=;
 b=PxNgvH5UYjr7G/+5epuGgsRxxZnmWInrakhA5m8Og8F8yz25iLRodyPL
 pt/l8HCBo0oMWAXZdYHRLXe73ChjsOWHvrTjPa8w3ZoZM6BYakN41/0UJ
 8Ut949xDq2sA/cmYggd1eSFwlTUP8UjNp3Z28Vup73UVLJJf66zTvma8r I=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 24 Mar 2022 14:27:37 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 14:27:36 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 24 Mar 2022 14:27:36 -0700
Received: from [10.110.37.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 24 Mar
 2022 14:27:35 -0700
Message-ID: <88849423-c4a5-0a68-1900-72196395704e@quicinc.com>
Date: Thu, 24 Mar 2022 14:27:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ARM: dts: aspeed: add Nuvia DC-SCM BMC
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20220324164551.359570-1-quic_jaehyoo@quicinc.com>
 <YjzhT4gOJ9SKy6q+@lunn.ch>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <YjzhT4gOJ9SKy6q+@lunn.ch>
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

Hi Andrew,

On 3/24/2022 2:23 PM, Andrew Lunn wrote:
> On Thu, Mar 24, 2022 at 09:45:51AM -0700, Jae Hyun Yoo wrote:
>> From: Graeme Gregory <quic_ggregory@quicinc.com>
>>
>> +&mac2 {
>> +	status = "okay";
>> +
>> +	phy-mode = "rgmii";
> 
> Are you sure about this? That PHY are you using? It is more normal to
> use rgmii-id.

Yes, I'm sure. PHY works with rgmii on my board. I picked a different
clock delay setting too.

Thanks,
Jae

