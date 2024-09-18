Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFCC97B912
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Sep 2024 10:16:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7s1j5B6Jz2yMD
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Sep 2024 18:16:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726647399;
	cv=none; b=RFC49qpFzY9fLwZ2Lieu4Mt4vma+fxi0wdeKrzmX38zH6VKSC9d+7hmVIDBYNlZhJIBL9LV4VWZLyHYFym2paxsW7LbwLBzG4vy+FRQAIH9F8AC6xGkvaVUbK5QAtqSdJ0iRWnRxV3nmNqP7v9JUv773elqu48E0fMDMdsbEDtAWCKM2HbmDBF/XOW6oIrQWkVPVG9CPbCAl7qQOiYRu2Lp2j70tewQCWh0kbqaGPr+VrZYLfxfGlFMlIAthpdLr9xinwD9DAkKB58gDvPOktDl0aCPww+TA7rJH90uLd5CBO2da+/bmrTC6uilTPL3ocIHQMWM+XXMgBsqjhnEV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726647399; c=relaxed/relaxed;
	bh=V1fPSD44jI7vR9GQEMOcTmkczKrBzU2YqVqnRMnleAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cRe5p3+ZfgDeuabTDGU5mHmHcyqj3I5YK125kBscWaabvkP7ah+DGl0tciyoN07AOTUJa0P/EGIFxSU7DQzbUnfqsPARTgZ4nuyNfgpfZML84ImPxjU1YScreQq9Z3y6YzRjApK0e8DfqDIO7QU1o2UQwUcSQs0a5z3x4iGgHnbkvw4/3Ea4e/0ojutXVY2C0un6weAfSX9mVvd7LDSxR/NbZRSqr6Q5PwuGoYJjDUC01FNk04uzJcuZscAXZQCs47m4ujcj5ymS8b0NDoEdrnVvci8Xt0JlnDW8+3cKrwnSKvVSRU9Xl45KXIIfh+Leg9jqf2fpGIgnS6Bv1/OOhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rbUgdib9; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rbUgdib9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7s1f71x3z2xKh
	for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Sep 2024 18:16:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 179CCA403B3;
	Wed, 18 Sep 2024 08:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75288C4CEC3;
	Wed, 18 Sep 2024 08:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726647395;
	bh=rS3yh68+aPmvRr7KeL3WFOG0COqNzn1pj+Gz6AdWruU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rbUgdib977duU6lRpXpPJgA2+aU5s5JbAPqxEi9ejCgLlzpsVmpXHlyg4tX6H+6io
	 mqRXu6BRfaBSWwj45Pzdzx3n4F1dXPIBr/XIzZbI+njoaAo3521ipdUJrF1fxbECrR
	 /AzJo7BsxRmuGClVa42VAcT932QOq1wnlBjuTQHarXxM6WtdfpRS1EQl5L8k7MgRhS
	 FH4+aDauauLHzpvUVep1JxTviueiR87Q3foUMi7oGQ7JTG7AWYWUtnrfv0899uSMyl
	 sexIFV8WktBliOa2ncmm0B5z8ZZAcWs9H8RR8qXeX7kUy1+bJfhRvSL3RtGVxAJhjt
	 S/fBzE/1eEVsg==
Message-ID: <d9268240-4c57-4f5c-8ebb-82abb5ce0e3c@kernel.org>
Date: Wed, 18 Sep 2024 10:16:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: Enable interrupt setting
 for pca9555
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20240910063952.3006665-1-Delphine_CC_Chiu@wiwynn.com>
 <42049344-fafb-4aee-8423-fe09a1a977f2@kernel.org>
 <TYZPR04MB5853795FDC6497F7E0114E43D69A2@TYZPR04MB5853.apcprd04.prod.outlook.com>
 <10de03e4-db98-4b5c-9cf6-3f98a5cc0537@kernel.org>
 <TYZPR04MB58538354F2C7B6C767679308D6622@TYZPR04MB5853.apcprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <TYZPR04MB58538354F2C7B6C767679308D6622@TYZPR04MB5853.apcprd04.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 18/09/2024 05:12, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Monday, September 16, 2024 4:51 PM
>> To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>;
>> patrick@stwcx.xyz; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Joel Stanley
>> <joel@jms.id.au>; Andrew Jeffery <andrew@codeconstruct.com.au>
>> Cc: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>;
>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: Enable interrupt setting
>> for pca9555
>>
>>  [External Sender]
>>
>>  [External Sender]
>>
>> On 10/09/2024 10:20, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
>>> I will revise in v2. Thanks!
>>>>> +             interrupt-parent = <&gpio0>;
>>>>> +             interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
>>>>> +             gpio-line-names =
>>>>> +             "P48V_OCP_GPIO1","P48V_OCP_GPIO2",
>>>>
>>>> Nothing improved here. I already commented about above and this.
>>>> Implement feedback for all your patches, not only one.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>> Sorry about that.
>>> I saw you say "Broken alignment" in v15 patch.
>>> Would like to ask if the following format meets your expectations?
>>> +                     gpio-line-names =
>>> +                             "P48V_OCP_GPIO1",
>> "P48V_OCP_GPIO2",
>>> +                             "P48V_OCP_GPIO3",
>>> + "FAN_BOARD_0_REVISION_0_R",
>>
>> Please read DTS coding style before posting next version of the patch (or any
>> patch for DTS). This is still not aligned. There is (almost) never a blank line
>> after '='.
>>
>> Best regards,
>> Krzysztof
> Hi Krzysztof,
> After checking the DTS coding style, I found the "Indentation" section mentioned that:
> "For arrays spanning across lines, it is preferred to align the continued entries with opening < from the first line."
> 
> Should I align the code with following format? (No blank line after = and use two space to align the ")
> Or would like to ask could you help to provide the dts file that I can follow?

Sure, e.g. qcom/sm8650.dtsi, line 765 or line 796.

Or arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi and
gpio-line-names.

Best regards,
Krzysztof

