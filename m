Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B51A8975FE
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Apr 2024 19:11:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=Z26dLVSh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8rqr6CQMz3dTx
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Apr 2024 04:11:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=Z26dLVSh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rnplus.nl (client-ip=178.251.25.70; helo=mail.rnplus.nl; envelope-from=renze@rnplus.nl; receiver=lists.ozlabs.org)
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8rqP14hCz3d2B
	for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Apr 2024 04:10:37 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id 8E26B379493
	for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Apr 2024 13:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OiV3MC-AxxNu for <linux-aspeed@lists.ozlabs.org>;
	Wed,  3 Apr 2024 15:37:38 +0200 (CEST)
Received: from localhost.localdomain (184-179-179-143.ftth.glasoperator.nl [143.179.179.184])
	by mail.rnplus.nl (Postfix) with ESMTPSA id CBDE337947A;
	Wed,  3 Apr 2024 15:37:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1712151453; bh=J3x6v1j8NItiPEP2ALslVPQ+eLcuXH6rDPyikVVJs7U=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Z26dLVShrOqZaVWeKDgn4w32mfSkcvgNAkOzrO3X9xDzIkQIu66+cACZmAdvbrv86
	 kjr6bffH0ynPQYYIyKPNwQN3B+4GBGuok9EkXfnQORJWkEPYozDDcDaQh61F3YxYbG
	 VMCxGa1Nm6fuT3UzR9LBOMwRqrUOitlAZI+IGJ1E=
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
Subject: [PATCH v2 2/3] ARM: dts: Disable unused ADC channels for Asrock X570D4U BMC
Date: Wed,  3 Apr 2024 15:28:52 +0200
Message-ID: <20240403133037.37782-3-renze@rnplus.nl>
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

Additionally adds labels describing the ADC channels.

Signed-off-by: Renze Nicolai <renze@rnplus.nl>
---
 .../dts/aspeed/aspeed-bmc-asrock-x570d4u.dts  | 29 +++++++++----------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
index dff69d6ff146..66318ef8caae 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
@@ -337,20 +337,17 @@ fan@5 {
 &adc {
 	status = "okay";
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_adc0_default
-				&pinctrl_adc1_default
-				&pinctrl_adc2_default
-				&pinctrl_adc3_default
-				&pinctrl_adc4_default
-				&pinctrl_adc5_default
-				&pinctrl_adc6_default
-				&pinctrl_adc7_default
-				&pinctrl_adc8_default
-				&pinctrl_adc9_default
-				&pinctrl_adc10_default
-				&pinctrl_adc11_default
-				&pinctrl_adc12_default
-				&pinctrl_adc13_default
-				&pinctrl_adc14_default
-				&pinctrl_adc15_default>;
+	pinctrl-0 = <&pinctrl_adc0_default       /* 3VSB */
+			&pinctrl_adc1_default    /* 5VSB */
+			&pinctrl_adc2_default    /* VCPU */
+			&pinctrl_adc3_default    /* VSOC */
+			&pinctrl_adc4_default    /* VCCM */
+			&pinctrl_adc5_default    /* APU-VDDP */
+			&pinctrl_adc6_default    /* PM-VDD-CLDO */
+			&pinctrl_adc7_default    /* PM-VDDCR-S5 */
+			&pinctrl_adc8_default    /* PM-VDDCR */
+			&pinctrl_adc9_default    /* VBAT */
+			&pinctrl_adc10_default   /* 3V */
+			&pinctrl_adc11_default   /* 5V */
+			&pinctrl_adc12_default>; /* 12V */
 };
-- 
2.44.0

