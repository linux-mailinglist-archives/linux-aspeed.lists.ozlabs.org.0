Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE20297C7FC
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 12:32:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8X070WM1z2yN1
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 20:32:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726741957;
	cv=none; b=Cu4MpNbjXR8IbTFRaP1N9jlr4gcV+CrxIsqZpsI3XIm+QbrusbyiRPO5ngv9gkdYQ1Qsn2qmjc9sIvyK0WtE9mui//maAIqEhZcyPLmJr5AD1gPRM8nI4XmXmLQT5deeSagSCOKp/4JDG00JYDeP48Dur0YgnH4RmLWRftQ9daqStMk0IGq+s52L5UALu7m2of2KJWJQTmZXNH+CoH13AL40fru+IrQbIIcZDcK9OeKTxo8CZFGAapTu9sjaX2wLqnTtmbd+wNCGRFjo3Q+rd1sQDOGVZtzd+4oEfGy/2rb4JRrl7roPqB0/0yfRsP48tKgCRWYZCjGxd8AclIy6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726741957; c=relaxed/relaxed;
	bh=/DRaVSaONllFF2fAV7rb8vTe2h+Ac1wSx8o2FAC9XTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Bt8mznTQESymlLNo86+mVebqGNQpyM5B4WJxrVl59heI4YPewQJHr6rRsQZrDB//HygMp9qe5eEMrdbHSJqRKT6LzjtcESYndZPF37CdSjgS5T1CKzu6Hok+l8r2Y80zgQXECQHQUN8eSRxcxeqOM0Lx08ilSBzTRUDFCvJq1URNca8kwymhFfGI+D0DsQODc2FFIGd3rSjgRn1Qv6vfMUy0lGn3g8fEp13/HJuPunyzTDkAZd9q4YBjhL2jAXhi89ZzCHzWuUffASu+RhRKND5VaCDpFNzw19VAi3gt+yHhh2xHxwOmD+l84yYfIOXETmZ/MKpISg8V/MGWmPhJXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q6F8MEm7; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q6F8MEm7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8X0458Bxz2xtp
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Sep 2024 20:32:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B50D5C57EF;
	Thu, 19 Sep 2024 10:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC45FC4CEC4;
	Thu, 19 Sep 2024 10:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726741954;
	bh=Sm9wKOBIOkVaiqfIzSIBtet45x+GxQkkZYHds2rEJIw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=q6F8MEm7FqfgPQTHbF1utKOaDnJQoAvXHnOGVSa0VzYoLkPgX893RJq2DJSq77as6
	 haZak+z1PU1XFMDF1GnVNzjRplOzB9+GAQDY3nP1K8owWwZvTU/ub6oLR9yB71q3cy
	 WXKeukLrfVDeBXwiu6yrmusH2dmMlWM7QZrZGbLMmlzR2uzIm5T3ldK3RHaRIYCdfq
	 Nuw9nAVZn6mHlCNED39KwdcUaWVc7yOpc4oRGvKtkCBh4iXznuQ3qUOR3IB1L8OrUt
	 dTdGyKiuCQt16yaPnlcxLF0sXxamfWV7SxNXu7borO/YPFcgYzgNLoVCnjvpIQt1gC
	 jqPiRHV/NnymA==
Message-ID: <3185f620-28be-49b8-85f4-7ff8dd5ffce0@kernel.org>
Date: Thu, 19 Sep 2024 12:32:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: aspeed: support for AST2700
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au"
 <joel@jms.id.au>, "andrew@codeconstruct.com.au"
 <andrew@codeconstruct.com.au>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
References: <20240916091039.3584505-1-ryan_chen@aspeedtech.com>
 <20240916091039.3584505-2-ryan_chen@aspeedtech.com>
 <9b356379-907c-4112-8e24-1810cfa40ef6@kernel.org>
 <OS8PR06MB75416C23247B7AC64260C0AFF2632@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <f79a48e6-e0ff-453f-98c1-1c5acbe6467d@kernel.org>
 <OS8PR06MB7541FDB6A74119A160B1A57CF2632@OS8PR06MB7541.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <OS8PR06MB7541FDB6A74119A160B1A57CF2632@OS8PR06MB7541.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 19/09/2024 09:13, Ryan Chen wrote:
>> Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: aspeed: support for AST2700
>>
>> On 19/09/2024 08:05, Ryan Chen wrote:
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
>>>>> b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
>>>>> index 86ee69c0f45b..127a357051cd 100644
>>>>> --- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
>>>>> +++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
>>>>> @@ -9,6 +9,8 @@ title: Aspeed System Control Unit
>>>>>  description:
>>>>>    The Aspeed System Control Unit manages the global behaviour of
>>>>> the
>>>> SoC,
>>>>>    configuring elements such as clocks, pinmux, and reset.
>>>>> +  In AST2700 SOC which has two soc connection, each soc have its
>>>>> + own scu  register control, ast2700-scu0 for soc0, ast2700-scu1 for
>> soc1.
>>>>>
>>>>>  maintainers:
>>>>>    - Joel Stanley <joel@jms.id.au>
>>>>> @@ -21,6 +23,8 @@ properties:
>>>>>            - aspeed,ast2400-scu
>>>>>            - aspeed,ast2500-scu
>>>>>            - aspeed,ast2600-scu
>>>>> +          - aspeed,ast2700-scu0
>>>>> +          - aspeed,ast2700-scu1
>>>>>        - const: syscon
>>>>>        - const: simple-mfd
>>>>>
>>>>> @@ -30,10 +34,12 @@ properties:
>>>>>    ranges: true
>>>>>
>>>>>    '#address-cells':
>>>>> -    const: 1
>>>>> +    minimum: 1
>>>>> +    maximum: 2
>>>>>
>>>>>    '#size-cells':
>>>>> -    const: 1
>>>>> +    minimum: 1
>>>>> +    maximum: 2
>>>>
>>>> Why do the children have 64 bit addressing?
>>>
>>> AST2700 is 64bit address, so it also.
>>
>> But why do they need it?
>>
> Sorry, I may not understand your point.

I asked why do you think children require 64-bit addressing, instead of
working with existing 32-bit address.

> Since address-cell = <2>, Do you mean size-cell still 1?

No... although that's another point, how bug address size is there? For
the children?

> If yes. I do the dts check it need size-cells=<2>, when I do address-cells = <2>

Well, I talk about bus and children addressing. It's kind of obvious
that changing one property means using different reg...

Best regards,
Krzysztof

