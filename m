Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37727774FBE
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Aug 2023 02:17:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JSjt8XEr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RL9cB6cKSz309t
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Aug 2023 10:17:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JSjt8XEr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 557 seconds by postgrey-1.37 at boromir; Wed, 09 Aug 2023 10:17:21 AEST
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RL9c16CSBz2y1h
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Aug 2023 10:17:21 +1000 (AEST)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 44F1A20187;
	Wed,  9 Aug 2023 08:07:59 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1691539681;
	bh=6qLqCNRICu2NyTPw0KKNnC7PvvAmPBJh4X1ZTZr4EJg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JSjt8XEr7aLccezZ7hz2yq//uMqicALMQqUct/5ULSgUA3i4ObTRVPYDxnZe/5EKl
	 jd6XoDEj7vbaMmHve7uHHPd6Bui58TQCVOB7ccPNDDVQpxECNhtGZe0tQFXgkFnQmU
	 /wiTplEjRbb0MQqlNKhZ2RBFNOvMnp6FJMXq0e3CRQKnjMjvXmwGz6y97+KGORb0c0
	 DWqvqe1SBfZruvFziYTCSpDhc2AAlBIB2G4UeRvCuU4m9o0Qax2gIRrkWK7QaABykD
	 TtLjhK+DxsGRXWTC2nH84pbNII17Xi0TewOULHLnBGZs3YpkgMvlkz9b5Q8qjGo7g2
	 fFBNlMd+JVL7Q==
Message-ID: <d8d577e91779e045d5a2c7d701f65133a15b5d64.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/3] Add Aspeed AST2600 I3C support
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Dylan Hung <dylan_hung@aspeedtech.com>, alexandre.belloni@bootlin.com, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
  joel@jms.id.au, andrew@aj.id.au, p.zabel@pengutronix.de, 
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Date: Wed, 09 Aug 2023 08:07:58 +0800
In-Reply-To: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
References: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, kobedylan@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Dylan,

> This patch series introduces the necessary changes to enable I3C
> support for the Aspeed AST2600 I3C controller. Specifically, it addresses=
 the
> missing pinctrl configuration and reset control for the I3C
> functionality.

+1 for the pinctrl changes for the I3C1 and I3C2 controllers (I'll
review and ack separately). I have been testing on I3C3 and up, but just
not with the HVI3C on 1 & 2, hence no pinctrl definition there.

However, I don't think the other two are needed.

For 2/3 and 3/3, you're adding a reset control for the global register
block within the per-controller driver, but we can already do that on a
global basis with the existing syscon device. Hence this earlier change:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/drivers/mfd/syscon.c?id=3D7d1e3bd94828ad9fc86f55253cd6fec8edd65394

For this, I have:

    &i3c {
        i3c_global: i3c-global {
            compatible =3D "aspeed,ast2600-i3c-global", "simple-mfd", "sysc=
on";
            resets =3D <&syscon ASPEED_RESET_I3C_DMA>;
            reg =3D <0x0 0x1000>;
        };

        i3c2: i3c-master@4000 {
            compatible =3D "aspeed,ast2600-i3c";
            reg =3D <0x4000 0x1000>;
            clocks =3D <&syscon ASPEED_CLK_GATE_I3C2CLK>;
            pinctrl-names =3D "default";
            pinctrl-0 =3D <&pinctrl_i3c3_default>;
            interrupts =3D <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
            aspeed,global-regs =3D <&i3c_global 2>;
            status =3D "disabled";
        };

        /* ... */
    };

- with no changes needed to any bindings. I haven't needed any other
resets; are there per-controller resets specified in the HW docs you
have?

Does that work for you? If you'd like to test, feel free to use my
sample dts at:

  https://github.com/CodeConstruct/linux/commit/05cac24705fa62d2176ecbbbf15=
d955cfe86e753

Cheers,


Jeremy
