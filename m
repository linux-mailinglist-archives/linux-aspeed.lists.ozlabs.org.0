Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0C5979D3E
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Sep 2024 10:51:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6dv229bMz2yYn
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Sep 2024 18:51:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726476700;
	cv=none; b=fIEmqsQTtdV2FzjLdB+lcYBklSeNWUBIP/LJeHFWi8lo51Vd/oFUJg1GB8+7AEnHpJelVaPbMdRuFypZIz8qCbMEH1kHvM88NTq8mI7slNcSfmt+QTm/S6pWSnSjHhJsjrbZWiwfEDbWbN+wvex3CjCJI8X5WqyzFG3d6feXSp4tPbAkDyLIAoyh8TtgVDcW51qcVYYQb3dh70M8Kyiak/S1tOlO8sYTioCuLi4NRVZBtNBl5mwmRGMRBoGDxSkMC0ZCwNcGoDoqzsm0ykAjHY1otjPRgf6/Z4ymxnG7zaHnjDfGT3PjjRCZyQ+jQADYNvdkEVz6hWFnRpQ4bth6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726476700; c=relaxed/relaxed;
	bh=2VKGMQvywo53iwqayGxUUEDVdFIznFixk0xEutTyuuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mqpYbL0h+U0aVg7dmmIRPiHviAWhBBKKKcXSSDXXrI2zxEuL5N7ZBdv9M9hQb7WYb662D8iFVQSfWoqgeigZU564j0GWcadDfGP4oJ4OU3j2K3YVhDdUROpd7uqNunHfHw6t26NbsxieSMEzCLyI3ir7qrxXRW3RmYsugDlFUO7YFBSI2s1x0rVIN3VyF5g8uqmjTtiuA4uM+Le6tTHp6xvgeyjh0MIs7doaw6alplL2qy40n55JXMq4cOlNfdcbbB6oiMSvxhegEc8uoc2e+DYbsxWE6Prj4jGHjj4FKHoK51kt+Irwkj80moPy3Tf6J0fppR+ofvEmAvy5ArTmjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TM4rfEH8; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TM4rfEH8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6dv00nMkz2xY6
	for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Sep 2024 18:51:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CC625C01E3;
	Mon, 16 Sep 2024 08:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C47C4CECC;
	Mon, 16 Sep 2024 08:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726476697;
	bh=LcZFiUUV52PF4FxHHCqNqdlFJWxIaDrzj5Y0u94JfjI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TM4rfEH83WPdA7u7vFtOo9uGSozj6quB/34tXmidSnyUf7bNPCwbWnGOfkNyMYqIi
	 k/mVMpGqWbTv/8TO2vSCW9dkyrf09153ZP1YziWyp++ahnPBxYxOOWe9Ns3R/itWw9
	 /mZpSs00hIF3VRdt4MH37ksDarrMl+dD402/DMIhv/D6QfmsWaIEqhpy+laGCL9DuH
	 8cJr6H9QmSvYO3Ze5VcLAom0QtPufcR4/qEEry5mVLXdM5UUZrJWZGc04FqG0oVE83
	 y1xso08rBrO9OhYgzvJ3kaJMtwBMjnBTZVOmv2r9T+zt5govuQeIAIAEJ+3tz4yjK5
	 lz842OY/TH62g==
Message-ID: <10de03e4-db98-4b5c-9cf6-3f98a5cc0537@kernel.org>
Date: Mon, 16 Sep 2024 10:51:29 +0200
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <TYZPR04MB5853795FDC6497F7E0114E43D69A2@TYZPR04MB5853.apcprd04.prod.outlook.com>
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

On 10/09/2024 10:20, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
> I will revise in v2. Thanks!
>>> +             interrupt-parent = <&gpio0>;
>>> +             interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
>>> +             gpio-line-names =
>>> +             "P48V_OCP_GPIO1","P48V_OCP_GPIO2",
>>
>> Nothing improved here. I already commented about above and this.
>> Implement feedback for all your patches, not only one.
>>
>> Best regards,
>> Krzysztof
> Sorry about that.
> I saw you say "Broken alignment" in v15 patch.
> Would like to ask if the following format meets your expectations?
> +			gpio-line-names =
> +				"P48V_OCP_GPIO1", "P48V_OCP_GPIO2",
> +				"P48V_OCP_GPIO3", "FAN_BOARD_0_REVISION_0_R",

Please read DTS coding style before posting next version of the patch
(or any patch for DTS). This is still not aligned. There is (almost)
never a blank line after '='.

Best regards,
Krzysztof

