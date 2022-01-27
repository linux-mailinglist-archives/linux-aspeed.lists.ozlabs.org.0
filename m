Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAB149E46E
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jan 2022 15:16:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl2hQ2Tjpz3bTN
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 Jan 2022 01:16:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=Vb/1JFsu;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=Vb/1JFsu; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jl2hJ3Ytmz30NS
 for <linux-aspeed@lists.ozlabs.org>; Fri, 28 Jan 2022 01:16:32 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 67ED547536;
 Thu, 27 Jan 2022 14:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1643292986; x=
 1645107387; bh=rLBv3QykntFzuUYkqEtSY9zTgmUYxAfhQ9108i4BY8s=; b=V
 b/1JFsuuLuaTk+44Of297DKftJ7rpWTrn5hoyW+RKnfZBbTwOnAytRpPiEkId1E1
 uuijX8WOCaowDL+dbc6YiB3a42Zcf8QWtg69O7Kx9uv9z8bx6joNNUckxDlm0UAD
 PR6BPperKzsCELYsGXhbB4k9fiSmugxUGqIA7ES8sI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s_VE7EOE8HL8; Thu, 27 Jan 2022 17:16:26 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 6715C4794F;
 Thu, 27 Jan 2022 17:16:24 +0300 (MSK)
Received: from nb-511.yadro.com (10.199.0.85) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 27
 Jan 2022 17:16:23 +0300
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <andrew@aj.id.au>, <joel@jms.id.au>, <robh+dt@kernel.org>
Subject: [PATCH v2] ARM: dts: aspeed: vegman: remove beeper
Date: Thu, 27 Jan 2022 17:16:04 +0300
Message-ID: <20220127141604.1163-1-a.kartashev@yadro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.0.85]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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
Cc: devicetree@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Beeper definition is a leftover from internal fork and not actual for
upstream kernel. It could be removed both beeper node and corresponded
timer node.
Fixes: 67ac01d03862 ("ARM: dts: aspeed: add device tree for YADRO VEGMAN BMC")

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Andrei Kartashev <a.kartashev@yadro.com>
---
 arch/arm/boot/dts/aspeed-bmc-vegman.dtsi | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-vegman.dtsi b/arch/arm/boot/dts/aspeed-bmc-vegman.dtsi
index 1a5b25b2ea29..8ee4e6aab40e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-vegman.dtsi
+++ b/arch/arm/boot/dts/aspeed-bmc-vegman.dtsi
@@ -79,11 +79,6 @@ power_ok {
 			gpios = <&gpio ASPEED_GPIO(AA, 5) GPIO_ACTIVE_LOW>;
 		};
 	};
-
-	beeper {
-		compatible = "pwm-beeper";
-		pwms = <&timer 5 1000000 0>;
-	};
 };
 
 &fmc {
@@ -165,14 +160,6 @@ &sdhci1 {
 	disable-wp;
 };
 
-&timer {
-	fttmr010,pwm-outputs = <5>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_timer5_default>;
-	#pwm-cells = <3>;
-	status = "okay";
-};
-
 &uart1 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.34.1

