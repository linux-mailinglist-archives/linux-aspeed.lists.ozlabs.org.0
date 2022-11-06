Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDC261E148
	for <lists+linux-aspeed@lfdr.de>; Sun,  6 Nov 2022 10:24:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N4ppH5dhMz3cLg
	for <lists+linux-aspeed@lfdr.de>; Sun,  6 Nov 2022 20:24:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Q8sLcxsl;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Q8sLcxsl;
	dkim-atps=neutral
X-Greylist: delayed 114628 seconds by postgrey-1.36 at boromir; Sun, 06 Nov 2022 20:24:01 AEDT
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N4pp93XKZz3bbb;
	Sun,  6 Nov 2022 20:24:01 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 0E3C3216;
	Sun,  6 Nov 2022 01:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1667726637;
	bh=Q6rA6QGxk4YR7vZUSMP3iZf8lpV6fi2XiRCc0+f8lyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q8sLcxslhia5fk7j7nWLtocYLbLxI7C+mepSmRLlSSBtFMII+h/gi7mrXc9E/2lYt
	 jkYkcyd3TNsi4kVGpRmgOz8HpsOrDlBmpaYrqrgYYKwrTgx4jf04u0w8a5GTJJrKDh
	 80JbCw2oCYBUp45IlW2aZxfLkQohm3M4V1WUJmds=
Date: Sun, 6 Nov 2022 01:23:55 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	soc@kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add Delta AHE-50DC BMC
Message-ID: <Y2d9K1KGM8BcR6Rn@hatter.bewilderbeest.net>
References: <20221105013321.2719-1-zev@bewilderbeest.net>
 <20221105013321.2719-3-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221105013321.2719-3-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Nov 04, 2022 at 06:33:21PM PDT, Zev Weiss wrote:
>This is a 1U Open19 power shelf with six PSUs and 50 12VDC outputs via
>LM25066 efuses.  It's managed by a pair of AST1250 BMCs in a redundant
>active/active configuration using a PCA9541 on each I2C bus to
>arbitrate access between the two.
>
>Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>---
> arch/arm/boot/dts/Makefile                    |    1 +
> .../arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts | 1094 +++++++++++++++++
> 2 files changed, 1095 insertions(+)
> create mode 100644 arch/arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts
>

Hmm -- actually, after posting this I realized that the repetitive efuse 
nodes could be expressed in a much more concise and much less tedious, 
error-prone manner using a preprocessor macro or two; I'll send a v2 
with that approach instead.


Zev

