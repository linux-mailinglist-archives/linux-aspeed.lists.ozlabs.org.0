Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5101797E478
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 03:02:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBl8X2y8Gz2yRd
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 11:02:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727053354;
	cv=none; b=bk2cSLN4d7KBkgiAZjZio/L9+qOks+5YxSTA6fegfLcJ/75QiOq57aNIWNs/1fF9yszF0AYFL9Rbdm/m1FfK16b01zlXn/8fZZhdTps1TZC0By2eN7/Ly42baK61snaPsjvT3nFg0f1EpQBVA0tME0Fu10nQXze/NGc7bM/Bkav4L+uRbB60lVBb7TaTB5UaZ12lnCFn7nwkU0vKuigdhhNrQP1cOcLK8CWsq4JoSkK7K64BRw6F7kCwYM/o5hq6NHBAVyC6+K6rvEr+E31WTKh4D/TenYOsMKgFwbUVMWN3kl5fW14MfKaecN4W7RQy0hyZhyCqT/ozJvXavSBw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727053354; c=relaxed/relaxed;
	bh=l7Den0zj/MD0EHCURTk8V5blKj2DqStv6HhlLuj4F1I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mtdXvxgCYvygqAhuqf9PnkIe/EK8Ta/XputaiK22d/hkzVvKAnlmUR5ayQDt1ny/cxeZMeWFG9uRc+7g/6UjouxliiErqCMvMW+QnDChUVebjUYf6IASmGLsJrfMpdn5co3uOKLGIC0eNtNTrY3Dko7Ip0/4VHov986GoOCLdKCmQX/pRX9O6n9To7/O01Pmi+QLKj+lVMcAxDe5tiraDlK29m5y0f12EIU5VaCLo7QAMgJp40pRxSXeAa8OTAo/KlnKitKD+fOfz1Er0e0pKYvAmBkoFG2lWmkfoGVEo8kcHyTvFoC+gzRMZKyV51Hgw+/ZqyGwCuYSwmQZ9rHNUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RnbKRmh+; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RnbKRmh+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBl8V4Ndnz2xHx
	for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Sep 2024 11:02:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727053354;
	bh=l7Den0zj/MD0EHCURTk8V5blKj2DqStv6HhlLuj4F1I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RnbKRmh+RYTAHI/I/0kjl5TQ2kbz1D9aM0cdCK0xAwZ9v1IcO8ropbeLn0kxNTz/b
	 y9mpFDXibIreFEPZi1Y35eewnZM9rKIj1EICi9WsHNc8+CO2g+fUqOmkJiz2NUCXh9
	 sjFo/WrL3gZobrnnH3Y2aLvDiQLXjbN/yn7PqsJ3+yquo9SAP/rteBdvYupj65+KD+
	 eF/9iaA05JSqRy+TpnmbWkyE+PtfCVwhGGucpqMPowQ+smhi76AlwKB/rmRPcUPDa9
	 B64ww/IIy7XKqIJEuU6v/ZVxg4Hxs4Yb+/tOAWDTEmp1+r5VoZ5/B+zRxNaSYpSyCp
	 JrCqwJZPoPAzA==
Received: from [192.168.68.112] (ppp118-210-177-92.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.92])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6E25B640E8;
	Mon, 23 Sep 2024 09:02:33 +0800 (AWST)
Message-ID: <a93f32cba7721cc6874d0baf0b29e1cc9bfe15c1.camel@codeconstruct.com.au>
Subject: Re: [PATCH v19 2/2] ARM: dts: aspeed: yosemite4: add mctp config
 and sensors for NIC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Mon, 23 Sep 2024 10:32:32 +0930
In-Reply-To: <20240920070449.3871705-3-Delphine_CC_Chiu@wiwynn.com>
References: <20240920070449.3871705-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240920070449.3871705-3-Delphine_CC_Chiu@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2024-09-20 at 15:04 +0800, Delphine CC Chiu wrote:
> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
>=20
> - Add MCTP config for NIC and remove the unnecessary MCTP config on bus
> 15.
> - Add eeprom for NIC.

There's no suggestion that these are related. Why are they done in the
same commit?

Andrew
