Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 982E694CA10
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Aug 2024 08:06:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SmK8ntPi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WgD2R3sNvz2yh1
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Aug 2024 16:06:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SmK8ntPi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WgD2L5RYTz2xps
	for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Aug 2024 16:06:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF72C61652;
	Fri,  9 Aug 2024 06:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43D3C4AF12;
	Fri,  9 Aug 2024 06:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723183608;
	bh=9Sv/E7TaogfsK46oGGI6WRLNH/vB7wN/8ROWS7WWZxo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=SmK8ntPiibU7FqqKBL4OaLBBn4aknumNZPsx5Gz06QSedB/BVG+pehwz2o160rcOM
	 BsKzuXBm1JsoDoygxOZu1oZ5WjXyKT6tpD8LzfspJEVpEO3XnQJvykVcZMAviO5qrn
	 b5L4cf+lv+oTAxePJKoVYyLIRY/xTCLhMN0Ju52ynvDZwTcI3YjGWPZJ+MW80YIQFZ
	 cJm8V3EAF8WGYryOu8pCSPEmHh0XI2hb5wHhTcR+BZpXWcIsrGGqISj7Y40W/0WCmY
	 ofJ0V2beb3w5NaL4XdsbDAE1/G3cKxU3/LByUWjrDjV6rTSTpXy0CRGWPvLNlkQsKK
	 rD0vF9suw1fLQ==
Message-ID: <eec21668-3674-40c6-b443-90c7c02262e3@kernel.org>
Date: Fri, 9 Aug 2024 08:06:41 +0200
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <OS8PR06MB75413728F0FCEE022B4B4F5BF2BA2@OS8PR06MB7541.apcprd06.prod.outlook.com>
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

On 09/08/2024 07:47, Ryan Chen wrote:
>> Subject: Re: [PATCH 3/4] dt-bindings: clock: Add AST2700 clock bindings
>>
>> Le 08/08/2024 à 09:59, Ryan Chen a écrit :
>>> Add dt bindings for AST2700 clock controller
>>>
>>> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
>>> ---
>>>   .../dt-bindings/clock/aspeed,ast2700-clk.h    | 175
>> ++++++++++++++++++
>>>   1 file changed, 175 insertions(+)
>>>   create mode 100644 include/dt-bindings/clock/aspeed,ast2700-clk.h
>>>
>>> diff --git a/include/dt-bindings/clock/aspeed,ast2700-clk.h
>>> b/include/dt-bindings/clock/aspeed,ast2700-clk.h
>>> new file mode 100644
>>> index 000000000000..facf72352c3e
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/aspeed,ast2700-clk.h
>>> @@ -0,0 +1,175 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>> +/*
>>> + * Device Tree binding constants for AST2700 clock controller.
>>> + *
>>> + * Copyright (c) 2024 Aspeed Technology Inc.
>>> + */
>>> +
>>> +#ifndef __DT_BINDINGS_CLOCK_AST2700_H #define
>>> +__DT_BINDINGS_CLOCK_AST2700_H
>>> +
>>> +/* SOC0 clk-gate */
>>> +#define SCU0_CLK_GATE_MCLK (0)
>>> +#define SCU0_CLK_GATE_ECLK (1)
>>> +#define SCU0_CLK_GATE_2DCLK        (2)
>>> +#define SCU0_CLK_GATE_VCLK (3)
>>> +#define SCU0_CLK_GATE_BCLK (4)
>>> +#define SCU0_CLK_GATE_VGA0CLK      (5)
>>> +#define SCU0_CLK_GATE_REFCLK       (6)
>>> +#define SCU0_CLK_GATE_PORTBUSB2CLK (7)
>>> +#define SCU0_CLK_GATE_RSV8 (8)
>>> +#define SCU0_CLK_GATE_UHCICLK      (9)
>>> +#define SCU0_CLK_GATE_VGA1CLK      (10)
>>> +#define SCU0_CLK_GATE_DDRPHYCLK    (11)
>>> +#define SCU0_CLK_GATE_E2M0CLK      (12)
>>> +#define SCU0_CLK_GATE_HACCLK       (13)
>>> +#define SCU0_CLK_GATE_PORTAUSB2CLK (14)
>>> +#define SCU0_CLK_GATE_UART4CLK     (15)
>>> +#define SCU0_CLK_GATE_SLICLK       (16)
>>> +#define SCU0_CLK_GATE_DACCLK       (17)
>>> +#define SCU0_CLK_GATE_DP   (18)
>>> +#define SCU0_CLK_GATE_E2M1CLK      (19)
>>> +#define SCU0_CLK_GATE_CRT0CLK      (20)
>>> +#define SCU0_CLK_GATE_CRT1CLK      (21)
>>> +#define SCU0_CLK_GATE_VLCLK        (22)
>>> +#define SCU0_CLK_GATE_ECDSACLK     (23)
>>> +#define SCU0_CLK_GATE_RSACLK       (24)
>>> +#define SCU0_CLK_GATE_RVAS0CLK     (25)
>>> +#define SCU0_CLK_GATE_UFSCLK       (26)
>>> +#define SCU0_CLK_GATE_EMMCCLK      (27)
>>> +#define SCU0_CLK_GATE_RVAS1CLK     (28)
>>> +/* reserved 29 ~ 31*/

No, you cannot reserve IDs. They are always continous.

>>> +#define SCU0_CLK_GATE_NUM  (SCU0_CLK_GATE_RVAS1CLK + 1)

No, not a binding.

>>> +
>>> +/* SOC0 clk */
>>> +#define SCU0_CLKIN         (SCU0_CLK_GATE_NUM + 0)
>>
>> So SCU0_CLKIN is 28+1+0 = 29 which is said to be reserved in the comment
>> above.
> 
> Acutely, I keep reserved is because data sheet has reserved bits from 29~31.
> If you have concern about it, I can remove the comment.
> Or are you prefer by following?
> #define SCU0_CLK_GATE_RESERVED29        (29)
> #define SCU0_CLK_GATE_RESERVED30        (30)
> #define SCU0_CLK_GATE_RESERVED31        (31)
> #define SCU0_CLK_GATE_NUM       (SCU0_CLK_GATE_RESERVED31 + 1)
> 
>>
>>> +#define SCU0_CLK_24M               (SCU0_CLK_GATE_NUM + 1)
>>> +#define SCU0_CLK_192M              (SCU0_CLK_GATE_NUM + 2)
>>> +#define SCU0_CLK_UART              (SCU0_CLK_GATE_NUM + 3)
>>> +#define SCU0_CLK_PSP               (SCU0_CLK_GATE_NUM + 4)
>>> +#define SCU0_CLK_HPLL              (SCU0_CLK_GATE_NUM + 5)
>>
>> ...
> 
> ************* Email Confidentiality Notice ********************
> 免責聲明:
> 本信件(或其附件)可能包含機密資訊，並受法律保護。如 台端非指定之收件者，請以電子郵件通知本電子郵件之發送者, 並請立即刪除本電子郵件及其附件和銷毀所有複印件。謝謝您的合作!
> 
> DISCLAIMER:
> This message (and any attachments) may contain legally privileged and/or other confidential information. If you have received it in error, please notify the sender by reply e-mail and immediately delete the e-mail and any attachments without copying or disclosing the contents. Thank you.

Maybe I am the intended recipient of your message, maybe not. I don't
want to have any legal questions regarding upstream, public
collaboration, thus probably I should just remove your messages.

Please talk with your IT that such disclaimers in open-source are not
desired (and maybe even harmful).
If you do not understand why, please also see:
https://www.youtube.com/live/fMeH7wqOwXA?si=GY7igfbda6vnjXlJ&t=835

If you need to go around company SMTP server, then consider using b4
web-relay: https://b4.docs.kernel.org/en/latest/contributor/send.html

Please be informed that by responding to this email you agree that all
communications from you and/or your company is made public. In other
words, all messages originating from you and/or your company will be
made public.

Best regards,
Krzysztof

