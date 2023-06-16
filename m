Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E6D733103
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Jun 2023 14:19:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=aoltxPQ7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjJB30thgz3bfm
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Jun 2023 22:19:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=aoltxPQ7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=gregory.clement@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 868 seconds by postgrey-1.37 at boromir; Fri, 16 Jun 2023 22:19:14 AEST
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjJ9t4RGYz2y1g
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Jun 2023 22:19:14 +1000 (AEST)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 9C473CBEED
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Jun 2023 12:04:51 +0000 (UTC)
X-GND-Sasl: gregory.clement@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686917075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hlCuWySWYgX7Kdg+EfFX5CHUsZ8ytLbktxPmYzXn8j8=;
	b=aoltxPQ7yYUzPN9LsHuCZ8qjAYCsLKBhPseiWeKQ8elWopCJXgKLB4jaHkyMAeyj2dMXU+
	E+jUBZF5V14HHXpxPPSB+4bTrraVQpM0bZ7tEMHxP54CF9+xEssOi/+6RmiDuRTeiFGMfw
	Yaj8X2RJrX/uYjhG4N5xzh1otJSOw2Ye+focZyatLfoyuN+aeJdtbOG7DWQ4E645owENuN
	U/N6yvU2aY82DY2xXZUVU/TYhNyojCnEFplQ7pnvq1zXFOkuWJsA6lOg63qQkW8FhlIAnt
	awzKjpyGVsfLKSL6Ya7uZN6SzzA5giwN3Y807e1EJtDaK8hgViYUnSfEW6fqHw==
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B53220007;
	Fri, 16 Jun 2023 12:04:32 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 3/3] arm64: dts: marvell: Fix pca954x i2c-mux node names
In-Reply-To: <685e7539-0a2b-4bf3-9725-a7a4780c82cb@lunn.ch>
References: <cover.1684856632.git.geert+renesas@glider.be>
 <fed5b15691283ce72ceb9fb074f953c5da0f6852.1684856632.git.geert+renesas@glider.be>
 <685e7539-0a2b-4bf3-9725-a7a4780c82cb@lunn.ch>
Date: Fri, 16 Jun 2023 14:04:32 +0200
Message-ID: <87fs6rhaun.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, linux-aspeed@lists.ozlabs.org, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, Russell King <linux@armlinux.org.uk>, Tali Perry <tali.perry1@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Andrew Lunn <andrew@lunn.ch> writes:

> On Tue, May 23, 2023 at 05:50:21PM +0200, Geert Uytterhoeven wrote:
>> "make dtbs_check":
>>=20
>>     arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: i2c-switch@70: $n=
odename:0: 'i2c-switch@70' does not match '^(i2c-?)?mux'
>> 	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.=
yaml
>>     arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: i2c-switch@70: Un=
evaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c=
@0', 'i2c@1', 'i2c@2' were unexpected)
>> 	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.=
yaml
>>     ...
>>=20
>> Fix this by renaming PCA954x nodes to "i2c-mux", to match the I2C bus
>> multiplexer/switch DT bindings and the Generic Names Recommendation in
>> the Devicetree Specification.
>>=20
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>
>     Andrew

Applied on mvebu/dt64

Thanks,

Gregory

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
