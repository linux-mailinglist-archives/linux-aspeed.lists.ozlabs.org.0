Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D74204D0CF6
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Mar 2022 01:47:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCGr05KvBz30gg
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Mar 2022 11:47:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=F3irOaNe;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com;
 envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=F3irOaNe; dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCGqw62M6z2xCp
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Mar 2022 11:47:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646700430; x=1678236430;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uGcKGqwHfe/Z6tE8xFW6teeH3dhDqZawVsdFhmI6nfg=;
 b=F3irOaNe82HNZFSoFtSbis3KS2ARhvVP87Qtr/de2iSck1Ayrck7e0WH
 qEbM9bs9VcEhjvFnRXBUWucI/GGVpl069dDBrpgrUdp//ZuZCSHAupff7
 Fs82GzeOeJDEsoncPZGl5Gc3hOlaGqnR/vFUw1yWRb94NjaIkqije/u1+ c=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 07 Mar 2022 16:46:08 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 16:46:07 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 7 Mar 2022 16:46:07 -0800
Received: from [10.110.30.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Mon, 7 Mar 2022
 16:46:06 -0800
Message-ID: <73a487ed-312b-72b3-4e64-dc580ba80704@quicinc.com>
Date: Mon, 7 Mar 2022 16:46:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] pinctrl: aspeed: Add FWQSPI pinmux
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, "Rob
 Herring" <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
References: <20220308003136.3930466-1-quic_jaehyoo@quicinc.com>
 <d2f125d8-07d1-4bff-8718-7dfba4d8fdb3@www.fastmail.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <d2f125d8-07d1-4bff-8718-7dfba4d8fdb3@www.fastmail.com>
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

Hi Andrew,

On 3/7/2022 4:41 PM, Andrew Jeffery wrote:
> 
> 
> On Tue, 8 Mar 2022, at 11:01, Jae Hyun Yoo wrote:
>> From: Johnny Huang <johnny_huang@aspeedtech.com>
>>
>> AST2600 FW SPI quad mode only need to set AE12 and AF12, no need
>> to set Y1~Y4. FW SPI cs, clk, mosi and miso pins are dedicated.
> 
> They're not dedicated according to the datasheet?
> 
> Can you please look at this patch?
> 
> https://lore.kernel.org/all/20220304011010.974863-1-joel@jms.id.au/

Sorry. Please ignore this patch.
I mistakenly sent this patch while making a patch series.

Please check this patch series instead.
https://lore.kernel.org/linux-arm-kernel/20220308003745.3930607-1-quic_jaehyoo@quicinc.com/T/#t

Thanks,

Jae

> Cheers,
> 
> Andrew
> 
