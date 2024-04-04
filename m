Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25064897D74
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Apr 2024 03:42:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Rd7AfLqq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V949L5hM0z3dXW
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Apr 2024 12:41:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Rd7AfLqq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V949G1KVyz3bnv
	for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Apr 2024 12:41:54 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 896E520172;
	Thu,  4 Apr 2024 09:41:49 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1712194911;
	bh=W1rbTsbAAc/AY4aRyLkyhlHpWGVkjcjrUfElUyeAL+U=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Rd7AfLqqaJYPit6Ul8UxmB8t1ecf1btM92WAriPvXV7pbzzbn2zUNTh2jFfru/mBp
	 g7pF0Vz+rmxtckPjnbdR9CwIeHWQvU5yfY7qEmAp0q7N5ZccNZ1eMz56R+KvRaaPMa
	 3s3ZXX74Csgfh7O0sZ86yY/HEMrplzGxldN8Sg54aCiuam152zMnBTXsnSJWeJqkBk
	 I8sTyKvAIah0lsCBmlVRCJrVFCyDr/PUrEkd6YcQQ73wD0VG6zBlWwtVRpnH9m/ZLr
	 XeMHqOMpJvXUWwF87YiAlWwRnFR0NaDMJyD4VvL73ugbL6YNmA3mPTpRceEtStuMdS
	 5arEaLy77C+8w==
Message-ID: <8610e0a8aa5c2916fa04292a10e8a843862ff0ee.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/4] ARM: dts: aspeed: greatlakes: correct Mellanox
 multi-host property
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 04 Apr 2024 12:11:48 +1030
In-Reply-To: <171213860535.16780.4635499105199545058.b4-ty@linaro.org>
References: <20231209104412.12916-1-krzysztof.kozlowski@linaro.org>
	 <171213860535.16780.4635499105199545058.b4-ty@linaro.org>
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

On Wed, 2024-04-03 at 12:04 +0200, Krzysztof Kozlowski wrote:
> On Sat, 09 Dec 2023 11:44:09 +0100, Krzysztof Kozlowski wrote:
> > "mlx,multi-host" is using incorrect vendor prefix and is not documented=
.
> >=20
> >=20
>=20
> These wait for ~4 months and they were not picked up. Let me know if anyo=
ne
> else wants to take these.
>=20
> Applied, thanks!
>=20
> [1/4] ARM: dts: aspeed: greatlakes: correct Mellanox multi-host property
>       https://git.kernel.org/krzk/linux-dt/c/7da85354c4fa35b862294dbbb450=
baeb405b5a92
> [2/4] ARM: dts: aspeed: minerva-cmc: correct Mellanox multi-host property
>       https://git.kernel.org/krzk/linux-dt/c/e515719c17beb9625a90039f6c45=
fa36d58bdda2
> [3/4] ARM: dts: aspeed: yosemite4: correct Mellanox multi-host property
>       https://git.kernel.org/krzk/linux-dt/c/af3deaf9bcb4571feb89a4050c7a=
d75de9aa8e1e
> [4/4] ARM: dts: aspeed: yosemitev2: correct Mellanox multi-host property
>       https://git.kernel.org/krzk/linux-dt/c/cac1c1dda6130771e06ace030b1b=
0ed62096a912
>=20
> Best regards,

Ah, my apologies. Joel's on leave and I'm accumulating patches in a
tree for him in the mean time. I've had some things going on
professionally (changed jobs) and personally, and these fell into a bit
of a hole.

I'm okay for these patches to be integrated through your tree, given
you've already applied them. Feel free to add acks if your branch
allows:

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>

I'm working to stay on top of things a bit more now than I have in the
recent past, so hopefully I won't miss patches again in the future.

Andrew
