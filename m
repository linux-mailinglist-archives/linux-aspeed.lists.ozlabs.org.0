Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F7494E857
	for <lists+linux-aspeed@lfdr.de>; Mon, 12 Aug 2024 10:16:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zv7dcZko;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wj6mP42hYz2yGb
	for <lists+linux-aspeed@lfdr.de>; Mon, 12 Aug 2024 18:16:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zv7dcZko;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wj6mJ6RlVz2xfR
	for <linux-aspeed@lists.ozlabs.org>; Mon, 12 Aug 2024 18:16:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 478A1CE0B8E;
	Mon, 12 Aug 2024 08:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC588C4AF0C;
	Mon, 12 Aug 2024 08:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723450573;
	bh=O/R5aFzzV3/ZwXlJb8xWnPgQKFIQzc9UUgmBLzyTBM4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Zv7dcZkog2Wj+jgh/IhZmrLzbdlhQv8kmL3prhF1LdusWQCaBSYbOLIMChpKAJTGA
	 I5EovPdN4AN7jWWxbYXRmyqSu57qxSZ1F0ojaQ30QRPD8RtmzTHj7qiYuPAktOTSeo
	 AcX9usPVAFBKV72NuUZR2ii45vsnUtjsuc+MrIhil8+r1jFA+yyzuyTDLu+MmJjFlN
	 k1WnFBbhUCCzvwH0NA/PqPHtmQ+CTZ1G7ZDe3aZHNwBxaERHuBKbJWGz5e+uv//9gh
	 EjJW7QL/qmiEpR5SSCCLXs2fynxLJFLrZSixU10gZ62k7ooWP2iecBhRh0r2CkftXR
	 s2Gn6iR1usy8g==
Message-ID: <5081c41b-dfbd-49ad-a993-b983d4c339f0@kernel.org>
Date: Mon, 12 Aug 2024 10:16:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: clock: Add AST2700 clock bindings
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <20240808075937.2756733-1-ryan_chen@aspeedtech.com>
 <20240808075937.2756733-4-ryan_chen@aspeedtech.com>
 <14ef9485-54ba-402b-9b90-5f10c1523d4e@wanadoo.fr>
 <OS8PR06MB75413728F0FCEE022B4B4F5BF2BA2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <eec21668-3674-40c6-b443-90c7c02262e3@kernel.org>
 <OS8PR06MB7541CA018C86E262F826B9E5F2BA2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <OS8PR06MB7541B0D9A43B989DC1738F68F2852@OS8PR06MB7541.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <OS8PR06MB7541B0D9A43B989DC1738F68F2852@OS8PR06MB7541.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 12/08/2024 09:26, Ryan Chen wrote:
>> Subject: RE: [PATCH 3/4] dt-bindings: clock: Add AST2700 clock bindings
>>
>>> Subject: Re: [PATCH 3/4] dt-bindings: clock: Add AST2700 clock
>>> bindings
>>>
>>> On 09/08/2024 07:47, Ryan Chen wrote:
>>>>> Subject: Re: [PATCH 3/4] dt-bindings: clock: Add AST2700 clock
>>>>> bindings
>>>>>
>>>>> Le 08/08/2024 à 09:59, Ryan Chen a écrit :
>>>>>> Add dt bindings for AST2700 clock controller
>>>>>>
>>>>>> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
>>>>>> ---
>>>>>>   .../dt-bindings/clock/aspeed,ast2700-clk.h    | 175
>>>>> ++++++++++++++++++
>>>>>>   1 file changed, 175 insertions(+)
>>>>>>   create mode 100644
>>>>>> include/dt-bindings/clock/aspeed,ast2700-clk.h
>>>>>>
>>>>>> diff --git a/include/dt-bindings/clock/aspeed,ast2700-clk.h
>>>>>> b/include/dt-bindings/clock/aspeed,ast2700-clk.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..facf72352c3e
>>>>>> --- /dev/null
>>>>>> +++ b/include/dt-bindings/clock/aspeed,ast2700-clk.h
>>>>>> @@ -0,0 +1,175 @@
>>>>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>>>>> +/*
>>>>>> + * Device Tree binding constants for AST2700 clock controller.
>>>>>> + *
>>>>>> + * Copyright (c) 2024 Aspeed Technology Inc.
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef __DT_BINDINGS_CLOCK_AST2700_H #define
>>>>>> +__DT_BINDINGS_CLOCK_AST2700_H
>>>>>> +
>>>>>> +/* SOC0 clk-gate */
>>>>>> +#define SCU0_CLK_GATE_MCLK (0)
>>>>>> +#define SCU0_CLK_GATE_ECLK (1)
>>>>>> +#define SCU0_CLK_GATE_2DCLK        (2)
>>>>>> +#define SCU0_CLK_GATE_VCLK (3)
>>>>>> +#define SCU0_CLK_GATE_BCLK (4)
>>>>>> +#define SCU0_CLK_GATE_VGA0CLK      (5)
>>>>>> +#define SCU0_CLK_GATE_REFCLK       (6)
>>>>>> +#define SCU0_CLK_GATE_PORTBUSB2CLK (7) #define
>>> SCU0_CLK_GATE_RSV8
>>>>>> +(8)
>>>>>> +#define SCU0_CLK_GATE_UHCICLK      (9)
>>>>>> +#define SCU0_CLK_GATE_VGA1CLK      (10)
>>>>>> +#define SCU0_CLK_GATE_DDRPHYCLK    (11)
>>>>>> +#define SCU0_CLK_GATE_E2M0CLK      (12)
>>>>>> +#define SCU0_CLK_GATE_HACCLK       (13)
>>>>>> +#define SCU0_CLK_GATE_PORTAUSB2CLK (14)
>>>>>> +#define SCU0_CLK_GATE_UART4CLK     (15)
>>>>>> +#define SCU0_CLK_GATE_SLICLK       (16)
>>>>>> +#define SCU0_CLK_GATE_DACCLK       (17)
>>>>>> +#define SCU0_CLK_GATE_DP   (18)
>>>>>> +#define SCU0_CLK_GATE_E2M1CLK      (19)
>>>>>> +#define SCU0_CLK_GATE_CRT0CLK      (20)
>>>>>> +#define SCU0_CLK_GATE_CRT1CLK      (21)
>>>>>> +#define SCU0_CLK_GATE_VLCLK        (22)
>>>>>> +#define SCU0_CLK_GATE_ECDSACLK     (23)
>>>>>> +#define SCU0_CLK_GATE_RSACLK       (24)
>>>>>> +#define SCU0_CLK_GATE_RVAS0CLK     (25)
>>>>>> +#define SCU0_CLK_GATE_UFSCLK       (26)
>>>>>> +#define SCU0_CLK_GATE_EMMCCLK      (27)
>>>>>> +#define SCU0_CLK_GATE_RVAS1CLK     (28)
>>>>>> +/* reserved 29 ~ 31*/
>>>
>>> No, you cannot reserve IDs. They are always continous.
>> I think for mis-understood.
>> I will remove the comment.
>> And keep it is continuous. Thanks.
>>>
>>>>>> +#define SCU0_CLK_GATE_NUM  (SCU0_CLK_GATE_RVAS1CLK + 1)
>>>
>>> No, not a binding.
>>
> I will modify by following.
> 
> #define SCU0_CLK_GATE_RVAS1CLK  (28)
> #define SCU0_CLK_GATE_NUM       (SCU0_CLK_GATE_RVAS1CLK + 1) 

Nothing changed. Still not a binding. Why do you send the same and
expect different result? Drop.

Address feedback sent to you from previous versions of the patchset.
There was never a reply.

Best regards,
Krzysztof

