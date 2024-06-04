Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE788FA776
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Jun 2024 03:21:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=ZWeHEbLL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtXqZ4kBxz3dRZ
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Jun 2024 11:21:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=ZWeHEbLL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtXqM3V17z3d8D
	for <linux-aspeed@lists.ozlabs.org>; Tue,  4 Jun 2024 11:21:19 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 3BA1BB32;
	Mon,  3 Jun 2024 18:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1717464072;
	bh=P26lzOXZeM9yyamPYPesu/4Mm4BjUKJWIf+/Tw71P6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZWeHEbLLGeX9vffAIldLbJiXgvD2N9gwDoTJIlOMaeo4UYxV5/zZbxGMOi3EDQVAn
	 z3uHq3jDrxYLeyIysZjd4rB0Od4S1R2Gur4WgsI4xIcQbxXqwbW+QgM+Ont/WVtJag
	 h2JC9W6kyIIImYwkXN1YQCe5Jc32jD7+ju+yTRS0=
Date: Mon, 3 Jun 2024 18:21:10 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: convert ASRock SPC621D8HM3 NVMEM
 content to layout syntax
Message-ID: <11f0a9a0-967e-4971-8ca1-4730f2881ee1@hatter.bewilderbeest.net>
References: <20240520063044.4885-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240520063044.4885-1-zajec5@gmail.com>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, May 19, 2024 at 11:30:44PM PDT, Rafał Miłecki wrote:
>From: Rafał Miłecki <rafal@milecki.pl>
>
>Use cleaner (and non-deprecated) bindings syntax. See commit
>bd912c991d2e ("dt-bindings: nvmem: layouts: add fixed-layout") for
>details.
>
>Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>---
> .../dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts     | 12 ++++++++----
> 1 file changed, 8 insertions(+), 4 deletions(-)
>
>diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts
>index 555485871e7a..c4097e4f2ca4 100644
>--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts
>+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts
>@@ -110,11 +110,15 @@ eeprom@50 {
> 		compatible = "st,24c128", "atmel,24c128";
> 		reg = <0x50>;
> 		pagesize = <16>;
>-		#address-cells = <1>;
>-		#size-cells = <1>;
>
>-		eth0_macaddress: macaddress@3f80 {
>-			reg = <0x3f80 6>;
>+		nvmem-layout {
>+			compatible = "fixed-layout";
>+			#address-cells = <1>;
>+			#size-cells = <1>;
>+
>+			eth0_macaddress: macaddress@3f80 {
>+				reg = <0x3f80 6>;
>+			};
> 		};
> 	};
>
>-- 
>2.35.3
>

Acked-by: Zev Weiss <zev@bewilderbeest.net>

