Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D2D8975FB
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Apr 2024 19:10:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=CosIn5k/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8rqb4dR5z3dWc
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Apr 2024 04:10:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rnplus.nl (client-ip=178.251.25.70; helo=mail.rnplus.nl; envelope-from=renze@rnplus.nl; receiver=lists.ozlabs.org)
X-Greylist: delayed 12596 seconds by postgrey-1.37 at boromir; Thu, 04 Apr 2024 04:10:38 AEDT
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8rqL6NcLz3bsd
	for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Apr 2024 04:10:36 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id 80C6E37949A
	for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Apr 2024 13:37:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1H3EQ1v71hG7 for <linux-aspeed@lists.ozlabs.org>;
	Wed,  3 Apr 2024 15:37:40 +0200 (CEST)
Received: from localhost.localdomain (184-179-179-143.ftth.glasoperator.nl [143.179.179.184])
	by mail.rnplus.nl (Postfix) with ESMTPSA id 2BC6437947E;
	Wed,  3 Apr 2024 15:37:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1712151454; bh=r1SkfVNj9bPZQxz4eJiuARml22W5WexeFCEA4WoTAhE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=CosIn5k/pC1BTczzT1M+4joQcZbp4n7ILWW8+2LUwn+17UFB9/XFtruCrIC/knOkp
	 cz6ov+aZUrGlc2TpXaN9CvqURx13tabctFSqaKWIDf/xwo5vlUI97XZTPBHqpZvVQs
	 bmxf5CeBaVeJN8oXUrN8s/Cgm1tCmivWkrit1rJo=
From: Renze Nicolai <renze@rnplus.nl>
To: renze@rnplus.nl,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH v2 3/3] ARM: dts: Modify I2C bus configuration
Date: Wed,  3 Apr 2024 15:28:53 +0200
Message-ID: <20240403133037.37782-4-renze@rnplus.nl>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403133037.37782-1-renze@rnplus.nl>
References: <20240403133037.37782-1-renze@rnplus.nl>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Enable I2C bus 8 which is exposed on the IPMB_1 connector
on the X570D4U mainboard.

Additionally adds a descriptive comment to I2C busses 1 and 5.

Signed-off-by: Renze Nicolai <renze@rnplus.nl>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
index 66318ef8caae..8dee4faa9e07 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
@@ -162,6 +162,7 @@ &i2c0 {
 };
 
 &i2c1 {
+	/* Hardware monitoring SMBus */
 	status = "okay";
 
 	w83773g@4c {
@@ -219,6 +220,7 @@ i2c4mux0ch3: i2c@3 {
 };
 
 &i2c5 {
+	/* SMBus on BMC connector (BMC_SMB_1) */
 	status = "okay";
 };
 
@@ -243,6 +245,11 @@ eth1_macaddress: macaddress@3f88 {
 	};
 };
 
+&i2c8 {
+	/* SMBus on intelligent platform management bus header (IPMB_1) */
+	status = "okay";
+};
+
 &gfx {
 	status = "okay";
 };
-- 
2.44.0

