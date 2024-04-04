Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0D689920D
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Apr 2024 01:22:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Q9fzQBfV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9d1g2lsBz3dXZ
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Apr 2024 10:22:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Q9fzQBfV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9d1X01TPz3d2K
	for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Apr 2024 10:22:07 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 17A952009F;
	Fri,  5 Apr 2024 07:22:03 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1712272926;
	bh=DeXkWmpOi6oUYa3S4c0rBgKp2W+RLiC/o+BtoZVa4y0=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Q9fzQBfV+G1TSrVUb3PfB6R/0M7livAjsMyuXMMDxwzmzFUV70CAnhtF/QjKDfVTR
	 7OxiMJbtBUeUSRelXxt/hJY8qQHz1UBq2hm2nv1qe11cbfNYlRqiToGkBvXpX1j0Bo
	 JBgxIKoqYMkyWVNfHRPoG7DSth+2TYkdmISGREiWsC07KpLPAkFV0EqL/nPZgCXISX
	 lBEv3OoPYQAPNwnQQMi3cYQL7iucQm2uz8byiGrKlPiyn7lDpWW247halIBInp0lR2
	 cxzheewfll+rzFBi2ekKZPkqScxPtzNUstslOOfrObc/lquKY68lBSDZMv1LJAA/NV
	 zNt3hz5K9a41Q==
Message-ID: <65060691d4649c4a8da46e5ba762a3c905ade690.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/4] ARM: dts: aspeed: greatlakes: correct Mellanox
 multi-host property
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 05 Apr 2024 09:51:59 +1030
In-Reply-To: <c3902c6e-c38e-4604-b79e-2b5406274d8f@linaro.org>
References: <20231209104412.12916-1-krzysztof.kozlowski@linaro.org>
	 <171213860535.16780.4635499105199545058.b4-ty@linaro.org>
	 <8610e0a8aa5c2916fa04292a10e8a843862ff0ee.camel@codeconstruct.com.au>
	 <c3902c6e-c38e-4604-b79e-2b5406274d8f@linaro.org>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 2024-04-04 at 08:13 +0200, Krzysztof Kozlowski wrote:
> On 04/04/2024 03:41, Andrew Jeffery wrote:
> > On Wed, 2024-04-03 at 12:04 +0200, Krzysztof Kozlowski wrote:
> > > On Sat, 09 Dec 2023 11:44:09 +0100, Krzysztof Kozlowski wrote:
> > > > "mlx,multi-host" is using incorrect vendor prefix and is not docume=
nted.
> > > >=20
> > > >=20
> > >=20
> > > These wait for ~4 months and they were not picked up. Let me know if =
anyone
> > > else wants to take these.
> > >=20
> > > Applied, thanks!
> > >=20
> > > [1/4] ARM: dts: aspeed: greatlakes: correct Mellanox multi-host prope=
rty
> > >       https://git.kernel.org/krzk/linux-dt/c/7da85354c4fa35b862294dbb=
b450baeb405b5a92
> > > [2/4] ARM: dts: aspeed: minerva-cmc: correct Mellanox multi-host prop=
erty
> > >       https://git.kernel.org/krzk/linux-dt/c/e515719c17beb9625a90039f=
6c45fa36d58bdda2
> > > [3/4] ARM: dts: aspeed: yosemite4: correct Mellanox multi-host proper=
ty
> > >       https://git.kernel.org/krzk/linux-dt/c/af3deaf9bcb4571feb89a405=
0c7ad75de9aa8e1e
> > > [4/4] ARM: dts: aspeed: yosemitev2: correct Mellanox multi-host prope=
rty
> > >       https://git.kernel.org/krzk/linux-dt/c/cac1c1dda6130771e06ace03=
0b1b0ed62096a912
> > >=20
> > > Best regards,
> >=20
> > Ah, my apologies. Joel's on leave and I'm accumulating patches in a
> > tree for him in the mean time. I've had some things going on
> > professionally (changed jobs) and personally, and these fell into a bit
> > of a hole.
> >=20
> > I'm okay for these patches to be integrated through your tree, given
> > you've already applied them. Feel free to add acks if your branch
> > allows:
> >=20
> > Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> >=20
> > I'm working to stay on top of things a bit more now than I have in the
> > recent past, so hopefully I won't miss patches again in the future.
>=20
> Stephen reported conflict, although trivial, but maybe better if you
> take them?
>=20

Yeah, happy to.

> I can rebase and resend.

Thanks.

Andrew
