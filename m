Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A1E70E1E4
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 May 2023 18:37:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQg2z6V9nz3f79
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 May 2023 02:37:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=qK0XEM+V;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=qK0XEM+V;
	dkim-atps=neutral
X-Greylist: delayed 2507 seconds by postgrey-1.36 at boromir; Wed, 24 May 2023 02:37:23 AEST
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQg2q3Vd8z3chm
	for <linux-aspeed@lists.ozlabs.org>; Wed, 24 May 2023 02:37:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=kJo+8t324vC2q+a67aB2rGxPmkpBQCHm7SDevzOyS8Q=; b=qK
	0XEM+V9xNABsdaZICn9eTS5JgfdpfmMoXWm2ReGg31BgI1CxZ0FA+v6Fl1ZOECz9aapsot0JC79+W
	dMs1vfWFDWFXVlNosDttpt2u2CkxhurriMIfsgQ7lmnUPXDEW+pe9Bho+Rfb79OZA5747+wqnyD6j
	LHilN7kTD+o7lmg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1q1ULw-00Dhmh-4f; Tue, 23 May 2023 17:55:12 +0200
Date: Tue, 23 May 2023 17:55:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 3/3] arm64: dts: marvell: Fix pca954x i2c-mux node
 names
Message-ID: <685e7539-0a2b-4bf3-9725-a7a4780c82cb@lunn.ch>
References: <cover.1684856632.git.geert+renesas@glider.be>
 <fed5b15691283ce72ceb9fb074f953c5da0f6852.1684856632.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fed5b15691283ce72ceb9fb074f953c5da0f6852.1684856632.git.geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, linux-aspeed@lists.ozlabs.org, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, Tali Perry <tali.perry1@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, May 23, 2023 at 05:50:21PM +0200, Geert Uytterhoeven wrote:
> "make dtbs_check":
> 
>     arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: i2c-switch@70: $nodename:0: 'i2c-switch@70' does not match '^(i2c-?)?mux'
> 	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>     arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: i2c-switch@70: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2' were unexpected)
> 	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>     ...
> 
> Fix this by renaming PCA954x nodes to "i2c-mux", to match the I2C bus
> multiplexer/switch DT bindings and the Generic Names Recommendation in
> the Devicetree Specification.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
