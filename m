Return-Path: <linux-aspeed+bounces-2531-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3665BF003F
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Oct 2025 10:47:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqpvQ0Njnz3000;
	Mon, 20 Oct 2025 19:46:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760950017;
	cv=none; b=HvuMLOueFnGzjQllSXhkG3BoziviE5+yaPhvnA3nE+ynzVvDDK1UoCiATe+ik8CcYSpeWgKIVkieLzDACWMEz4f9ktcMmrpH0kb+beRJrHLWCf3gCJz0w/Hp5DHE0GzN517MyYDpJ2O2AX1IBCdNWRjeORk26dHKgYYqVAOFyE+xaroe0wkXsAugBS8tcTLW0cJsdyt0fr9+qGJxMFxi499DCos8t2qDC6FJI4g/6OaJKAvezGRguijsMj7zvy6EFDzlx8JZgP2sIq/2YeNzhjrvjU/24AmMph9eoDXXZrX2GZGsR8YLcod/BlFL/7yMyRo9bBTC2SaZQ7lvcVkskw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760950017; c=relaxed/relaxed;
	bh=wGNrLVKL8sHLag446BCtIiKm7R3fNeu6rU4eEyXq7HE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ox8+G3vemAC5f7zRo7xxZNT/rfLBxDr647NZ3HzN37TOpDdjtbD6QbiYA/tvE5M3FnSJ36RJkCDSKV06EKHq9OJrhaoFFfq7xvqQPPh+1nsVdQPajbBVwTleJfPmhlrDvH7yB9oSMjbmjr+Pg0uLSUC6cyVYe0XBhQ7LxeJyBRU8X+8hd8C0cUpds4+VUW8xr+2pQas3wullurGFjjrnM1BTDYlSW3qrPhVKc4d2CS65g5GoYo618YPHrpipHRmQFIH8Bo3WTsVQjYJgkQ/A2q2ckG8KBnYm+X9jeyo79YJ1yb56he7z2Va5GOun8oglfP6DS/28/w6KoW7YP9F96Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YsMVM6ix; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YsMVM6ix;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqpvN6cVyz2ygH
	for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Oct 2025 19:46:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A16E61CDE;
	Mon, 20 Oct 2025 08:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D40C116B1;
	Mon, 20 Oct 2025 08:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760950013;
	bh=/zUg0LVotOY3uOBYmWQ/yWnK7bH3c0ZHmuyyHGGGNqg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=YsMVM6ixdorrhM8hiwRMbBsdtg7YVSmipDjlzs/lHaTZTK2G1Ui8U+N4VqDd/g9eA
	 /G8xmocg8uH5C6uxhkrWFytPhBdPqc/zjqlX5abcKAbgPw22fADTIX4vrzYjX8Z1YS
	 hTgaE4o2H0iBqRzSc0d3o79SqqFyqVnOYgs1IQDENu///l99dht0NWlrFlGjtSyqjw
	 wPc/CFlkdN/JyzYUwwf4zYwqD7hS5RWKMzTIZTDBVeM2lDEkVEyxcoJ+Yg0o2OST2r
	 XGVPij53tzKNGTFGj56yfvwyhoCNQDZr7AYL4z0Dm69L2snTsm6ztcXtyGSHAlFj71
	 8FR9N3gVSJBqg==
Message-ID: <6cf7f86d-00f1-4939-aed0-4f97c1e0fd69@kernel.org>
Date: Mon, 20 Oct 2025 10:46:48 +0200
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: aspeed,ast2x00-scu: allow #size-cells
 range
To: Ryan Chen <ryan_chen@aspeedtech.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251020020745.2004916-1-ryan_chen@aspeedtech.com>
 <b38321e8-d243-460a-a9d6-6770a41627cd@kernel.org>
 <TY2PPF5CB9A1BE6CDC6F04CC0F472FE6451F2F5A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <6b30c646-cc52-4552-8311-86974c1459e7@kernel.org>
 <e7fec714-aa68-49a1-85e5-356115843307@kernel.org>
 <TY2PPF5CB9A1BE65E96ED9C3CE0E8C7A53EF2F5A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <TY2PPF5CB9A1BE658D97FEB9B56E67534DCF2F5A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <TY2PPF5CB9A1BE658D97FEB9B56E67534DCF2F5A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 20/10/2025 10:18, Ryan Chen wrote:
>> Subject: RE: [PATCH] dt-bindings: mfd: aspeed,ast2x00-scu: allow #size-cells
>> range
>>
>>> Subject: Re: [PATCH] dt-bindings: mfd: aspeed,ast2x00-scu: allow
>>> #size-cells range
>>>
>>> On 20/10/2025 08:39, Krzysztof Kozlowski wrote:
>>>> On 20/10/2025 08:31, Ryan Chen wrote:
>>>>>> Subject: Re: [PATCH] dt-bindings: mfd: aspeed,ast2x00-scu: allow
>>>>>> #size-cells range
>>>>>>
>>>>>> On 20/10/2025 04:07, Ryan Chen wrote:
>>>>>>> The #size-cells property in the Aspeed SCU binding is currently
>>>>>>> fixed to a constant value of 1. However, newer SoCs (ex. AST2700)
>>>>>>> may require two size cells to describe certain subregions or
>>>>>>
>>>>>> "may"? So there is no issue yet?
>>>>>
>>>>> while I submit ast2700 platform,
>>>>
>>>> So there is no warning currently? Then don't mention. You cannot use
>>>> argument of possible future warning as there is a warning needing to
>>>> be fixed. This makes no sense. Like you add bug in your patchset and
>>>> then send *different* patch claiming you are fixing a bug.
>>>>
>>>>
>>>>> These warnings appear when validating the AST2700 EVB device tree.
>>>>> The SCU nodes on AST2700 have subdevices (such as clock and reset
>>>>> controllers) that require two address cells, which is not allowed
>>>>> by the current `const: 1` constraint in the schema.
>>>>>
>>>>> Here is the related report:
>>>>>   https://lkml.org/lkml/2025/9/2/1165
>>>>
>>>> This must be together, so we can review entire picture, not pieces
>>>> by pieces. Organize your work correctly, so reviewing will be easy.
>>>>
>>> Anyway, I managed to find your original work and there is no need for
>>> this patch at all. You don't have 64-bit sizes there.
>> Thanks, I will keep #size-cells = <1>; for my next step.
> 
> Hello Krzysztof,
> Sory bothers you again.
> After checking the AST2700 platform memory configuration, it supports up to
> 8GB of DRAM. This requires using `#size-cells = <2>` for the memory node, for
> example:
> 
> 	memory@400000000 {
> 		device_type = "memory";
> 		reg = <0x4 0x00000000 0x0 0x40000000>;
> 	};
> 
> Given this, what would be the proper way to proceed?


I did not comment on memory node. Maybe I looked at wrong node, not
sure, that's why this should not be discussed here but in that DTS
patchset really.

Best regards,
Krzysztof

