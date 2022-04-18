Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE4450589C
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Apr 2022 16:07:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Khpfx2fMDz2ywF
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Apr 2022 00:07:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=Icac3LZG;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.39;
 helo=alexa-out-sd-02.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=Icac3LZG; dkim-atps=neutral
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Khpfr6c3rz2x9G
 for <linux-aspeed@lists.ozlabs.org>; Tue, 19 Apr 2022 00:07:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650290869; x=1681826869;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cdeeIaTUkflc7ywKWKQ2FVLqMbw9WyQuhVvIi8noo7s=;
 b=Icac3LZGf+u1BNh0f9sFV645wIKcyGjpMDKd1pIUtEQqbB7qmakFFZqj
 QadRty7EC1oNH5063Unrsm0BHYQWI18xfSp69AkoC+JqUkaUjBzEkz/ud
 sI22go2PaqhSIXCtYXoMyfYGFwRhxV6VhhPLT/6SqQfYa3JqkkDejqOC2 w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Apr 2022 07:07:44 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2022 07:07:43 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 18 Apr 2022 07:07:43 -0700
Received: from [10.110.52.91] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 18 Apr
 2022 07:07:42 -0700
Message-ID: <697daba9-c07d-5a41-305e-95b1dcfa1c50@quicinc.com>
Date: Mon, 18 Apr 2022 07:07:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 0/7] Fix AST2600 quad mode SPI pinmux settings
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20220329173932.2588289-1-quic_jaehyoo@quicinc.com>
 <CACRpkdZff-TbnNHO6Q590ubyH51+yqN68DOghazVKvYoHMBekw@mail.gmail.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <CACRpkdZff-TbnNHO6Q590ubyH51+yqN68DOghazVKvYoHMBekw@mail.gmail.com>
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
 Arnd Bergmann <arnd@arndb.de>, Jamie Iles <quic_jiles@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Linus,

On 4/17/2022 4:28 PM, Linus Walleij wrote:
> Hi Jae,
> 
> On Tue, Mar 29, 2022 at 7:40 PM Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
> 
>> Jae Hyun Yoo (5):
>>    pinctrl: pinctrl-aspeed-g6: remove FWQSPID group in pinctrl
>>    dt-bindings: pinctrl: aspeed-g6: remove FWQSPID group
>>    dt-bindings: pinctrl: aspeed-g6: add FWQSPI function/group
>>    pinctrl: pinctrl-aspeed-g6: add FWQSPI function-group
> 
> These four patches applied to the pinctrl tree.
> 
> Please funnel patches 1, 6, 7 through the SoC tree.

Thanks a lot!

Hi Joel,
Can you please include 1, 6 and 7 in the next pull request of Aspeed
SoC tree?

Thanks,
Jae
