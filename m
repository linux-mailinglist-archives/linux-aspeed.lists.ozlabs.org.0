Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C232866E13
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Feb 2024 10:18:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=ZXxvFiTr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tjw601PRJz3bxZ
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Feb 2024 20:18:48 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=ZXxvFiTr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tjw5w0Yg1z2y1Y
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Feb 2024 20:18:44 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 618F442D0;
	Mon, 26 Feb 2024 01:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1708939116;
	bh=gzTjQUu0dObSt10SZKcdNKoLWfM0zbCV3RKhSxsSPq8=;
	h=From:To:Cc:Subject:Date:From;
	b=ZXxvFiTr5xOW2Y311ZVhtKPovu4hZqyoQl1/TtGUUC1hcFdl0EwBA8isXTKOSCP3p
	 6t5D40EcDe3jD5sDzq3zBCHo+uLyMPc4RdhaerEp6qldfB7MIfUnm9jWzRUiM2kAk4
	 EAK0gx/r0xKgrmHiOTEK+OVa+6RNfzuymNg2skf8=
From: Zev Weiss <zev@bewilderbeest.net>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH] ARM: dts: aspeed: ahe50dc: Update lm25066 regulator name
Date: Mon, 26 Feb 2024 01:17:53 -0800
Message-ID: <20240226091754.16027-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

A recent change to the lm25066 driver changed the name of its
regulator from vout0 to vout; device-tree users of lm25066's regulator
functionality (of which ahe50dc is the only one) thus require a
corresponding update.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts
index 6600f7e9bf5e..93f3be849071 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts
@@ -18,7 +18,7 @@ efuse@##hexaddr {							\
 		reg = <0x##hexaddr>;						\
 		shunt-resistor-micro-ohms = <675>;				\
 		regulators {							\
-			efuse##num: vout0 {					\
+			efuse##num: vout {					\
 				regulator-name = __stringify(efuse##num##-reg);	\
 			};							\
 		};								\
-- 
2.43.2

