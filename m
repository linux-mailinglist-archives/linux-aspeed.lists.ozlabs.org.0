Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4619689767
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Feb 2023 11:59:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7XjW4QpHz3f70
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Feb 2023 21:59:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=E+/y6sIh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=E+/y6sIh;
	dkim-atps=neutral
X-Greylist: delayed 313 seconds by postgrey-1.36 at boromir; Fri, 03 Feb 2023 21:59:31 AEDT
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7XjH1R5pz3bjc
	for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Feb 2023 21:59:31 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 2FE0B516;
	Fri,  3 Feb 2023 02:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1675421655;
	bh=buLw3ad81c2bGDDwmuJop4arhCvz79B9rRl4iyMBkpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E+/y6sIhsHuuDYsq5rPCD/gKHXQLIvjtPULaETvCsWeU2VFCcF3fibjNrwY0T2Qmy
	 6FVZDDWpb34oROUVD1kBZLjq/T7xgNURitAGOFx6fHzliIVQRjlHjbvNVO3yv25Wa6
	 JIwQhmoss9J4FzCTlLWJPu8kqR74+KFQfnGNrxKA=
From: Zev Weiss <zev@bewilderbeest.net>
To: Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH 1/2] ARM: dts: aspeed: romed8hm3: Fix GPIO polarity of system-fault LED
Date: Fri,  3 Feb 2023 02:54:04 -0800
Message-Id: <20230203105405.21942-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203105405.21942-1-zev@bewilderbeest.net>
References: <20230203105405.21942-1-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Turns out it's in fact not the same as the heartbeat LED.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Cc: stable@vger.kernel.org # v5.18+
Fixes: a9a3d60b937a ("ARM: dts: aspeed: Add ASRock ROMED8HM3 BMC")
---
 arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
index ff4c07c69af1..00efe1a93a69 100644
--- a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
@@ -31,7 +31,7 @@ heartbeat {
 		};
 
 		system-fault {
-			gpios = <&gpio ASPEED_GPIO(Z, 2) GPIO_ACTIVE_LOW>;
+			gpios = <&gpio ASPEED_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
 			panic-indicator;
 		};
 	};
-- 
2.39.1.236.ga8a28b9eace8

